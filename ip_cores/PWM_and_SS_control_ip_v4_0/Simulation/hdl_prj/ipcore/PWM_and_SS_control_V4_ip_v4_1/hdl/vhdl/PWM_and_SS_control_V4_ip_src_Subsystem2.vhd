-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V4_ip_src_Subsystem2.vhd
-- Created: 2022-06-27 11:27:29
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V4_ip_src_Subsystem2
-- Source Path: IP_Core_SS_Switch_and_PWM/PWM_and_Switching_Signal_Control/GenPWM/Triangle shift/Subsystem2
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_V4_ip_src_Subsystem2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        triangle_in                       :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
        modified_triangle_shift           :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
        standardized_peak_of_triangle     :   IN    std_logic_vector(20 DOWNTO 0);  -- ufix21_En17
        Zero_input                        :   IN    std_logic;
        direction_down                    :   IN    std_logic;
        shifted_triangle_in_signal        :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En17
        enable_out                        :   OUT   std_logic
        );
END PWM_and_SS_control_V4_ip_src_Subsystem2;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip_src_Subsystem2 IS

  -- Signals
  SIGNAL standardized_peak_of_triangle_unsigned : unsigned(20 DOWNTO 0);  -- ufix21_En17
  SIGNAL standardized_peak_of_triangle_1  : unsigned(20 DOWNTO 0);  -- ufix21_En17
  SIGNAL modified_triangle_shift_signed   : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Sum1_sub_cast                    : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Sum1_sub_cast_1                  : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Sum1_out1                        : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Sum5_stage2_add_cast             : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_stage2_add_cast_1           : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_op_stage1                   : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL triangle_in_signed               : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Sum5_stage3_sub_cast             : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_stage3_sub_temp             : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_out1                        : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Zero_input_1                     : std_logic;
  SIGNAL Relational_Operator9_1_cast      : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Relational_Operator9_relop1      : std_logic;
  SIGNAL and_out1                         : std_logic;

BEGIN
  standardized_peak_of_triangle_unsigned <= unsigned(standardized_peak_of_triangle);

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        standardized_peak_of_triangle_1 <= to_unsigned(16#000000#, 21);
      ELSIF enb = '1' THEN
        standardized_peak_of_triangle_1 <= standardized_peak_of_triangle_unsigned;
      END IF;
    END IF;
  END PROCESS reduced_process;


  modified_triangle_shift_signed <= signed(modified_triangle_shift);

  Sum1_sub_cast <= signed(resize(standardized_peak_of_triangle_1, 23));
  Sum1_sub_cast_1 <= resize(modified_triangle_shift_signed, 23);
  Sum1_out1 <= Sum1_sub_cast - Sum1_sub_cast_1;

  Sum5_stage2_add_cast <= resize(Sum1_out1, 24);
  Sum5_stage2_add_cast_1 <= signed(resize(standardized_peak_of_triangle_1, 24));
  Sum5_op_stage1 <= Sum5_stage2_add_cast + Sum5_stage2_add_cast_1;

  triangle_in_signed <= signed(triangle_in);

  Sum5_stage3_sub_cast <= resize(triangle_in_signed, 24);
  Sum5_stage3_sub_temp <= Sum5_op_stage1 - Sum5_stage3_sub_cast;
  Sum5_out1 <= Sum5_stage3_sub_temp(20 DOWNTO 0);

  shifted_triangle_in_signal <= std_logic_vector(Sum5_out1);

  
  switch_compare_1 <= '1' WHEN direction_down > '0' ELSE
      '0';

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Zero_input_1 <= '0';
      ELSIF enb = '1' THEN
        Zero_input_1 <= Zero_input;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  Relational_Operator9_1_cast <= resize(triangle_in_signed, 23);
  
  Relational_Operator9_relop1 <= '1' WHEN Relational_Operator9_1_cast >= Sum1_out1 ELSE
      '0';

  
  and_out1 <= Zero_input_1 WHEN switch_compare_1 = '0' ELSE
      Relational_Operator9_relop1;

  enable_out <= and_out1;

END rtl;

