-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_holdValue2.vhd
-- Created: 2021-03-17 16:47:03
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_holdValue2
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer/LastLayer/parallelOutput/holdValue2
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_mlp_three_layer_src_holdValue2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        takeNewValue                      :   IN    std_logic;
        data                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out_rsvd                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
        );
END uz_mlp_three_layer_src_holdValue2;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_holdValue2 IS

  -- Signals
  SIGNAL data_signed                      : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Switch_out1                      : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Delay1_out1                      : signed(31 DOWNTO 0);  -- sfix32_En14

BEGIN
  -- Outputs data if "takeNewValue" is 1
  -- Otherwise, outputs the last value of data when takeNewValue was 1

  data_signed <= signed(data);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_out1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay1_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  
  Switch_out1 <= Delay1_out1 WHEN takeNewValue = '0' ELSE
      data_signed;

  out_rsvd <= std_logic_vector(Switch_out1);

END rtl;

