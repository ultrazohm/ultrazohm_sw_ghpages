-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_ninephase_VSD_transformation\hdlsrc\hdlsrc\uz_ninephase_VSD_transformation\uz_ninephase_VSD_transformation_src_Divide_nw_block.vhd
-- Created: 2022-08-31 14:46:30
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_ninephase_VSD_transformation_src_Divide_nw_block
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_ninephase_VSD_transformation_src_Divide_nw_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in0                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        in1                               :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        globalSchedule                    :   IN    std_logic;
        out0                              :   OUT   std_logic_vector(26 DOWNTO 0)  -- sfix27_En18
        );
END uz_ninephase_VSD_transformation_src_Divide_nw_block;


ARCHITECTURE rtl OF uz_ninephase_VSD_transformation_src_Divide_nw_block IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in0_signed                       : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Cosine                           : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL in1_signed                       : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL i_d                              : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL Divide_mul_temp                  : signed(44 DOWNTO 0);  -- sfix45_En34
  SIGNAL Divide_out1                      : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL Divide_out1_1                    : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL Divide_out1_bypass               : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL Divide_out1_last_value           : signed(26 DOWNTO 0);  -- sfix27_En18

BEGIN
  enb_gated <= globalSchedule AND enb;

  in0_signed <= signed(in0);

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Cosine <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        Cosine <= in0_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  in1_signed <= signed(in1);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        i_d <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        i_d <= in1_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  Divide_mul_temp <= Cosine * i_d;
  Divide_out1 <= Divide_mul_temp(42 DOWNTO 16);

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Divide_out1_1 <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        Divide_out1_1 <= Divide_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Divide_out1_last_value <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        Divide_out1_last_value <= Divide_out1_bypass;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  Divide_out1_bypass <= Divide_out1_last_value WHEN globalSchedule = '0' ELSE
      Divide_out1_1;

  out0 <= std_logic_vector(Divide_out1_bypass);

END rtl;

