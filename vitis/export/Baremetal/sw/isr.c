/******************************************************************************
*
* isr.c
*
* Copyright (C) 2019 UltraZohm Community, All rights reserved.
*
*  Created on: 22.08.2018
*      Author: Wendel Sebastian (SW)
* Description: Zynq UltraScale+
*
******************************************************************************/

#include "../include/isr.h"
#include "../defines.h"
#include "../main.h"
#include "../include/ipc_ARM.h"
#include <math.h>
#include <xtmrctr.h> //library for timing measurement
#include "../include/javascope.h"
#include "../include/pwm.h"
#include "../include/pwm_3L_driver.h"
#include "../include/adc.h"
#include "../include/encoder.h"
#include "../IP_Cores/mux_axi_ip_addr.h"
#include "xtime_l.h"

//Timing measurement variables
//Variables for ISR-time measurement
Xuint32 	time_ISR_total, time_ISR_start, time_ISR_end;
Xfloat32 	time_ISR_total_us, time_ISR_max_us = 0;
Xint32 		i_ISRLifeCheck = 0;
Xfloat32 	f_ISRLifeCheck = 0;
Xint32 		i_count_1ms = 0; // count up by 1 every 1ms
Xint32 		i_count_1s = 0; // count up by 1 every 1s
Xfloat32 	isr_period_us_meausred;
XTime 		tPrev, tNow = 0; // XTime is u64 which will not overflow in a life time
unsigned int time_overflow_counter = 0;

//Initialize the variables for the ADC measurement
u32 		XADC_Buf[RX_BUFFER_SIZE]; //Test ADC
Xint32 		ADC_RAW_Sum_1 = 0.0;
Xfloat32 	ADC_RAW_Offset_1 = 0.0;
Xint16 		i_CountADCinit =0, MessOnce=0, CountCurrentError =0;
boolean     initADCdone = valueFalse;

// Initialize the  GPIO structure
extern XGpioPs Gpio_IN;		/* GPIO Device driver instance for the real GPIOs */
extern XGpioPs Gpio_OUT;	/* GPIO Device driver instance for the real GPIOs */

//Initialize the Interrupt structure
XScuGic INTCInst;  	//Interrupt handler -> only instance one -> responsible for ALL interrupts of the GIC!
XIpiPsu INTCInst_IPI;  	//Interrupt handler -> only instance one -> responsible for ALL interrupts of the IPI!

//Initialize the Timer structure
XTmrCtr TMR_Con_Inst;

//Variables for JavaScope
extern Oszi_to_ARM_Data_shared_struct ControlData; //Data from A53_0 to R5_0 (from FreeRTOS to BareMetal) in order to receive control data from the GUI
extern Oszi_to_ARM_Data_shared_struct ControlDataShadowBare; //Data from A53_0 to R5_0 (from FreeRTOS to BareMetal) in order to receive control data from the GUI
Xfloat32 sin1amp=100.0;

//Global variable structure
extern DS_Data Global_Data;

