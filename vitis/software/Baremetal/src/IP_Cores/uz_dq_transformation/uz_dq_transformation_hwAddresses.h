#pragma once 

#define  IPCore_Reset_Trans_123_dq_V12_ip            0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_Trans_123_dq_V12_ip           0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_Trans_123_dq_V12_ip        0x8  //contains unique IP timestamp (yymmddHHMM): 2006081955
#define  theta_offset_AXI_Data_Trans_123_dq_V12_ip   0x100  //data register for Inport theta_offset_AXI
#define  id_AXI_Data_Trans_123_dq_V12_ip             0x104  //data register for Outport id_AXI
#define  iq_AXI_Data_Trans_123_dq_V12_ip             0x108  //data register for Outport iq_AXI
#define  i1_AXI_Data_Trans_123_dq_V12_ip             0x10C  //data register for Outport i1_AXI
#define  i2_AXI_Data_Trans_123_dq_V12_ip             0x110  //data register for Outport i2_AXI
#define  i3_AXI_Data_Trans_123_dq_V12_ip             0x114  //data register for Outport i3_AXI
