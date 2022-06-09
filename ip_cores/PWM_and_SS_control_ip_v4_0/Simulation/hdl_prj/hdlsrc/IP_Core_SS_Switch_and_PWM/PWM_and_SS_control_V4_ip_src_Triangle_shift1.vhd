-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/IP_Core_SS_Switch_and_PWM/PWM_and_SS_control_V4_ip_src_Triangle_shift1.vhd
-- Created: 2022-06-09 09:07:01
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V4_ip_src_Triangle_shift1
-- Source Path: IP_Core_SS_Switch_and_PWM/PWM_and_Switching_Signal_Control/GenPWM/Triangle shift1
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_V4_ip_src_Triangle_shift1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        triangle_in                       :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
        triangle_shift                    :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
        triangle_sig                      :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
        );
END PWM_and_SS_control_V4_ip_src_Triangle_shift1;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip_src_Triangle_shift1 IS

  -- Signals
  SIGNAL triangle_in_unsigned             : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Data_Type_Conversion1_out1       : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Delay1_out1                      : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL alpha0_out1                      : std_logic;
  SIGNAL standardized_peak_of_triangle_out1 : unsigned(20 DOWNTO 0);  -- ufix21_En17
  SIGNAL triangle_shift_unsigned          : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Data_Type_Conversion_out1        : signed(18 DOWNTO 0);  -- sfix19_En17
  SIGNAL Gain_cast                        : signed(37 DOWNTO 0);  -- sfix38_En33
  SIGNAL Gain_out1                        : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Gain1_cast                       : unsigned(41 DOWNTO 0);  -- ufix42_En36
  SIGNAL Gain1_out1                       : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Gain1_out1_1                     : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Sum10_out1                       : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL sw4_out1                         : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Sum1_sub_cast                    : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Sum1_sub_cast_1                  : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Sum1_out1                        : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Relational_Operator9_1_cast      : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Relational_Operator9_relop1      : std_logic;
  SIGNAL Delay2_out1                      : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Relational_Operator7_relop1      : std_logic;
  SIGNAL direction_up                     : std_logic;
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL Sum6_add_cast                    : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Sum6_add_cast_1                  : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Sum6_out1                        : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Relational_Operator2_1_cast      : signed(22 DOWNTO 0);  -- sfix23_En17
  SIGNAL Relational_Operator2_relop1      : std_logic;
  SIGNAL switch_compare_1_3               : std_logic;
  SIGNAL Gain_out1_dtc                    : std_logic;
  SIGNAL and1_1_out1                      : std_logic;
  SIGNAL and1_2_out1                      : std_logic;
  SIGNAL switch_compare_1_4               : std_logic;
  SIGNAL switch_compare_1_5               : std_logic;
  SIGNAL Unary_Minus_cast                 : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Unary_Minus_cast_1               : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Unary_Minus_out1                 : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Relational_Operator11_relop1     : std_logic;
  SIGNAL switch_compare_1_6               : std_logic;
  SIGNAL Gain_out1_dtc_1                  : std_logic;
  SIGNAL and2_1_out1                      : std_logic;
  SIGNAL and2_2_out1                      : std_logic;
  SIGNAL switch_compare_1_7               : std_logic;
  SIGNAL Relational_Operator6_relop1      : std_logic;
  SIGNAL switch_compare_1_8               : std_logic;
  SIGNAL Sum3_sub_cast                    : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum3_sub_cast_1                  : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum3_out1                        : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL switch_compare_1_9               : std_logic;
  SIGNAL Sum8_sub_cast                    : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum8_sub_cast_1                  : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum8_out1                        : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum11_stage2_add_cast            : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum11_stage2_add_cast_1          : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum11_op_stage1                  : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_stage2_add_cast             : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_stage2_add_cast_1           : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_op_stage1                   : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL and_out1                         : std_logic;
  SIGNAL switch_compare_1_10              : std_logic;
  SIGNAL or_out1                          : std_logic;
  SIGNAL switch_compare_1_11              : std_logic;
  SIGNAL Sum4_add_cast                    : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum4_add_cast_1                  : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum4_out1                        : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum2_sub_cast                    : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum2_sub_cast_1                  : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum2_out1                        : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Switch3_out1                     : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL sw_out1                          : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum11_stage3_sub_cast            : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum11_stage3_sub_temp            : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum11_out1                       : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL sw3_out1                         : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL sw2_out1                         : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL sw2_out1_dtc                     : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Sum5_stage3_sub_cast             : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_stage3_sub_temp             : signed(23 DOWNTO 0);  -- sfix24_En17
  SIGNAL Sum5_out1                        : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Sum5_out1_dtc                    : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL sw1_out1                         : signed(17 DOWNTO 0);  -- sfix18_En16

