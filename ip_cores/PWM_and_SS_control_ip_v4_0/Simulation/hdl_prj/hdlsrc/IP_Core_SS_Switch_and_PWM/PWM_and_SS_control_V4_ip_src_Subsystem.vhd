-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V4_ip_src_Subsystem.vhd
-- Created: 2022-06-27 11:27:29
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V4_ip_src_Subsystem
-- Source Path: IP_Core_SS_Switch_and_PWM/PWM_and_Switching_Signal_Control/GenPWM/Triangle shift/Subsystem
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_V4_ip_src_Subsystem IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Zero_input                        :   IN    std_logic;
        converted_triangle_shift          :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
        modified_triangle_shift           :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
        triangle_in                       :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
        direction_down                    :   IN    std_logic;
        shifted_triangle_in_signal        :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En17
        enable_out                        :   OUT   std_logic
        );
END PWM_and_SS_control_V4_ip_src_Subsystem;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip_src_Subsystem IS

  -- Signals
  SIGNAL modified_triangle_shift_signed   : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Unary_Minus_cast                 : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Unary_Minus_cast_1               : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Unary_Minus_out1                 : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL triangle_in_signed               : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Sum8_sub_cast                    : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum8_sub_cast_1                  : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum8_out1                        : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Zero_input_1                     : std_logic;
  SIGNAL Relational_Operator11_relop1     : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL converted_triangle_shift_signed  : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL converted_triangle_shift_dtc     : std_logic;
  SIGNAL and2_1_out1                      : std_logic;
  SIGNAL and2_2_out1                      : std_logic;

BEGIN
  -- AND block replaced with 
  -- switches for better performance

  modified_triangle_shift_signed <= signed(modified_triangle_shift);

  Unary_Minus_cast <= resize(modified_triangle_shift_signed, 21);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(19 DOWNTO 0);

  triangle_in_signed <= signed(triangle_in);

  Sum8_sub_cast <= resize(Unary_Minus_out1, 21);
  Sum8_sub_cast_1 <= resize(triangle_in_signed, 21);
  Sum8_out1 <= Sum8_sub_cast - Sum8_sub_cast_1;

  shifted_triangle_in_signal <= std_logic_vector(Sum8_out1);

  
  switch_compare_1 <= '1' WHEN direction_down > '0' ELSE
      '0';

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Zero_input_1 <= '0';
      ELSIF enb = '1' THEN
        Zero_input_1 <= Zero_input;
      END IF;
    END IF;
  END PROCESS reduced_process;


  
  Relational_Operator11_relop1 <= '1' WHEN triangle_in_signed <= Unary_Minus_out1 ELSE
      '0';

  
  switch_compare_1_1 <= '1' WHEN Relational_Operator11_relop1 > '0' ELSE
      '0';

  converted_triangle_shift_signed <= signed(converted_triangle_shift);

  
  converted_triangle_shift_dtc <= '1' WHEN converted_triangle_shift_signed /= to_signed(16#00000#, 20) ELSE
      '0';

  
  and2_1_out1 <= Zero_input_1 WHEN switch_compare_1_1 = '0' ELSE
      converted_triangle_shift_dtc;

  
  and2_2_out1 <= Zero_input_1 WHEN switch_compare_1 = '0' ELSE
      and2_1_out1;

  enable_out <= and2_2_out1;

END rtl;

