-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\uz_d_inverter_adapter\uz_d_inverter_adapter_addr_decoder.vhd
-- Created: 2022-05-31 17:55:12
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_d_inverter_adapter_addr_decoder
-- Source Path: uz_d_inverter_adapter/uz_d_inverter_adapter_axi_lite/uz_d_inverter_adapter_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_d_inverter_adapter_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_1_period            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_1_hightime          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_1_lowtime           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_1_dutycyc           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        read_AXI_Temp_2_period            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_2_hightime          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_2_lowtime           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_2_dutycyc           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        read_AXI_Temp_3_period            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_3_hightime          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_3_lowtime           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_3_dutycyc           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        read_AXI_Temp_4_period            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_4_hightime          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_4_lowtime           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_4_dutycyc           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        read_AXI_Temp_5_period            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_5_hightime          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_5_lowtime           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_5_dutycyc           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        read_AXI_Temp_6_period            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_6_hightime          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_6_lowtime           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_AXI_Temp_6_dutycyc           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        read_AXI_FAULT                    :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        read_AXI_OC                       :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        read_AXI_I_DIAG                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_AXI_en_in                   :   OUT   std_logic;  -- ufix1
        write_AXI_PWM_Enable              :   OUT   std_logic  -- ufix1
        );
END uz_d_inverter_adapter_addr_decoder;


