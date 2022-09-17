-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw_working\ip_cores\uz_sixphase_VSD_transformation\hdl_prj\hdlsrc\uz_sixphase_VSD_transformation\uz_sixphase_VSD_transformation_src_Gain_nw.vhd
-- Created: 2022-09-17 18:31:03
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_sixphase_VSD_transformation_src_Gain_nw
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_sixphase_VSD_transformation_src_Gain_nw IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in0                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En19
        in1                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En14
        globalSchedule                    :   IN    std_logic;
        out0                              :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
        );
END uz_sixphase_VSD_transformation_src_Gain_nw;


ARCHITECTURE rtl OF uz_sixphase_VSD_transformation_src_Gain_nw IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in0_signed                       : signed(17 DOWNTO 0);  -- sfix18_En19
  SIGNAL kconst                           : signed(17 DOWNTO 0);  -- sfix18_En19
  SIGNAL in1_signed                       : signed(17 DOWNTO 0);  -- sfix18_En14
  SIGNAL Delay1_out1                      : signed(17 DOWNTO 0);  -- sfix18_En14
  SIGNAL Gain_mul_temp                    : signed(35 DOWNTO 0);  -- sfix36_En33
  SIGNAL Gain_out1                        : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Gain_out1_1                      : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Gain_out1_bypass                 : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Gain_out1_last_value             : signed(17 DOWNTO 0);  -- sfix18_En16

BEGIN
  enb_gated <= globalSchedule AND enb;

  in0_signed <= signed(in0);

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        kconst <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        kconst <= in0_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  in1_signed <= signed(in1);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_out1 <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        Delay1_out1 <= in1_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  Gain_mul_temp <= kconst * Delay1_out1;
  Gain_out1 <= Gain_mul_temp(34 DOWNTO 17);

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Gain_out1_1 <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        Gain_out1_1 <= Gain_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Gain_out1_last_value <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        Gain_out1_last_value <= Gain_out1_bypass;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  Gain_out1_bypass <= Gain_out1_last_value WHEN globalSchedule = '0' ELSE
      Gain_out1_1;

  out0 <= std_logic_vector(Gain_out1_bypass);

END rtl;

