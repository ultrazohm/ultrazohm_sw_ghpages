/******************************************************************************
 *
 * adc.h
 *
 * Copyright (C) 2020 UltraZohm Community, All rights reserved.
 *
 *  Created on: 08.09.2020
 *      Author: Eyke Liegmann (EL)
 *
******************************************************************************/

#ifndef ADC_H_
#define ADC_H_

#include "../main.h"
#include "../IP_Cores/ADC_Module_LVDS_v2_ip_addr.h"

typedef union _ADCread_union_ {
	struct{
		Xint16 ADC1;
		Xint16 ADC2;
		Xint16 ADC3;
		Xint16 ADC4;
		};
	u64 ADC_Block_64bit;
} ADCread_union;


void ADC_readCardA1(DS_Data* data);
void ADC_readCardA2(DS_Data* data);
void ADC_readCardA3(DS_Data* data);

void ADC_readCardALL(DS_Data* data);

void ADC_WriteConversionFactor(int ADC_ConversionFactor);	// Init for the ADC-conversion IP-Block

void DQTransformation_Initialize(DS_Data* data);		// Init Park-transformation 123 to dq

//==============================================================================================================================================================
// AXI2TCM Registers
#define R5_0_BTCM_SPLIT_REG	0x20000

// ADC Card Slot A1
#define ADC_A1_ChA1_REG		(R5_0_BTCM_SPLIT_REG + 0x00)
#define ADC_A1_ChA2_REG		(R5_0_BTCM_SPLIT_REG + 0x02)
#define ADC_A1_ChA3_REG		(R5_0_BTCM_SPLIT_REG + 0x04)
#define ADC_A1_ChA4_REG		(R5_0_BTCM_SPLIT_REG + 0x06)

#define ADC_A1_ChB5_REG		(R5_0_BTCM_SPLIT_REG + 0x08)
#define ADC_A1_ChB6_REG		(R5_0_BTCM_SPLIT_REG + 0x0A)
#define ADC_A1_ChB7_REG		(R5_0_BTCM_SPLIT_REG + 0x0C)
#define ADC_A1_ChB8_REG		(R5_0_BTCM_SPLIT_REG + 0x0E)

// ADC Card Slot
#define ADC_A2_ChA1_REG		(R5_0_BTCM_SPLIT_REG + 0x10)
#define ADC_A2_ChA2_REG		(R5_0_BTCM_SPLIT_REG + 0x12)
#define ADC_A2_ChA3_REG		(R5_0_BTCM_SPLIT_REG + 0x14)
#define ADC_A2_ChA4_REG		(R5_0_BTCM_SPLIT_REG + 0x16)

#define ADC_A2_ChB5_REG		(R5_0_BTCM_SPLIT_REG + 0x18)
#define ADC_A2_ChB6_REG		(R5_0_BTCM_SPLIT_REG + 0x1A)
#define ADC_A2_ChB7_REG		(R5_0_BTCM_SPLIT_REG + 0x1C)
#define ADC_A2_ChB8_REG		(R5_0_BTCM_SPLIT_REG + 0x1E)

// ADC Card Slot 
#define ADC_A3_ChA1_REG		(R5_0_BTCM_SPLIT_REG + 0x20)
#define ADC_A3_ChA2_REG		(R5_0_BTCM_SPLIT_REG + 0x22)
#define ADC_A3_ChA3_REG		(R5_0_BTCM_SPLIT_REG + 0x24)
#define ADC_A3_ChA4_REG		(R5_0_BTCM_SPLIT_REG + 0x26)

#define ADC_A3_ChB5_REG		(R5_0_BTCM_SPLIT_REG + 0x28)
#define ADC_A3_ChB6_REG		(R5_0_BTCM_SPLIT_REG + 0x2A)
#define ADC_A3_ChB7_REG		(R5_0_BTCM_SPLIT_REG + 0x2C)
#define ADC_A3_ChB8_REG		(R5_0_BTCM_SPLIT_REG + 0x2E)

#define ADC_ChA1	0
#define ADC_ChA2	1
#define ADC_ChA3	2
#define ADC_ChA4	3
#define ADC_ChB5	4
#define ADC_ChB6	5
#define ADC_ChB7	6
#define ADC_ChB8	7

#endif /* ADC_H_ */