//==============================================================================================================================================================
//----------------------------------------------------
// INTERRUPT HANDLER FUNCTIONS
// - called by the hardware timer
// - start of the control period
//----------------------------------------------------
void TMR_Con_Intr_Handler(void *data)
{
	//Show start of control-ISR by toggling a pin
	//XGpio_DiscreteWrite(&Gpio_OUT,GPIO_CHANNEL , 0b0010);  // --+-
	//if you have a device, which may produce several interrupts one after another, the first thing you should do here, is to disable interrupts!
	// Enable and acknowledge the timer
	XTmrCtr_Reset(&TMR_Con_Inst,0);

	//Read the timer value at the beginning of the ISR in order to measure the ISR-time
	time_ISR_start = XTmrCtr_GetValue(&TMR_Con_Inst,0);

	i_ISRLifeCheck++; //LiveCheck
	if(i_ISRLifeCheck > 10000){
		i_ISRLifeCheck = 1; //If the value is 10001, than set to 1 in order to avoid value-overflow
	}
	f_ISRLifeCheck = ((Xfloat32)i_ISRLifeCheck)*0.1; //for representation, keep the value between 0-1000

	MeasureTime();	//measure the time for the JavaScope

	// Toggle the System-Ready LED in order to show a Life-Check on the front panel
	// todo: write seperate function to toggle front panel LEDs
	if(Global_Data.cw.enableSystem){
		if((i_count_1ms % 200)>100){
			WritePin_PS_GPIO(LED_ready,valueTrue); //Write a GPIO for LED_1
		}else{
			WritePin_PS_GPIO(LED_ready,valueFalse); //Write a GPIO for LED_1
		}
	}else{
		if(i_count_1s % 2){
			WritePin_PS_GPIO(LED_ready,valueTrue); //Write a GPIO for LED_1
		}else{
			WritePin_PS_GPIO(LED_ready,valueFalse); //Write a GPIO for LED_1
		}
	}

	//Start: Read out ADCs ---------------------------------------------------------------------------------------
	if (initADCdone == valueFalse) { // init not done, determine ADC offset
		if (i_CountADCinit < 1000){
			//ToDo: Read the ADC-Register and sum up over 1000 measurements, e.g. like
			//ADC_RAW_Sum_1 += Xil_In32(ADC_RAW_Value_1_REG); //Read AXI-register
			i_CountADCinit++;
		}else{
			//ToDo: calculate average value in order to use as offset subsequently, e.g. like
			//ADC_RAW_Offset_1 = (Xfloat32)ADC_RAW_Sum_1 / (Xfloat32)i_CountADCinit;

			//toDO write for each ADC channel an own offset down.
			initADCdone = valueTrue;
			Global_Data.cw.ControlReference = CurrentControl; //default
			Global_Data.cw.ControlMethod = fieldOrientedControl; //default
			ADC_Clear_Offset();
		}
	}else{

		// Choose here which ADC card to read
		//ADC_readCardA1(&Global_Data);
		//ADC_readCardA2(&Global_Data);
		//ADC_readCardA3(&Global_Data);
		ADC_readCardALL(&Global_Data);

	}
	//End: Read out ADCs ---------------------------------------------------------------------------------------


	//Error detection
	if(Global_Data.cw.enableControl == flagEnabled){
		//Detect continuous current-limit ---------------------------------------------------------------------------------------
		if ((Global_Data.av.I_U > Global_Data.mrp.motorMaximumCurrentContinuousOperation) || (Global_Data.av.I_V > Global_Data.mrp.motorMaximumCurrentContinuousOperation) || (Global_Data.av.I_W > Global_Data.mrp.motorMaximumCurrentContinuousOperation)){
			CountCurrentError++;
			if(CountCurrentError > 10){ //Only if the error is available for at least 10 cycles
		 // if(CountCurrentError > 20000){ //Only if the error is available for at least 2 seconds @100us ISR-cycle
				Global_Data.ew.maximumContinuousCurrentExceeded = valueTrue; //Current error detected -> errors are handled in the main.c
			}
		}else{
			CountCurrentError =0; //Reset Error Counter
		}

		//Detect short-time current-limit ---------------------------------------------------------------------------------------
		if ((Global_Data.av.I_U > Global_Data.mrp.motorMaximumCurrentShortTimeOperation) || (Global_Data.av.I_V > Global_Data.mrp.motorMaximumCurrentShortTimeOperation) || (Global_Data.av.I_W > Global_Data.mrp.motorMaximumCurrentShortTimeOperation)){
			ErrorHandling(&Global_Data);
			Global_Data.ew.maximumShortTermCurrentReached = valueTrue; //Current error detected -> errors are handled directly herein
		}
	}

	//Read out speed and theta angle ---------------------------------------------------------------------------------------
	Encoder_UpdateSpeedPosition(&Global_Data);

	//Start: Write the references for the FPGA ---------------------------------------------------------------------------------------
	if (Global_Data.cw.ControlReference == SpeedControl)
	{
		// add your speed controller here
	}
	else if(Global_Data.cw.ControlReference == CurrentControl)
	{
		// add your current controller here
	}
	else if(Global_Data.cw.ControlReference == TorqueControl)
	{
		// add your torque controller here
	}


	// generate open-loop sinusoidal duty-cycle, amplitude and frequency are set in the Global_Data struct
	// both function write the variable Global_Data.rasv.halfBridge1DutyCycle -> only comment 2L or 3L!
	// PWM_SS_Calculate_DutyCycle_open_loop_sin(&Global_Data);
	// PWM_3L_Calculate_DutyCycle_open_loop_sin(&Global_Data);

	// Set duty cycles for two-level modulator
	PWM_SS_SetDutyCycle(Global_Data.rasv.halfBridge1DutyCycle,
						Global_Data.rasv.halfBridge2DutyCycle,
						Global_Data.rasv.halfBridge3DutyCycle);

	// Set duty cycles for three-level modulator
	PWM_3L_SetDutyCycle(Global_Data.rasv.halfBridge1DutyCycle,
						Global_Data.rasv.halfBridge2DutyCycle,
						Global_Data.rasv.halfBridge3DutyCycle);
	//End: Write the references for the FPGA ---------------------------------------------------------------------------------------


	// Update JavaScope
	JavaScope_update(&Global_Data);

	//Read the timer value at the end of the ISR in order to measure the ISR-time
	time_ISR_end = XTmrCtr_GetValue(&TMR_Con_Inst,0);

	//Calculate the required ISR-time
	time_ISR_total = time_ISR_end - time_ISR_start;
	time_ISR_total_us = time_ISR_total * 1e-2 ; //PL clock-Ticks* @100MHz Clock [us]

	if(time_ISR_total_us > time_ISR_max_us){
		time_ISR_max_us = (time_ISR_total_us);
	}
	//Show end of control-ISR
	//XGpio_DiscreteWrite(&Gpio_OUT,GPIO_CHANNEL , 0b0000);  // ----
}

