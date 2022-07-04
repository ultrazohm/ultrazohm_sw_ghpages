-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj123\hdlsrc\uz_ninephase_VSD_transformation\uz_ninephase_VSD_transformation_src_adder_MultiplyAdd_nw_block38.vhd
-- Created: 2022-06-30 15:39:51
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_ninephase_VSD_transformation_src_adder_MultiplyAdd_nw_block38
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_ninephase_VSD_transformation_src_abc_to_dq_pkg.ALL;

ENTITY uz_ninephase_VSD_transformation_src_adder_MultiplyAdd_nw_block38 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in0                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En17
        in1                               :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        in2                               :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        globalSchedule                    :   IN    std_logic;
        out0                              :   OUT   std_logic_vector(45 DOWNTO 0)  -- sfix46_En33
        );
END uz_ninephase_VSD_transformation_src_adder_MultiplyAdd_nw_block38;


ARCHITECTURE rtl OF uz_ninephase_VSD_transformation_src_adder_MultiplyAdd_nw_block38 IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in2_signed                       : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL HwModeRegister_reg               : vector_of_signed27(0 TO 1);  -- sfix27 [2]
  SIGNAL HwModeRegister_reg_next          : vector_of_signed27(0 TO 1);  -- sfix27_En16 [2]
  SIGNAL MatrixMultiply_4_0               : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL in0_signed                       : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL Constant1_out1t_4                : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL in1_signed                       : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Mux4_out1                        : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL mulOutput                        : signed(44 DOWNTO 0);  -- sfix45_En33
  SIGNAL mulOutput_1                      : signed(44 DOWNTO 0);  -- sfix45_En33
  SIGNAL alpha_adder_MultiplyAdd_add_add_cast : signed(45 DOWNTO 0);  -- sfix46_En33
  SIGNAL alpha_adder_MultiplyAdd_add_add_cast_1 : signed(45 DOWNTO 0);  -- sfix46_En33
  SIGNAL MatrixMultiply_4_0_1             : signed(45 DOWNTO 0);  -- sfix46_En33
  SIGNAL MatrixMultiply_4_0_2             : signed(45 DOWNTO 0);  -- sfix46_En33
  SIGNAL MatrixMultiply_4_0_bypass        : signed(45 DOWNTO 0);  -- sfix46_En33
  SIGNAL MatrixMultiply_4_0_last_value    : signed(45 DOWNTO 0);  -- sfix46_En33

  ATTRIBUTE use_dsp : string;

  ATTRIBUTE use_dsp OF mulOutput : SIGNAL IS "yes";

BEGIN
  enb_gated <= globalSchedule AND enb;

  in2_signed <= signed(in2);

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        HwModeRegister_reg(0) <= to_signed(16#0000000#, 27);
        HwModeRegister_reg(1) <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        HwModeRegister_reg(0) <= HwModeRegister_reg_next(0);
        HwModeRegister_reg(1) <= HwModeRegister_reg_next(1);
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;

  MatrixMultiply_4_0 <= HwModeRegister_reg(1);
  HwModeRegister_reg_next(0) <= in2_signed;
  HwModeRegister_reg_next(1) <= HwModeRegister_reg(0);

  in0_signed <= signed(in0);

  HwModeRegister_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Constant1_out1t_4 <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        Constant1_out1t_4 <= in0_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister_1_process;


  in1_signed <= signed(in1);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Mux4_out1 <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        Mux4_out1 <= in1_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  mulOutput <= Constant1_out1t_4 * Mux4_out1;

  HwModeRegister_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        mulOutput_1 <= to_signed(0, 45);
      ELSIF enb_gated = '1' THEN
        mulOutput_1 <= mulOutput;
      END IF;
    END IF;
  END PROCESS HwModeRegister_2_process;


  alpha_adder_MultiplyAdd_add_add_cast <= resize(MatrixMultiply_4_0 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 46);
  alpha_adder_MultiplyAdd_add_add_cast_1 <= resize(mulOutput_1, 46);
  MatrixMultiply_4_0_1 <= alpha_adder_MultiplyAdd_add_add_cast + alpha_adder_MultiplyAdd_add_add_cast_1;

  HwModeRegister_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        MatrixMultiply_4_0_2 <= to_signed(0, 46);
      ELSIF enb_gated = '1' THEN
        MatrixMultiply_4_0_2 <= MatrixMultiply_4_0_1;
      END IF;
    END IF;
  END PROCESS HwModeRegister_3_process;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        MatrixMultiply_4_0_last_value <= to_signed(0, 46);
      ELSIF enb_gated = '1' THEN
        MatrixMultiply_4_0_last_value <= MatrixMultiply_4_0_bypass;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  MatrixMultiply_4_0_bypass <= MatrixMultiply_4_0_last_value WHEN globalSchedule = '0' ELSE
      MatrixMultiply_4_0_2;

  out0 <= std_logic_vector(MatrixMultiply_4_0_bypass);

END rtl;

