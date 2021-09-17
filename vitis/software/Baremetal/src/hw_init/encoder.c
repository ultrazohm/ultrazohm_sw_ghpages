/******************************************************************************
* Copyright 2021 Eyke Liegmann, Sebastian Wendel, Tobias Schindler
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

#include <stdint.h>
#include <math.h>
#include "../include/encoder.h"
#include "../IP_Cores/uz_incrementalEncoder/uz_incrementalEncoder.h"

// Declares pointer to instance on file scope. DO NOT DO THIS! Just done here to be compatible to the rest of the legacy code in this file!
static uz_incrementalEncoder_t* encoder_D5;

// Just for debugging & testing
static float debug_omega=0.0f;
static float debug_theta_el=0.0f;
static uint32_t debug_position_mech=0.0f;

//----------------------------------------------------
// INITIALIZE & SET THE ENCODER
//----------------------------------------------------
void Encoder_Incremental_Initialize(DS_Data* data){
	struct uz_incrementalEncoder_config encoder_D5_config={
		.base_address=XPAR_INCREENCODER_V24_IP_0_BASEADDR,
		.ip_core_frequency_Hz=50000000U,
		.line_number_per_turn_mech=data->mrp.incrementalEncoderResolution,
		.OmegaPerOverSample_in_rpm=500.0f,
		.drive_pole_pair=data->mrp.motorPolePairNumber
	};
	encoder_D5=uz_incrementalEncoder_init(encoder_D5_config);
}

//Initialize the variables for the speed encoder
static float fSpeed_rpm_Buf[SPEED_BUF_SIZE] = {0.0f,0.0f};
static size_t buffer_counter =0U;
static float speed_mean_rpm = 0.0f;

void Encoder_UpdateSpeedPosition(DS_Data* data){	// update speed and position in global data struct
	debug_omega=uz_incrementalEncoder_get_omega(encoder_D5);
	debug_theta_el=uz_incrementalEncoder_get_theta_el(encoder_D5);
	debug_position_mech=uz_incrementalEncoder_get_position(encoder_D5);
	float speed_rpm = debug_omega * (60.0f/2.0f*M_PI);

	speed_mean_rpm -= fSpeed_rpm_Buf[buffer_counter]; //subtract the old value for the averaging
	fSpeed_rpm_Buf[buffer_counter] = speed_rpm;		//restore the new value for the averaging
	speed_mean_rpm += fSpeed_rpm_Buf[buffer_counter]; //add the new value for the averaging

	buffer_counter +=1; //Count up for the averaging
	if (buffer_counter >= SPEED_BUF_SIZE){ //Safe calculation for array overflow
		buffer_counter = 0;
	}

	//Speed over buffer
	data->av.mechanicalRotorSpeed = speed_mean_rpm * SPEED_BUF_SIZE_INVERS; //Calculate mean value for the speed

	// Get electrical angle theta
	data->av.theta_elec  = debug_theta_el;

	// low-pass filter of mechanical speed
	static float speed_lpf_mem_in = 0.0f;
	static float speed_lpf_mem_out = 0.0f;
	data->av.mechanicalRotorSpeed_filtered = LPF1(	data->av.mechanicalRotorSpeed, &speed_lpf_mem_in, &speed_lpf_mem_out,
													data->ctrl.samplingFrequency, data->mrp.IncEncoderLPF_freq);

}