//==============================================================================================================================================================
//----------------------------------------------------
// Measure the time for the JavaScope
//----------------------------------------------------
int MeasureTime(){
	// static unsigned int time_overflow_counter = 0 ; // made global

	// save previous read
	tPrev = tNow;
	// read clock counter of R5 processor, which starts at 0 after reset/starting the processor
	XTime_GetTime(&tNow);

	//catch overflow after 9.16 minutes when tNow (32bit) starts from 0 again
	if (tNow < tPrev){
		time_overflow_counter++;
	}

	//measure with 1ms cycle
	i_count_1ms = tNow/((COUNTS_PER_SECOND) * 1e-3);

	//measure with 1s cycle
	//todo: double-check this line!
	const unsigned int unsigned_int_max_number = ~(unsigned int)0;
	i_count_1s = (int) (i_count_1ms*1e-3) + time_overflow_counter * (unsigned_int_max_number/COUNTS_PER_SECOND); //   9.16minutes = 549.7559 seconds = (2^32-1)/COUNTS_PER_SECOND

	// calculate ISR period, the time between two calls of this function
	float const counts_per_us = (COUNTS_PER_SECOND) * 1e-6; // DO NOT USE COUNTS_PER_USECOND, this macro has a large rounding error!
	XTime isr_period_counts = (tNow - tPrev);
	isr_period_us_meausred = isr_period_counts / counts_per_us;

	/* for reference how to measure time
	float up_time_us = 1.0 * (tNow) / (COUNTS_PER_USECOND);
	float up_time_ms = 1.0 * (tNow) / (COUNTS_PER_USECOND*1000);
	float up_time_s  = up_time_ms * 1e-3;
	 */

	return 0;
}

//==============================================================================================================================================================
//----------------------------------------------------
// INITIALIZE ADC-COUNTER TIMER IN ORDER TO TRIGGER THE ADC CONVERSION
// - If connected to 10MHz clock, a count value of 25 starts an ADC conversion every 2,5us (= 400 kHz)
//----------------------------------------------------
int Initialize_Trigger_ADC_Conversion(){

	int Status = 0;

	//Write down the Counter End-Value in order to start a ADC conversion
//	Xil_Out32(ADCCounter_EndValue_REG, (Xint32)25); //Original = 100

return Status;
}

//==============================================================================================================================================================
//----------------------------------------------------
// INITIALIZE & SET THE INTERRUPTs and ISRs
//----------------------------------------------------
int Initialize_ISR(){

	int Status = 0;

	// Initialize interrupt controller for the GIC
	Status = Rpu_GicInit(&INTCInst, INTERRUPT_ID_SCUG, &TMR_Con_Inst);
		if(Status != XST_SUCCESS) {
			xil_printf("RPU: Error: GIC initialization failed\r\n");
			return XST_FAILURE;
		}

	// Initialize interrupt controller for the IPI -> Initialize RPU IPI
	Status = Rpu_IpiInit(INTERRUPT_ID_IPI);
		if(Status != XST_SUCCESS) {
			xil_printf("RPU: Error: IPI initialization failed\r\n");
			return XST_FAILURE;
		}


	// Initialize mux_axi to use correct interrupt for triggering the ADCs
	Xil_Out32(XPAR_INTERRUPT_MUX_AXI_IP_0_BASEADDR + IPCore_Enable_mux_axi_ip, 1); // enable IP core
	Xil_Out32(XPAR_INTERRUPT_MUX_AXI_IP_0_BASEADDR + select_AXI_Data_mux_axi_ip, Interrupt_ISR_source_user_choice); // write selector

return Status;
}

