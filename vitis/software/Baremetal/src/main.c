/******************************************************************************
 * Copyright 2021 Eyke Liegmann, Tobias Schindler, Sebastian Wendel
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 ******************************************************************************/

// Includes from own files
#include "main.h"

// Initialize the global variables
DS_Data Global_Data = {
    .rasv = {
        .halfBridge1DutyCycle = 0.0f,
        .halfBridge2DutyCycle = 0.0f,
        .halfBridge3DutyCycle = 0.0f
    },
    .av.pwm_frequency_hz = UZ_PWM_FREQUENCY,
    .av.isr_samplerate_s = (1.0f / UZ_PWM_FREQUENCY) * (Interrupt_ISR_freq_factor),
    .aa = {.A1 = {.cf.ADC_A1 = 10.0f, .cf.ADC_A2 = 10.0f, .cf.ADC_A3 = 10.0f, .cf.ADC_A4 = 10.0f, .cf.ADC_B5 = 10.0f, .cf.ADC_B6 = 10.0f, .cf.ADC_B7 = 10.0f, .cf.ADC_B8 = 10.0f},
    	   .A2 = {.cf.ADC_A1 = 10.0f, .cf.ADC_A2 = 10.0f, .cf.ADC_A3 = 10.0f, .cf.ADC_A4 = 10.0f, .cf.ADC_B5 = 10.0f, .cf.ADC_B6 = 10.0f, .cf.ADC_B7 = 10.0f, .cf.ADC_B8 = 10.0f},
		   .A3 = {.cf.ADC_A1 = 10.0f, .cf.ADC_A2 = 10.0f, .cf.ADC_A3 = 10.0f, .cf.ADC_A4 = 10.0f, .cf.ADC_B5 = 10.0f, .cf.ADC_B6 = 10.0f, .cf.ADC_B7 = 10.0f, .cf.ADC_B8 = 10.0f}
    }
};

//ParameterID Code
uz_ParameterID_t* ParameterID = NULL;
uz_ParameterID_Data_t PID_Data = { 0 };
uz_FOC* FOC_instance = NULL;
uz_PI_Controller* SpeedControl_instance = NULL;

enum init_chain
{
    init_assertions = 0,
    init_gpios,
    init_software,
    init_ip_cores,
    print_msg,
    init_interrupts,
    infinite_loop
};
enum init_chain initialization_chain = init_assertions;

int main(void)
{
    int status = UZ_SUCCESS;
    while (1)
    {
        switch (initialization_chain)
        {
        case init_assertions:
            uz_assert_configuration(); // This has to be the first line of code in main.c
            initialization_chain = init_gpios;
            break;
        case init_gpios:
            Initialize_AXI_GPIO();               // This has to be the second line of code in main.c since the assertion callback uses the AXI_GPIO to disable the system
            uz_frontplane_button_and_led_init(); // This has to be the third line of code since the assertion callback uses the LEDs to indicate an error
            initialization_chain = init_software;
            break;
        case init_software:
            Initialize_Timer();
            uz_SystemTime_init();
			ParameterID = uz_ParameterID_init(&PID_Data);
			struct uz_PI_Controller_config config_id = { .Kp = PID_Data.GlobalConfig.Kp_id, .Ki = PID_Data.GlobalConfig.Ki_id, .samplingTime_sec = 0.00005f, .upper_limit = 15.0f,
			                .lower_limit = -15.0f };
			struct uz_PI_Controller_config config_iq = { .Kp = PID_Data.GlobalConfig.Kp_iq, .Ki = PID_Data.GlobalConfig.Ki_iq, .samplingTime_sec = 0.00005f, .upper_limit = 15.0f,
			                .lower_limit = -15.0f };
			struct uz_PI_Controller_config config_n = { .Kp = PID_Data.GlobalConfig.Kp_n, .Ki = PID_Data.GlobalConfig.Ki_n, .samplingTime_sec = 0.00005f, .upper_limit = 10.0f,
			                .lower_limit = -10.0f };
			struct uz_FOC_config config_FOC = { .config_PMSM = PID_Data.GlobalConfig.PMSM_config, .config_id = config_id, .config_iq = config_iq };
			FOC_instance = uz_FOC_init(config_FOC);
			SpeedControl_instance = uz_SpeedControl_init(config_n);
            JavaScope_initalize(&Global_Data);
            initialization_chain = init_ip_cores;
            break;
        case init_ip_cores:
            uz_adcLtc2311_ip_core_init();
            Global_Data.objects.deadtime_interlock_d1 = uz_interlockDeadtime2L_staticAllocator_slotD1();
            uz_interlockDeadtime2L_set_enable_output(Global_Data.objects.deadtime_interlock_d1, true);
            Global_Data.objects.pwm_d1 = initialize_pwm_2l_on_D1();
            Global_Data.objects.mux_axi = initialize_uz_mux_axi();
            PWM_3L_Initialize(&Global_Data); // three-level modulator
            initialize_incremental_encoder_ipcore_on_D5(UZ_D5_INCREMENTAL_ENCODER_RESOLUTION, UZ_D5_MOTOR_POLE_PAIR_NUMBER);
            initialization_chain = print_msg;
            break;
        case print_msg:
            uz_printf("\r\n\r\n");
            uz_printf("Welcome to the UltraZohm\r\n");
            uz_printf("----------------------------------------\r\n");
            initialization_chain = init_interrupts;
            break;
        case init_interrupts:
            uz_axigpio_enable_datamover();
            Initialize_ISR(); // Initialize the Interrupts and enable them - last line of code before infinite loop
            initialization_chain = infinite_loop;
            break;
        case infinite_loop:
            ultrazohm_state_machine_step();
            break;
        default:
            break;
        }

		if (PID_Data.OnlineID_Output->clean_array == true) {
			uz_ParameterID_CleanPsiArray(ParameterID, &PID_Data);
		}
		if (PID_Data.calculate_flux_maps == true) {
			uz_ParameterID_CalcFluxMaps(ParameterID, &PID_Data);
			PID_Data.calculate_flux_maps = false;
		}
    }
    return (status);
}
