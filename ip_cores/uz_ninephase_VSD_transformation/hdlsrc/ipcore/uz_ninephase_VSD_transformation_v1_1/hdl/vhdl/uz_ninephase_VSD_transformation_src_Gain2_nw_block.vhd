-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_ninephase_VSD_transformation\hdlsrc\hdlsrc\uz_ninephase_VSD_transformation\uz_ninephase_VSD_transformation_src_Gain2_nw_block.vhd
-- Created: 2022-08-31 14:46:30
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_ninephase_VSD_transformation_src_Gain2_nw_block
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_ninephase_VSD_transformation_src_abc_to_dq_pkg.ALL;

ENTITY uz_ninephase_VSD_transformation_src_Gain2_nw_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in0                               :   IN    vector_of_std_logic_vector27(0 TO 2);  -- sfix27_En16 [3]
        in1                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        globalSchedule                    :   IN    std_logic;
        out0                              :   OUT   vector_of_std_logic_vector45(0 TO 2)  -- sfix45_En32 [3]
        );
END uz_ninephase_VSD_transformation_src_Gain2_nw_block;


ARCHITECTURE rtl OF uz_ninephase_VSD_transformation_src_Gain2_nw_block IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in0_signed                       : vector_of_signed27(0 TO 2);  -- sfix27_En16 [3]
  SIGNAL Gain4_out1                       : vector_of_signed27(0 TO 2);  -- sfix27_En16 [3]
  SIGNAL in1_signed                       : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL kconst                           : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Gain2_out1                       : vector_of_signed45(0 TO 2);  -- sfix45_En32 [3]
  SIGNAL Gain2_out1_1                     : vector_of_signed45(0 TO 2);  -- sfix45_En32 [3]
  SIGNAL Gain2_out1_bypass                : vector_of_signed45(0 TO 2);  -- sfix45_En32 [3]
  SIGNAL Gain2_out1_last_value            : vector_of_signed45(0 TO 2);  -- sfix45_En32 [3]

BEGIN
  enb_gated <= globalSchedule AND enb;

  outputgen1: FOR k IN 0 TO 2 GENERATE
    in0_signed(k) <= signed(in0(k));
  END GENERATE;

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Gain4_out1(0) <= to_signed(16#0000000#, 27);
        Gain4_out1(1) <= to_signed(16#0000000#, 27);
        Gain4_out1(2) <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        Gain4_out1(0) <= in0_signed(0);
        Gain4_out1(1) <= in0_signed(1);
        Gain4_out1(2) <= in0_signed(2);
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  in1_signed <= signed(in1);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        kconst <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        kconst <= in1_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  Gain2_out1(0) <= Gain4_out1(0) * kconst;
  Gain2_out1(1) <= Gain4_out1(1) * kconst;
  Gain2_out1(2) <= Gain4_out1(2) * kconst;

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Gain2_out1_1(0) <= to_signed(0, 45);
        Gain2_out1_1(1) <= to_signed(0, 45);
        Gain2_out1_1(2) <= to_signed(0, 45);
      ELSIF enb_gated = '1' THEN
        Gain2_out1_1(0) <= Gain2_out1(0);
        Gain2_out1_1(1) <= Gain2_out1(1);
        Gain2_out1_1(2) <= Gain2_out1(2);
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Gain2_out1_last_value(0) <= to_signed(0, 45);
        Gain2_out1_last_value(1) <= to_signed(0, 45);
        Gain2_out1_last_value(2) <= to_signed(0, 45);
      ELSIF enb_gated = '1' THEN
        Gain2_out1_last_value(0) <= Gain2_out1_bypass(0);
        Gain2_out1_last_value(1) <= Gain2_out1_bypass(1);
        Gain2_out1_last_value(2) <= Gain2_out1_bypass(2);
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  Gain2_out1_bypass(0) <= Gain2_out1_last_value(0) WHEN globalSchedule = '0' ELSE
      Gain2_out1_1(0);
  
  Gain2_out1_bypass(1) <= Gain2_out1_last_value(1) WHEN globalSchedule = '0' ELSE
      Gain2_out1_1(1);
  
  Gain2_out1_bypass(2) <= Gain2_out1_last_value(2) WHEN globalSchedule = '0' ELSE
      Gain2_out1_1(2);

  outputgen: FOR k IN 0 TO 2 GENERATE
    out0(k) <= std_logic_vector(Gain2_out1_bypass(k));
  END GENERATE;

END rtl;

