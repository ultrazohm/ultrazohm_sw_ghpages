-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_ninephase_VSD_transformation\hdl_proj\hdlsrc\uz_ninephase_VSD_transformation\uz_ninephase_VSD_transformation_src_MMul_dot_product_nw_block1.vhd
-- Created: 2022-10-17 11:05:06
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_ninephase_VSD_transformation_src_MMul_dot_product_nw_block1
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_ninephase_VSD_transformation_src_abc_to_dq_pkg.ALL;

ENTITY uz_ninephase_VSD_transformation_src_MMul_dot_product_nw_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in0                               :   IN    vector_of_std_logic_vector18(0 TO 8);  -- sfix18_En16 [9]
        in1                               :   IN    vector_of_std_logic_vector27(0 TO 8);  -- sfix27_En16 [9]
        globalSchedule                    :   IN    std_logic;
        out0                              :   OUT   vector_of_std_logic_vector45(0 TO 8)  -- sfix45_En32 [9]
        );
END uz_ninephase_VSD_transformation_src_MMul_dot_product_nw_block1;


ARCHITECTURE rtl OF uz_ninephase_VSD_transformation_src_MMul_dot_product_nw_block1 IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in0_signed                       : vector_of_signed18(0 TO 8);  -- sfix18_En16 [9]
  SIGNAL HwModeRegister_reg               : vector_of_signed18(0 TO 8);  -- sfix18 [9]
  SIGNAL HwModeRegister_reg_next          : vector_of_signed18(0 TO 8);  -- sfix18_En16 [9]
  SIGNAL s                                : vector_of_signed18(0 TO 8);  -- sfix18_En16 [9]
  SIGNAL in1_signed                       : vector_of_signed27(0 TO 8);  -- sfix27_En16 [9]
  SIGNAL HwModeRegister1_reg              : vector_of_signed27(0 TO 8);  -- sfix27 [9]
  SIGNAL HwModeRegister1_reg_next         : vector_of_signed27(0 TO 8);  -- sfix27_En16 [9]
  SIGNAL s_1                              : vector_of_signed27(0 TO 8);  -- sfix27_En16 [9]
  SIGNAL MMul_dot_product_out             : vector_of_signed45(0 TO 8);  -- sfix45_En32 [9]
  SIGNAL PipelineRegister_reg             : vector_of_signed45(0 TO 8);  -- sfix45 [9]
  SIGNAL PipelineRegister_reg_next        : vector_of_signed45(0 TO 8);  -- sfix45_En32 [9]
  SIGNAL MMul_dot_product_out_1           : vector_of_signed45(0 TO 8);  -- sfix45_En32 [9]
  SIGNAL MMul_dot_product_out_bypass      : vector_of_signed45(0 TO 8);  -- sfix45_En32 [9]
  SIGNAL out0_bypass_reg                  : vector_of_signed45(0 TO 8);  -- sfix45 [9]
  SIGNAL out0_bypass_reg_next             : vector_of_signed45(0 TO 8);  -- sfix45_En32 [9]
  SIGNAL MMul_dot_product_out_last_value  : vector_of_signed45(0 TO 8);  -- sfix45_En32 [9]