ARCHITECTURE rtl OF uz_d_inverter_adapter_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_ip_timestamp_1_1      : std_logic;  -- ufix1
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_AXI_Temp_1_period_unsigned  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_1_hightime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_1_lowtime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_1_dutycyc_unsigned : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL read_AXI_Temp_2_period_unsigned  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_2_hightime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_2_lowtime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_2_dutycyc_unsigned : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL read_AXI_Temp_3_period_unsigned  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_3_hightime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_3_lowtime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_3_dutycyc_unsigned : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL read_AXI_Temp_4_period_unsigned  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_4_hightime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_4_lowtime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_4_dutycyc_unsigned : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL read_AXI_Temp_5_period_unsigned  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_5_hightime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_5_lowtime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_5_dutycyc_unsigned : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL read_AXI_Temp_6_period_unsigned  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_6_hightime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_6_lowtime_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_AXI_Temp_6_dutycyc_unsigned : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL read_AXI_FAULT_unsigned          : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL read_AXI_OC_unsigned             : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL read_AXI_I_DIAG_unsigned         : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL decode_sel_AXI_I_DIAG_1_1        : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_OC_1_1            : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_FAULT_1_1         : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_6_dutycyc_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_6_lowtime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_6_hightime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_6_period_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_5_dutycyc_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_5_lowtime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_5_hightime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_5_period_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_4_dutycyc_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_4_lowtime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_4_hightime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_4_period_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_3_dutycyc_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_3_lowtime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_3_hightime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_3_period_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_2_dutycyc_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_2_lowtime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_2_hightime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_2_period_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_1_dutycyc_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_1_lowtime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_1_hightime_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_Temp_1_period_1_1 : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_1_period       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_1_period_1_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_1_hightime     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_1_hightime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_1_lowtime      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_1_lowtime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_1_dutycyc      : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL data_slice_AXI_Temp_1_dutycyc_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_1_dutycyc_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_2_period       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_2_period_1_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_2_hightime     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_2_hightime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_2_lowtime      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_2_lowtime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_2_dutycyc      : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL data_slice_AXI_Temp_2_dutycyc_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_2_dutycyc_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_3_period       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_3_period_1_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_3_hightime     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_3_hightime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_3_lowtime      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_3_lowtime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_3_dutycyc      : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL data_slice_AXI_Temp_3_dutycyc_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_3_dutycyc_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_4_period       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_4_period_1_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_4_hightime     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_4_hightime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_4_lowtime      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_4_lowtime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_4_dutycyc      : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL data_slice_AXI_Temp_4_dutycyc_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_4_dutycyc_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_5_period       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_5_period_1_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_5_hightime     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_5_hightime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_5_lowtime      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_5_lowtime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_5_dutycyc      : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL data_slice_AXI_Temp_5_dutycyc_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_5_dutycyc_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_6_period       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_6_period_1_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_6_hightime     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_6_hightime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_6_lowtime      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_6_lowtime_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_Temp_6_dutycyc      : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL data_slice_AXI_Temp_6_dutycyc_1  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_Temp_6_dutycyc_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_FAULT               : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL data_slice_AXI_FAULT_1           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_FAULT_1_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_OC                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL data_slice_AXI_OC_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_OC_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_AXI_I_DIAG              : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL data_slice_AXI_I_DIAG_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI_I_DIAG_1_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_axi_enable_1_1        : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable_1_1           : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL data_reg_axi_enable_1_1          : std_logic;  -- ufix1
  SIGNAL write_concats_axi_enable_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_en_in_1_1         : std_logic;  -- ufix1
  SIGNAL reg_enb_AXI_en_in_1_1            : std_logic;  -- ufix1
  SIGNAL data_in_AXI_en_in                : std_logic;  -- ufix1
  SIGNAL data_reg_AXI_en_in_1_1           : std_logic;  -- ufix1
  SIGNAL write_concats_AXI_en_in_1        : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI_PWM_Enable_1_1    : std_logic;  -- ufix1
  SIGNAL reg_enb_AXI_PWM_Enable_1_1       : std_logic;  -- ufix1
  SIGNAL data_in_AXI_PWM_Enable           : std_logic;  -- ufix1
  SIGNAL data_reg_AXI_PWM_Enable_1_1      : std_logic;  -- ufix1
  SIGNAL write_concats_AXI_PWM_Enable_1   : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_ip_timestamp_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  const_1 <= '1';

  enb <= const_1;

  read_AXI_Temp_1_period_unsigned <= unsigned(read_AXI_Temp_1_period);

  read_AXI_Temp_1_hightime_unsigned <= unsigned(read_AXI_Temp_1_hightime);

  read_AXI_Temp_1_lowtime_unsigned <= unsigned(read_AXI_Temp_1_lowtime);

  read_AXI_Temp_1_dutycyc_unsigned <= unsigned(read_AXI_Temp_1_dutycyc);

  read_AXI_Temp_2_period_unsigned <= unsigned(read_AXI_Temp_2_period);

  read_AXI_Temp_2_hightime_unsigned <= unsigned(read_AXI_Temp_2_hightime);

  read_AXI_Temp_2_lowtime_unsigned <= unsigned(read_AXI_Temp_2_lowtime);

  read_AXI_Temp_2_dutycyc_unsigned <= unsigned(read_AXI_Temp_2_dutycyc);

  read_AXI_Temp_3_period_unsigned <= unsigned(read_AXI_Temp_3_period);

  read_AXI_Temp_3_hightime_unsigned <= unsigned(read_AXI_Temp_3_hightime);

  read_AXI_Temp_3_lowtime_unsigned <= unsigned(read_AXI_Temp_3_lowtime);

  read_AXI_Temp_3_dutycyc_unsigned <= unsigned(read_AXI_Temp_3_dutycyc);

  read_AXI_Temp_4_period_unsigned <= unsigned(read_AXI_Temp_4_period);

  read_AXI_Temp_4_hightime_unsigned <= unsigned(read_AXI_Temp_4_hightime);

  read_AXI_Temp_4_lowtime_unsigned <= unsigned(read_AXI_Temp_4_lowtime);

  read_AXI_Temp_4_dutycyc_unsigned <= unsigned(read_AXI_Temp_4_dutycyc);

  read_AXI_Temp_5_period_unsigned <= unsigned(read_AXI_Temp_5_period);

  read_AXI_Temp_5_hightime_unsigned <= unsigned(read_AXI_Temp_5_hightime);

  read_AXI_Temp_5_lowtime_unsigned <= unsigned(read_AXI_Temp_5_lowtime);

  read_AXI_Temp_5_dutycyc_unsigned <= unsigned(read_AXI_Temp_5_dutycyc);

  read_AXI_Temp_6_period_unsigned <= unsigned(read_AXI_Temp_6_period);

  read_AXI_Temp_6_hightime_unsigned <= unsigned(read_AXI_Temp_6_hightime);

  read_AXI_Temp_6_lowtime_unsigned <= unsigned(read_AXI_Temp_6_lowtime);

  read_AXI_Temp_6_dutycyc_unsigned <= unsigned(read_AXI_Temp_6_dutycyc);

  read_AXI_FAULT_unsigned <= unsigned(read_AXI_FAULT);

  read_AXI_OC_unsigned <= unsigned(read_AXI_OC);

  read_AXI_I_DIAG_unsigned <= unsigned(read_AXI_I_DIAG);

  
  decode_sel_AXI_I_DIAG_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0064#, 14) ELSE
      '0';

  
  decode_sel_AXI_OC_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#005E#, 14) ELSE
      '0';

  
  decode_sel_AXI_FAULT_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0059#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_6_dutycyc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0058#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_6_lowtime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0057#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_6_hightime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0056#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_6_period_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0055#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_5_dutycyc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0054#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_5_lowtime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0053#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_5_hightime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0052#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_5_period_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0051#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_4_dutycyc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0050#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_4_lowtime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004F#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_4_hightime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004E#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_4_period_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004D#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_3_dutycyc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004C#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_3_lowtime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004B#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_3_hightime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004A#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_3_period_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0049#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_2_dutycyc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0048#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_2_lowtime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0047#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_2_hightime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0046#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_2_period_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0045#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_1_dutycyc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_1_lowtime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_1_hightime_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  
  decode_sel_AXI_Temp_1_period_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_ip_timestamp_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_ip_timestamp <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp_1_1 <= const_0 WHEN decode_sel_ip_timestamp_1_1 = '0' ELSE
      read_reg_ip_timestamp;

  reg_AXI_Temp_1_period_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_1_period <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_1_period <= read_AXI_Temp_1_period_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_1_period_process;


  
  decode_rd_AXI_Temp_1_period_1_1 <= decode_rd_ip_timestamp_1_1 WHEN decode_sel_AXI_Temp_1_period_1_1 = '0' ELSE
      read_reg_AXI_Temp_1_period;

  reg_AXI_Temp_1_hightime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_1_hightime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_1_hightime <= read_AXI_Temp_1_hightime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_1_hightime_process;


  
  decode_rd_AXI_Temp_1_hightime_1_1 <= decode_rd_AXI_Temp_1_period_1_1 WHEN decode_sel_AXI_Temp_1_hightime_1_1 = '0' ELSE
      read_reg_AXI_Temp_1_hightime;

  reg_AXI_Temp_1_lowtime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_1_lowtime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_1_lowtime <= read_AXI_Temp_1_lowtime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_1_lowtime_process;


  
  decode_rd_AXI_Temp_1_lowtime_1_1 <= decode_rd_AXI_Temp_1_hightime_1_1 WHEN decode_sel_AXI_Temp_1_lowtime_1_1 = '0' ELSE
      read_reg_AXI_Temp_1_lowtime;

  reg_AXI_Temp_1_dutycyc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_1_dutycyc <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_1_dutycyc <= read_AXI_Temp_1_dutycyc_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_1_dutycyc_process;


  data_slice_AXI_Temp_1_dutycyc_1 <= read_reg_AXI_Temp_1_dutycyc;

  
  decode_rd_AXI_Temp_1_dutycyc_1_1 <= decode_rd_AXI_Temp_1_lowtime_1_1 WHEN decode_sel_AXI_Temp_1_dutycyc_1_1 = '0' ELSE
      data_slice_AXI_Temp_1_dutycyc_1;

  reg_AXI_Temp_2_period_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_2_period <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_2_period <= read_AXI_Temp_2_period_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_2_period_process;


  
  decode_rd_AXI_Temp_2_period_1_1 <= decode_rd_AXI_Temp_1_dutycyc_1_1 WHEN decode_sel_AXI_Temp_2_period_1_1 = '0' ELSE
      read_reg_AXI_Temp_2_period;

  reg_AXI_Temp_2_hightime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_2_hightime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_2_hightime <= read_AXI_Temp_2_hightime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_2_hightime_process;


  
  decode_rd_AXI_Temp_2_hightime_1_1 <= decode_rd_AXI_Temp_2_period_1_1 WHEN decode_sel_AXI_Temp_2_hightime_1_1 = '0' ELSE
      read_reg_AXI_Temp_2_hightime;

  reg_AXI_Temp_2_lowtime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_2_lowtime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_2_lowtime <= read_AXI_Temp_2_lowtime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_2_lowtime_process;


  
  decode_rd_AXI_Temp_2_lowtime_1_1 <= decode_rd_AXI_Temp_2_hightime_1_1 WHEN decode_sel_AXI_Temp_2_lowtime_1_1 = '0' ELSE
      read_reg_AXI_Temp_2_lowtime;

  reg_AXI_Temp_2_dutycyc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_2_dutycyc <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_2_dutycyc <= read_AXI_Temp_2_dutycyc_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_2_dutycyc_process;


  data_slice_AXI_Temp_2_dutycyc_1 <= read_reg_AXI_Temp_2_dutycyc;

  
  decode_rd_AXI_Temp_2_dutycyc_1_1 <= decode_rd_AXI_Temp_2_lowtime_1_1 WHEN decode_sel_AXI_Temp_2_dutycyc_1_1 = '0' ELSE
      data_slice_AXI_Temp_2_dutycyc_1;

  reg_AXI_Temp_3_period_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_3_period <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_3_period <= read_AXI_Temp_3_period_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_3_period_process;


  
  decode_rd_AXI_Temp_3_period_1_1 <= decode_rd_AXI_Temp_2_dutycyc_1_1 WHEN decode_sel_AXI_Temp_3_period_1_1 = '0' ELSE
      read_reg_AXI_Temp_3_period;

  reg_AXI_Temp_3_hightime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_3_hightime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_3_hightime <= read_AXI_Temp_3_hightime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_3_hightime_process;


  
  decode_rd_AXI_Temp_3_hightime_1_1 <= decode_rd_AXI_Temp_3_period_1_1 WHEN decode_sel_AXI_Temp_3_hightime_1_1 = '0' ELSE
      read_reg_AXI_Temp_3_hightime;

  reg_AXI_Temp_3_lowtime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_3_lowtime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_3_lowtime <= read_AXI_Temp_3_lowtime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_3_lowtime_process;


  
  decode_rd_AXI_Temp_3_lowtime_1_1 <= decode_rd_AXI_Temp_3_hightime_1_1 WHEN decode_sel_AXI_Temp_3_lowtime_1_1 = '0' ELSE
      read_reg_AXI_Temp_3_lowtime;

  reg_AXI_Temp_3_dutycyc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_3_dutycyc <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_3_dutycyc <= read_AXI_Temp_3_dutycyc_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_3_dutycyc_process;


  data_slice_AXI_Temp_3_dutycyc_1 <= read_reg_AXI_Temp_3_dutycyc;

  
  decode_rd_AXI_Temp_3_dutycyc_1_1 <= decode_rd_AXI_Temp_3_lowtime_1_1 WHEN decode_sel_AXI_Temp_3_dutycyc_1_1 = '0' ELSE
      data_slice_AXI_Temp_3_dutycyc_1;

  reg_AXI_Temp_4_period_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_4_period <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_4_period <= read_AXI_Temp_4_period_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_4_period_process;


  
  decode_rd_AXI_Temp_4_period_1_1 <= decode_rd_AXI_Temp_3_dutycyc_1_1 WHEN decode_sel_AXI_Temp_4_period_1_1 = '0' ELSE
      read_reg_AXI_Temp_4_period;

  reg_AXI_Temp_4_hightime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_4_hightime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_4_hightime <= read_AXI_Temp_4_hightime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_4_hightime_process;


  
  decode_rd_AXI_Temp_4_hightime_1_1 <= decode_rd_AXI_Temp_4_period_1_1 WHEN decode_sel_AXI_Temp_4_hightime_1_1 = '0' ELSE
      read_reg_AXI_Temp_4_hightime;

  reg_AXI_Temp_4_lowtime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_4_lowtime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_4_lowtime <= read_AXI_Temp_4_lowtime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_4_lowtime_process;


  
  decode_rd_AXI_Temp_4_lowtime_1_1 <= decode_rd_AXI_Temp_4_hightime_1_1 WHEN decode_sel_AXI_Temp_4_lowtime_1_1 = '0' ELSE
      read_reg_AXI_Temp_4_lowtime;

  reg_AXI_Temp_4_dutycyc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_4_dutycyc <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_4_dutycyc <= read_AXI_Temp_4_dutycyc_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_4_dutycyc_process;


  data_slice_AXI_Temp_4_dutycyc_1 <= read_reg_AXI_Temp_4_dutycyc;

  
  decode_rd_AXI_Temp_4_dutycyc_1_1 <= decode_rd_AXI_Temp_4_lowtime_1_1 WHEN decode_sel_AXI_Temp_4_dutycyc_1_1 = '0' ELSE
      data_slice_AXI_Temp_4_dutycyc_1;

  reg_AXI_Temp_5_period_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_5_period <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_5_period <= read_AXI_Temp_5_period_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_5_period_process;


  
  decode_rd_AXI_Temp_5_period_1_1 <= decode_rd_AXI_Temp_4_dutycyc_1_1 WHEN decode_sel_AXI_Temp_5_period_1_1 = '0' ELSE
      read_reg_AXI_Temp_5_period;

  reg_AXI_Temp_5_hightime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_5_hightime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_5_hightime <= read_AXI_Temp_5_hightime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_5_hightime_process;


  
  decode_rd_AXI_Temp_5_hightime_1_1 <= decode_rd_AXI_Temp_5_period_1_1 WHEN decode_sel_AXI_Temp_5_hightime_1_1 = '0' ELSE
      read_reg_AXI_Temp_5_hightime;

  reg_AXI_Temp_5_lowtime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_5_lowtime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_5_lowtime <= read_AXI_Temp_5_lowtime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_5_lowtime_process;


  
  decode_rd_AXI_Temp_5_lowtime_1_1 <= decode_rd_AXI_Temp_5_hightime_1_1 WHEN decode_sel_AXI_Temp_5_lowtime_1_1 = '0' ELSE
      read_reg_AXI_Temp_5_lowtime;

  reg_AXI_Temp_5_dutycyc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_5_dutycyc <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_5_dutycyc <= read_AXI_Temp_5_dutycyc_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_5_dutycyc_process;


  data_slice_AXI_Temp_5_dutycyc_1 <= read_reg_AXI_Temp_5_dutycyc;

  
  decode_rd_AXI_Temp_5_dutycyc_1_1 <= decode_rd_AXI_Temp_5_lowtime_1_1 WHEN decode_sel_AXI_Temp_5_dutycyc_1_1 = '0' ELSE
      data_slice_AXI_Temp_5_dutycyc_1;

  reg_AXI_Temp_6_period_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_6_period <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_6_period <= read_AXI_Temp_6_period_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_6_period_process;


  
  decode_rd_AXI_Temp_6_period_1_1 <= decode_rd_AXI_Temp_5_dutycyc_1_1 WHEN decode_sel_AXI_Temp_6_period_1_1 = '0' ELSE
      read_reg_AXI_Temp_6_period;

  reg_AXI_Temp_6_hightime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_6_hightime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_6_hightime <= read_AXI_Temp_6_hightime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_6_hightime_process;


  
  decode_rd_AXI_Temp_6_hightime_1_1 <= decode_rd_AXI_Temp_6_period_1_1 WHEN decode_sel_AXI_Temp_6_hightime_1_1 = '0' ELSE
      read_reg_AXI_Temp_6_hightime;

  reg_AXI_Temp_6_lowtime_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_6_lowtime <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_6_lowtime <= read_AXI_Temp_6_lowtime_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_6_lowtime_process;


  
  decode_rd_AXI_Temp_6_lowtime_1_1 <= decode_rd_AXI_Temp_6_hightime_1_1 WHEN decode_sel_AXI_Temp_6_lowtime_1_1 = '0' ELSE
      read_reg_AXI_Temp_6_lowtime;

  reg_AXI_Temp_6_dutycyc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_Temp_6_dutycyc <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_AXI_Temp_6_dutycyc <= read_AXI_Temp_6_dutycyc_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_Temp_6_dutycyc_process;


  data_slice_AXI_Temp_6_dutycyc_1 <= read_reg_AXI_Temp_6_dutycyc;

  
  decode_rd_AXI_Temp_6_dutycyc_1_1 <= decode_rd_AXI_Temp_6_lowtime_1_1 WHEN decode_sel_AXI_Temp_6_dutycyc_1_1 = '0' ELSE
      data_slice_AXI_Temp_6_dutycyc_1;

  reg_AXI_FAULT_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_FAULT <= to_unsigned(16#00#, 6);
      ELSIF enb = '1' THEN
        read_reg_AXI_FAULT <= read_AXI_FAULT_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_FAULT_process;


  data_slice_AXI_FAULT_1 <= resize(read_reg_AXI_FAULT, 32);

  
  decode_rd_AXI_FAULT_1_1 <= decode_rd_AXI_Temp_6_dutycyc_1_1 WHEN decode_sel_AXI_FAULT_1_1 = '0' ELSE
      data_slice_AXI_FAULT_1;

  reg_AXI_OC_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_OC <= to_unsigned(16#00#, 6);
      ELSIF enb = '1' THEN
        read_reg_AXI_OC <= read_AXI_OC_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_OC_process;


  data_slice_AXI_OC_1 <= resize(read_reg_AXI_OC, 32);

  
  decode_rd_AXI_OC_1_1 <= decode_rd_AXI_FAULT_1_1 WHEN decode_sel_AXI_OC_1_1 = '0' ELSE
      data_slice_AXI_OC_1;

  reg_AXI_I_DIAG_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_AXI_I_DIAG <= to_unsigned(16#0#, 4);
      ELSIF enb = '1' THEN
        read_reg_AXI_I_DIAG <= read_AXI_I_DIAG_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI_I_DIAG_process;


  data_slice_AXI_I_DIAG_1 <= resize(read_reg_AXI_I_DIAG, 32);

  
  decode_rd_AXI_I_DIAG_1_1 <= decode_rd_AXI_OC_1_1 WHEN decode_sel_AXI_I_DIAG_1_1 = '0' ELSE
      data_slice_AXI_I_DIAG_1;

  data_read <= std_logic_vector(decode_rd_AXI_I_DIAG_1_1);

  
  decode_sel_axi_enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  reg_enb_axi_enable_1_1 <= decode_sel_axi_enable_1_1 AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  reg_axi_enable_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_axi_enable_1_1 <= '1';
      ELSIF enb = '1' AND reg_enb_axi_enable_1_1 = '1' THEN
        data_reg_axi_enable_1_1 <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_1_1_process;


  write_concats_axi_enable_1 <= data_reg_axi_enable_1_1;

  write_axi_enable <= write_concats_axi_enable_1;

  
  decode_sel_AXI_en_in_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_AXI_en_in_1_1 <= decode_sel_AXI_en_in_1_1 AND wr_enb;

  data_in_AXI_en_in <= data_write_unsigned(0);

  reg_AXI_en_in_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_AXI_en_in_1_1 <= '0';
      ELSIF enb = '1' AND reg_enb_AXI_en_in_1_1 = '1' THEN
        data_reg_AXI_en_in_1_1 <= data_in_AXI_en_in;
      END IF;
    END IF;
  END PROCESS reg_AXI_en_in_1_1_process;


  write_concats_AXI_en_in_1 <= data_reg_AXI_en_in_1_1;

  write_AXI_en_in <= write_concats_AXI_en_in_1;

  
  decode_sel_AXI_PWM_Enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0068#, 14) ELSE
      '0';

  reg_enb_AXI_PWM_Enable_1_1 <= decode_sel_AXI_PWM_Enable_1_1 AND wr_enb;

  data_in_AXI_PWM_Enable <= data_write_unsigned(0);

  reg_AXI_PWM_Enable_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_AXI_PWM_Enable_1_1 <= '0';
      ELSIF enb = '1' AND reg_enb_AXI_PWM_Enable_1_1 = '1' THEN
        data_reg_AXI_PWM_Enable_1_1 <= data_in_AXI_PWM_Enable;
      END IF;
    END IF;
  END PROCESS reg_AXI_PWM_Enable_1_1_process;


  write_concats_AXI_PWM_Enable_1 <= data_reg_AXI_PWM_Enable_1_1;

  write_AXI_PWM_Enable <= write_concats_AXI_PWM_Enable_1;

END rtl;