//==============================================================================================================================================================
//----------------------------------------------------
// INITIALIZE AXI-TIMER FOR ISRs
// - "TMR_Con_LOAD" sets the counter-end-value in order to set the ISR-frequency f_c
// - "Con_TIMER_DEVICE_ID" uses the Device-ID of the used timer in Vivado
// - "TMR_Con_Inst" is the used timer structure instance
// - "XTC_INT_MODE_OPTION" activates the Interrupt function
// - "XTC_AUTO_RELOAD_OPTION" activates an automatic reload of the timer
// - By default, the counter counts up
//----------------------------------------------------
int Initialize_Timer(){

	int Status;

	// SETUP THE TIMER for Control
	Status = XTmrCtr_Initialize(&TMR_Con_Inst, Con_TIMER_DEVICE_ID);
	if(Status != XST_SUCCESS) return XST_FAILURE;
	XTmrCtr_SetHandler(&TMR_Con_Inst, TMR_Con_Intr_Handler, &TMR_Con_Inst);
	XTmrCtr_SetOptions(&TMR_Con_Inst, 0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
	XTmrCtr_SetResetValue(&TMR_Con_Inst, 0, TMR_Con_LOAD);
	XTmrCtr_Start(&TMR_Con_Inst,0);

return Status;
}

//==============================================================================================================================================================
//----------------------------------------------------
// Rpu_GicInit() - This function initializes RPU GIC and connects
// 					interrupts with the associated handlers
// @IntcInstPtr		Pointer to the GIC instance
// @IntId			Interrupt ID to be connected and enabled
// @Handler			Associated handler for the Interrupt ID
// @PeriphInstPtr	Connected interrupt's Peripheral instance pointer
//----------------------------------------------------
int Rpu_GicInit(XScuGic *IntcInstPtr, u16 DeviceId, XTmrCtr *Tmr_Con_InstancePtr)
{
	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(IntcInstPtr, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Connect the interrupt controller interrupt handler to the hardware interrupt handling logic in the processor
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,IntcInstPtr);

	if(status != XST_SUCCESS) return XST_FAILURE;

	// Make the connection between the IntId of the interrupt source and the
	// associated handler that is to run when the interrupt is recognized.
	status = XScuGic_Connect(IntcInstPtr,
								Interrupt_ISR_ID,
								(Xil_ExceptionHandler)TMR_Con_Intr_Handler,
								(void *)Tmr_Con_InstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Connect ADC conversion interrupt to handler
//		status = XScuGic_Connect(&INTCInst,
//								INTC_ADC_Conv_INTERRUPT_ID,
//								(Xil_ExceptionHandler)Conv_ADC_Intr_Handler,
//								(void *)Conv_ADC_InstancePtr);
//		if(status != XST_SUCCESS) return XST_FAILURE;


	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(IntcInstPtr, Interrupt_ISR_ID);
	XScuGic_Enable(IntcInstPtr, INTC_IPC_Shared_INTERRUPT_ID);
//	XScuGic_Enable(&INTCInst, INTC_ADC_Conv_INTERRUPT_ID);

	/* Enable interrupts in the processor */
	Xil_ExceptionEnable();	//Enable interrupts in the ARM

	xil_printf("RPU: Rpu_GicInit: Done\r\n");
	return XST_SUCCESS;
}

//==============================================================================================================================================================
//----------------------------------------------------
// Rpu_IpiInit() - This function initializes RPU IPI and enables IPI interrupts
//
// @IpiInstPtr		Pointer to the IPI instance
 //----------------------------------------------------
u32 Rpu_IpiInit(u16 DeviceId)
{
	XIpiPsu_Config *IntcConfig_IPI;
	int status;

	// Interrupt controller configuration
	IntcConfig_IPI = XIpiPsu_LookupConfig(DeviceId);
		if (IntcConfig_IPI == NULL) {
			xil_printf("RPU: Error: Ipi Init failed\r\n");
			return XST_FAILURE;
		}

	// Interrupt controller initialization
	status = XIpiPsu_CfgInitialize(&INTCInst_IPI, IntcConfig_IPI, IntcConfig_IPI->BaseAddress);
		if (status != XST_SUCCESS) {
			xil_printf("RPU: Error: IPI Config failed\r\n");
			return XST_FAILURE;
		}

	// Enable IPI from RPU_0 to APU_0
	//	Xil_Out32(0xFF310018U, 0xF0000U);
	//Explanation: 0xFF310018U = XPAR_PSU_IPI_1_BASE_ADDRESS + XIPIPSU_IER_OFFSET
	//Explanation: 0xF0000U =  XPAR_PSU_IPI_3_BIT_MASK +XPAR_PSU_IPI_4_BIT_MASK + XPAR_PSU_IPI_5_BIT_MASK + XPAR_PSU_IPI_6_BIT_MASK
	//Explanation: 0xF0000U =  0x00010000U + 0x00020000U + 0x00040000U + 0x00080000U = Enable all IPI to the PMU
	XIpiPsu_InterruptEnable(&INTCInst_IPI, XPAR_XIPIPS_TARGET_PSU_CORTEXR5_0_CH0_MASK);
	//XIpiPsu_InterruptEnable(&INTCInst_IPI, 0x00000301U); //Enable all interrupts with "0x00000301U"

	xil_printf("RPU: RPU_IpiInit: Done\r\n");
	return XST_SUCCESS;
}