BEGIN
  enb_gated <= globalSchedule AND enb;

  outputgen2: FOR k IN 0 TO 8 GENERATE
    in0_signed(k) <= signed(in0(k));
  END GENERATE;

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        HwModeRegister_reg(0) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(1) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(2) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(3) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(4) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(5) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(6) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(7) <= to_signed(16#00000#, 18);
        HwModeRegister_reg(8) <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        HwModeRegister_reg(0) <= HwModeRegister_reg_next(0);
        HwModeRegister_reg(1) <= HwModeRegister_reg_next(1);
        HwModeRegister_reg(2) <= HwModeRegister_reg_next(2);
        HwModeRegister_reg(3) <= HwModeRegister_reg_next(3);
        HwModeRegister_reg(4) <= HwModeRegister_reg_next(4);
        HwModeRegister_reg(5) <= HwModeRegister_reg_next(5);
        HwModeRegister_reg(6) <= HwModeRegister_reg_next(6);
        HwModeRegister_reg(7) <= HwModeRegister_reg_next(7);
        HwModeRegister_reg(8) <= HwModeRegister_reg_next(8);
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;

  s(0) <= HwModeRegister_reg(0);
  s(1) <= HwModeRegister_reg(1);
  s(2) <= HwModeRegister_reg(2);
  s(3) <= HwModeRegister_reg(3);
  s(4) <= HwModeRegister_reg(4);
  s(5) <= HwModeRegister_reg(5);
  s(6) <= HwModeRegister_reg(6);
  s(7) <= HwModeRegister_reg(7);
  s(8) <= HwModeRegister_reg(8);
  HwModeRegister_reg_next(0) <= in0_signed(0);
  HwModeRegister_reg_next(1) <= in0_signed(1);
  HwModeRegister_reg_next(2) <= in0_signed(2);
  HwModeRegister_reg_next(3) <= in0_signed(3);
  HwModeRegister_reg_next(4) <= in0_signed(4);
  HwModeRegister_reg_next(5) <= in0_signed(5);
  HwModeRegister_reg_next(6) <= in0_signed(6);
  HwModeRegister_reg_next(7) <= in0_signed(7);
  HwModeRegister_reg_next(8) <= in0_signed(8);

  outputgen1: FOR k IN 0 TO 8 GENERATE
    in1_signed(k) <= signed(in1(k));
  END GENERATE;

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        HwModeRegister1_reg(0) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(1) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(2) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(3) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(4) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(5) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(6) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(7) <= to_signed(16#0000000#, 27);
        HwModeRegister1_reg(8) <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        HwModeRegister1_reg(0) <= HwModeRegister1_reg_next(0);
        HwModeRegister1_reg(1) <= HwModeRegister1_reg_next(1);
        HwModeRegister1_reg(2) <= HwModeRegister1_reg_next(2);
        HwModeRegister1_reg(3) <= HwModeRegister1_reg_next(3);
        HwModeRegister1_reg(4) <= HwModeRegister1_reg_next(4);
        HwModeRegister1_reg(5) <= HwModeRegister1_reg_next(5);
        HwModeRegister1_reg(6) <= HwModeRegister1_reg_next(6);
        HwModeRegister1_reg(7) <= HwModeRegister1_reg_next(7);
        HwModeRegister1_reg(8) <= HwModeRegister1_reg_next(8);
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;

  s_1(0) <= HwModeRegister1_reg(0);
  s_1(1) <= HwModeRegister1_reg(1);
  s_1(2) <= HwModeRegister1_reg(2);
  s_1(3) <= HwModeRegister1_reg(3);
  s_1(4) <= HwModeRegister1_reg(4);
  s_1(5) <= HwModeRegister1_reg(5);
  s_1(6) <= HwModeRegister1_reg(6);
  s_1(7) <= HwModeRegister1_reg(7);
  s_1(8) <= HwModeRegister1_reg(8);
  HwModeRegister1_reg_next(0) <= in1_signed(0);
  HwModeRegister1_reg_next(1) <= in1_signed(1);
  HwModeRegister1_reg_next(2) <= in1_signed(2);
  HwModeRegister1_reg_next(3) <= in1_signed(3);
  HwModeRegister1_reg_next(4) <= in1_signed(4);
  HwModeRegister1_reg_next(5) <= in1_signed(5);
  HwModeRegister1_reg_next(6) <= in1_signed(6);
  HwModeRegister1_reg_next(7) <= in1_signed(7);
  HwModeRegister1_reg_next(8) <= in1_signed(8);

  MMul_dot_product_out(0) <= s(0) * s_1(0);
  MMul_dot_product_out(1) <= s(1) * s_1(1);
  MMul_dot_product_out(2) <= s(2) * s_1(2);
  MMul_dot_product_out(3) <= s(3) * s_1(3);
  MMul_dot_product_out(4) <= s(4) * s_1(4);
  MMul_dot_product_out(5) <= s(5) * s_1(5);
  MMul_dot_product_out(6) <= s(6) * s_1(6);
  MMul_dot_product_out(7) <= s(7) * s_1(7);
  MMul_dot_product_out(8) <= s(8) * s_1(8);

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        PipelineRegister_reg(0) <= to_signed(0, 45);
        PipelineRegister_reg(1) <= to_signed(0, 45);
        PipelineRegister_reg(2) <= to_signed(0, 45);
        PipelineRegister_reg(3) <= to_signed(0, 45);
        PipelineRegister_reg(4) <= to_signed(0, 45);
        PipelineRegister_reg(5) <= to_signed(0, 45);
        PipelineRegister_reg(6) <= to_signed(0, 45);
        PipelineRegister_reg(7) <= to_signed(0, 45);
        PipelineRegister_reg(8) <= to_signed(0, 45);
      ELSIF enb_gated = '1' THEN
        PipelineRegister_reg(0) <= PipelineRegister_reg_next(0);
        PipelineRegister_reg(1) <= PipelineRegister_reg_next(1);
        PipelineRegister_reg(2) <= PipelineRegister_reg_next(2);
        PipelineRegister_reg(3) <= PipelineRegister_reg_next(3);
        PipelineRegister_reg(4) <= PipelineRegister_reg_next(4);
        PipelineRegister_reg(5) <= PipelineRegister_reg_next(5);
        PipelineRegister_reg(6) <= PipelineRegister_reg_next(6);
        PipelineRegister_reg(7) <= PipelineRegister_reg_next(7);
        PipelineRegister_reg(8) <= PipelineRegister_reg_next(8);
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;

  MMul_dot_product_out_1(0) <= PipelineRegister_reg(0);
  MMul_dot_product_out_1(1) <= PipelineRegister_reg(1);
  MMul_dot_product_out_1(2) <= PipelineRegister_reg(2);
  MMul_dot_product_out_1(3) <= PipelineRegister_reg(3);
  MMul_dot_product_out_1(4) <= PipelineRegister_reg(4);
  MMul_dot_product_out_1(5) <= PipelineRegister_reg(5);
  MMul_dot_product_out_1(6) <= PipelineRegister_reg(6);
  MMul_dot_product_out_1(7) <= PipelineRegister_reg(7);
  MMul_dot_product_out_1(8) <= PipelineRegister_reg(8);
  PipelineRegister_reg_next(0) <= MMul_dot_product_out(0);
  PipelineRegister_reg_next(1) <= MMul_dot_product_out(1);
  PipelineRegister_reg_next(2) <= MMul_dot_product_out(2);
  PipelineRegister_reg_next(3) <= MMul_dot_product_out(3);
  PipelineRegister_reg_next(4) <= MMul_dot_product_out(4);
  PipelineRegister_reg_next(5) <= MMul_dot_product_out(5);
  PipelineRegister_reg_next(6) <= MMul_dot_product_out(6);
  PipelineRegister_reg_next(7) <= MMul_dot_product_out(7);
  PipelineRegister_reg_next(8) <= MMul_dot_product_out(8);

  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out0_bypass_reg(0) <= to_signed(0, 45);
        out0_bypass_reg(1) <= to_signed(0, 45);
        out0_bypass_reg(2) <= to_signed(0, 45);
        out0_bypass_reg(3) <= to_signed(0, 45);
        out0_bypass_reg(4) <= to_signed(0, 45);
        out0_bypass_reg(5) <= to_signed(0, 45);
        out0_bypass_reg(6) <= to_signed(0, 45);
        out0_bypass_reg(7) <= to_signed(0, 45);
        out0_bypass_reg(8) <= to_signed(0, 45);
      ELSIF enb_gated = '1' THEN
        out0_bypass_reg(0) <= out0_bypass_reg_next(0);
        out0_bypass_reg(1) <= out0_bypass_reg_next(1);
        out0_bypass_reg(2) <= out0_bypass_reg_next(2);
        out0_bypass_reg(3) <= out0_bypass_reg_next(3);
        out0_bypass_reg(4) <= out0_bypass_reg_next(4);
        out0_bypass_reg(5) <= out0_bypass_reg_next(5);
        out0_bypass_reg(6) <= out0_bypass_reg_next(6);
        out0_bypass_reg(7) <= out0_bypass_reg_next(7);
        out0_bypass_reg(8) <= out0_bypass_reg_next(8);
      END IF;
    END IF;
  END PROCESS out0_bypass_process;

  MMul_dot_product_out_last_value(0) <= out0_bypass_reg(0);
  MMul_dot_product_out_last_value(1) <= out0_bypass_reg(1);
  MMul_dot_product_out_last_value(2) <= out0_bypass_reg(2);
  MMul_dot_product_out_last_value(3) <= out0_bypass_reg(3);
  MMul_dot_product_out_last_value(4) <= out0_bypass_reg(4);
  MMul_dot_product_out_last_value(5) <= out0_bypass_reg(5);
  MMul_dot_product_out_last_value(6) <= out0_bypass_reg(6);
  MMul_dot_product_out_last_value(7) <= out0_bypass_reg(7);
  MMul_dot_product_out_last_value(8) <= out0_bypass_reg(8);
  out0_bypass_reg_next(0) <= MMul_dot_product_out_bypass(0);
  out0_bypass_reg_next(1) <= MMul_dot_product_out_bypass(1);
  out0_bypass_reg_next(2) <= MMul_dot_product_out_bypass(2);
  out0_bypass_reg_next(3) <= MMul_dot_product_out_bypass(3);
  out0_bypass_reg_next(4) <= MMul_dot_product_out_bypass(4);
  out0_bypass_reg_next(5) <= MMul_dot_product_out_bypass(5);
  out0_bypass_reg_next(6) <= MMul_dot_product_out_bypass(6);
  out0_bypass_reg_next(7) <= MMul_dot_product_out_bypass(7);
  out0_bypass_reg_next(8) <= MMul_dot_product_out_bypass(8);

  
  MMul_dot_product_out_bypass(0) <= MMul_dot_product_out_last_value(0) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(0);
  
  MMul_dot_product_out_bypass(1) <= MMul_dot_product_out_last_value(1) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(1);
  
  MMul_dot_product_out_bypass(2) <= MMul_dot_product_out_last_value(2) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(2);
  
  MMul_dot_product_out_bypass(3) <= MMul_dot_product_out_last_value(3) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(3);
  
  MMul_dot_product_out_bypass(4) <= MMul_dot_product_out_last_value(4) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(4);
  
  MMul_dot_product_out_bypass(5) <= MMul_dot_product_out_last_value(5) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(5);
  
  MMul_dot_product_out_bypass(6) <= MMul_dot_product_out_last_value(6) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(6);
  
  MMul_dot_product_out_bypass(7) <= MMul_dot_product_out_last_value(7) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(7);
  
  MMul_dot_product_out_bypass(8) <= MMul_dot_product_out_last_value(8) WHEN globalSchedule = '0' ELSE
      MMul_dot_product_out_1(8);

  outputgen: FOR k IN 0 TO 8 GENERATE
    out0(k) <= std_logic_vector(MMul_dot_product_out_bypass(k));
  END GENERATE;

END rtl;