BEGIN
  triangle_in_unsigned <= unsigned(triangle_in);

  Data_Type_Conversion1_out1 <= signed(resize(triangle_in_unsigned, 20));

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_out1 <= to_signed(16#00000#, 20);
      ELSIF enb = '1' THEN
        Delay1_out1 <= Data_Type_Conversion1_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  
  Relational_Operator1_relop1 <= '1' WHEN Data_Type_Conversion1_out1 <= Delay1_out1 ELSE
      '0';

  
  switch_compare_1 <= '1' WHEN Relational_Operator1_relop1 > '0' ELSE
      '0';

  alpha0_out1 <= '0';

  standardized_peak_of_triangle_out1 <= to_unsigned(16#020000#, 21);

  triangle_shift_unsigned <= unsigned(triangle_shift);

  Data_Type_Conversion_out1 <= signed(resize(triangle_shift_unsigned, 19));

  Gain_cast <= resize(Data_Type_Conversion_out1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 38);
  Gain_out1 <= Gain_cast(35 DOWNTO 16);

  
  switch_compare_1_1 <= '1' WHEN Gain_out1 > to_signed(16#20000#, 20) ELSE
      '0';

  Gain1_cast <= resize(standardized_peak_of_triangle_out1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 42);
  Gain1_out1 <= signed(Gain1_cast(38 DOWNTO 19));

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Gain1_out1_1 <= to_signed(16#00000#, 20);
      ELSIF enb = '1' THEN
        Gain1_out1_1 <= Gain1_out1;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  Sum10_out1 <= Gain_out1 - Gain1_out1_1;

  
  sw4_out1 <= Gain_out1 WHEN switch_compare_1_1 = '0' ELSE
      Sum10_out1;

  Sum1_sub_cast <= signed(resize(standardized_peak_of_triangle_out1, 23));
  Sum1_sub_cast_1 <= resize(sw4_out1, 23);
  Sum1_out1 <= Sum1_sub_cast - Sum1_sub_cast_1;

  Relational_Operator9_1_cast <= resize(Data_Type_Conversion1_out1, 23);
  
  Relational_Operator9_relop1 <= '1' WHEN Relational_Operator9_1_cast >= Sum1_out1 ELSE
      '0';

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_out1 <= to_unsigned(16#00000#, 18);
      ELSIF enb = '1' THEN
        Delay2_out1 <= triangle_in_unsigned;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  
  Relational_Operator7_relop1 <= '1' WHEN triangle_in_unsigned >= Delay2_out1 ELSE
      '0';

  direction_up <= Relational_Operator7_relop1;

  
  switch_compare_1_2 <= '1' WHEN direction_up > '0' ELSE
      '0';

  Sum6_add_cast <= resize(sw4_out1, 23);
  Sum6_add_cast_1 <= signed(resize(standardized_peak_of_triangle_out1, 23));
  Sum6_out1 <= Sum6_add_cast + Sum6_add_cast_1;

  Relational_Operator2_1_cast <= resize(Data_Type_Conversion1_out1, 23);
  
  Relational_Operator2_relop1 <= '1' WHEN Relational_Operator2_1_cast >= Sum6_out1 ELSE
      '0';

  
  switch_compare_1_3 <= '1' WHEN Relational_Operator2_relop1 > '0' ELSE
      '0';

  
  Gain_out1_dtc <= '1' WHEN Gain_out1 /= to_signed(16#00000#, 20) ELSE
      '0';

  
  and1_1_out1 <= alpha0_out1 WHEN switch_compare_1_3 = '0' ELSE
      Gain_out1_dtc;

  
  and1_2_out1 <= alpha0_out1 WHEN switch_compare_1_2 = '0' ELSE
      and1_1_out1;

  
  switch_compare_1_4 <= '1' WHEN and1_2_out1 > '0' ELSE
      '0';

  
  switch_compare_1_5 <= '1' WHEN Relational_Operator1_relop1 > '0' ELSE
      '0';

  Unary_Minus_cast <= resize(sw4_out1, 21);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(19 DOWNTO 0);

  
  Relational_Operator11_relop1 <= '1' WHEN Data_Type_Conversion1_out1 <= Unary_Minus_out1 ELSE
      '0';

  
  switch_compare_1_6 <= '1' WHEN Relational_Operator11_relop1 > '0' ELSE
      '0';

  
  Gain_out1_dtc_1 <= '1' WHEN Gain_out1 /= to_signed(16#00000#, 20) ELSE
      '0';

  
  and2_1_out1 <= alpha0_out1 WHEN switch_compare_1_6 = '0' ELSE
      Gain_out1_dtc_1;

  
  and2_2_out1 <= alpha0_out1 WHEN switch_compare_1_5 = '0' ELSE
      and2_1_out1;

  
  switch_compare_1_7 <= '1' WHEN direction_up > '0' ELSE
      '0';

  
  Relational_Operator6_relop1 <= '1' WHEN Data_Type_Conversion1_out1 <= sw4_out1 ELSE
      '0';

  
  switch_compare_1_8 <= '1' WHEN Relational_Operator6_relop1 > '0' ELSE
      '0';

  Sum3_sub_cast <= resize(Data_Type_Conversion1_out1, 21);
  Sum3_sub_cast_1 <= resize(sw4_out1, 21);
  Sum3_out1 <= Sum3_sub_cast - Sum3_sub_cast_1;

  
  switch_compare_1_9 <= '1' WHEN and1_2_out1 > '0' ELSE
      '0';

  Sum8_sub_cast <= resize(Unary_Minus_out1, 21);
  Sum8_sub_cast_1 <= resize(Data_Type_Conversion1_out1, 21);
  Sum8_out1 <= Sum8_sub_cast - Sum8_sub_cast_1;

  Sum11_stage2_add_cast <= signed(resize(standardized_peak_of_triangle_out1, 24));
  Sum11_stage2_add_cast_1 <= resize(Sum6_out1, 24);
  Sum11_op_stage1 <= Sum11_stage2_add_cast + Sum11_stage2_add_cast_1;

  Sum5_stage2_add_cast <= resize(Sum1_out1, 24);
  Sum5_stage2_add_cast_1 <= signed(resize(standardized_peak_of_triangle_out1, 24));
  Sum5_op_stage1 <= Sum5_stage2_add_cast + Sum5_stage2_add_cast_1;

  
  and_out1 <= alpha0_out1 WHEN switch_compare_1 = '0' ELSE
      Relational_Operator9_relop1;

  
  switch_compare_1_10 <= '1' WHEN and_out1 > '0' ELSE
      '0';

  
  or_out1 <= and2_2_out1 WHEN switch_compare_1_4 = '0' ELSE
      and1_2_out1;

  
  switch_compare_1_11 <= '1' WHEN or_out1 > '0' ELSE
      '0';

  Sum4_add_cast <= resize(Data_Type_Conversion1_out1, 21);
  Sum4_add_cast_1 <= resize(sw4_out1, 21);
  Sum4_out1 <= Sum4_add_cast + Sum4_add_cast_1;

  Sum2_sub_cast <= resize(sw4_out1, 21);
  Sum2_sub_cast_1 <= resize(Data_Type_Conversion1_out1, 21);
  Sum2_out1 <= Sum2_sub_cast - Sum2_sub_cast_1;

  
  Switch3_out1 <= Sum3_out1 WHEN switch_compare_1_8 = '0' ELSE
      Sum2_out1;

  
  sw_out1 <= Sum4_out1 WHEN switch_compare_1_7 = '0' ELSE
      Switch3_out1;

  Sum11_stage3_sub_cast <= resize(Data_Type_Conversion1_out1, 24);
  Sum11_stage3_sub_temp <= Sum11_op_stage1 - Sum11_stage3_sub_cast;
  Sum11_out1 <= Sum11_stage3_sub_temp(20 DOWNTO 0);

  
  sw3_out1 <= Sum8_out1 WHEN switch_compare_1_9 = '0' ELSE
      Sum11_out1;

  
  sw2_out1 <= sw_out1 WHEN switch_compare_1_11 = '0' ELSE
      sw3_out1;

  sw2_out1_dtc <= sw2_out1(18 DOWNTO 1);

  Sum5_stage3_sub_cast <= resize(Data_Type_Conversion1_out1, 24);
  Sum5_stage3_sub_temp <= Sum5_op_stage1 - Sum5_stage3_sub_cast;
  Sum5_out1 <= Sum5_stage3_sub_temp(20 DOWNTO 0);

  Sum5_out1_dtc <= Sum5_out1(18 DOWNTO 1);

  
  sw1_out1 <= sw2_out1_dtc WHEN switch_compare_1_10 = '0' ELSE
      Sum5_out1_dtc;

  triangle_sig <= std_logic_vector(sw1_out1);

END rtl;

