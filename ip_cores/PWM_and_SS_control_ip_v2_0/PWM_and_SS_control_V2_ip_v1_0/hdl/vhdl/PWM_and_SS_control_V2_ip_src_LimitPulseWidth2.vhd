-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V2_ip_src_LimitPulseWidth2.vhd
-- Created: 2019-08-27 18:05:19
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V2_ip_src_LimitPulseWidth2
-- Source Path: IP_Core_SS_Switch_and_PWM/PWM_and_Switching_Signal_Control/GenPWM/LimitPulseWidth2
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_V2_ip_src_LimitPulseWidth2 IS
  PORT( ref_sig                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        min_pulse_width                   :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En10
        ref_sig_limit                     :   OUT   std_logic_vector(17 DOWNTO 0)  -- ufix18_En10
        );
END PWM_and_SS_control_V2_ip_src_LimitPulseWidth2;


ARCHITECTURE rtl OF PWM_and_SS_control_V2_ip_src_LimitPulseWidth2 IS

  -- Signals
  SIGNAL ref_sig_signed                   : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Constant_out1                    : signed(17 DOWNTO 0);  -- sfix18_En10
  SIGNAL min_pulse_width_signed           : signed(17 DOWNTO 0);  -- sfix18_En10
  SIGNAL Add_sub_cast                     : signed(18 DOWNTO 0);  -- sfix19_En10
  SIGNAL Add_sub_cast_1                   : signed(18 DOWNTO 0);  -- sfix19_En10
  SIGNAL Add_sub_temp                     : signed(18 DOWNTO 0);  -- sfix19_En10
  SIGNAL Add_out1                         : unsigned(17 DOWNTO 0);  -- ufix18_En10
  SIGNAL Relational_Operator_1_cast       : signed(20 DOWNTO 0);  -- sfix21_En12
  SIGNAL Relational_Operator_1_cast_1     : signed(20 DOWNTO 0);  -- sfix21_En12
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL dtc_out                          : unsigned(17 DOWNTO 0);  -- ufix18_En10
  SIGNAL Saturation_out1                  : unsigned(17 DOWNTO 0);  -- ufix18_En10
  SIGNAL Relational_Operator1_1_cast      : signed(20 DOWNTO 0);  -- sfix21_En12
  SIGNAL Relational_Operator1_1_cast_1    : signed(20 DOWNTO 0);  -- sfix21_En12
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Constant1_out1                   : unsigned(17 DOWNTO 0);  -- ufix18_En10
  SIGNAL ref_sig_dtc                      : unsigned(17 DOWNTO 0);  -- ufix18_En10
  SIGNAL Constant2_out1                   : unsigned(17 DOWNTO 0);  -- ufix18_En10
  SIGNAL Switch1_out1                     : unsigned(17 DOWNTO 0);  -- ufix18_En10
  SIGNAL Switch6_out1                     : unsigned(17 DOWNTO 0);  -- ufix18_En10

BEGIN
  -- Set pulse width in percent

  ref_sig_signed <= signed(ref_sig);

  Constant_out1 <= to_signed(16#00400#, 18);

  min_pulse_width_signed <= signed(min_pulse_width);

  Add_sub_cast <= resize(Constant_out1, 19);
  Add_sub_cast_1 <= resize(min_pulse_width_signed, 19);
  Add_sub_temp <= Add_sub_cast - Add_sub_cast_1;
  Add_out1 <= unsigned(Add_sub_temp(17 DOWNTO 0));

  Relational_Operator_1_cast <= resize(ref_sig_signed, 21);
  Relational_Operator_1_cast_1 <= signed(resize(Add_out1 & '0' & '0', 21));
  
  Relational_Operator_relop1 <= '1' WHEN Relational_Operator_1_cast > Relational_Operator_1_cast_1 ELSE
      '0';

  
  dtc_out <= "000000000000000000" WHEN min_pulse_width_signed(17) = '1' ELSE
      unsigned(min_pulse_width_signed);

  
  Saturation_out1 <= to_unsigned(16#00400#, 18) WHEN dtc_out > to_unsigned(16#00400#, 18) ELSE
      dtc_out;

  Relational_Operator1_1_cast <= resize(ref_sig_signed, 21);
  Relational_Operator1_1_cast_1 <= signed(resize(Saturation_out1 & '0' & '0', 21));
  
  Relational_Operator1_relop1 <= '1' WHEN Relational_Operator1_1_cast < Relational_Operator1_1_cast_1 ELSE
      '0';

  Logical_Operator_out1 <= Relational_Operator_relop1 OR Relational_Operator1_relop1;

  
  switch_compare_1 <= '1' WHEN Logical_Operator_out1 > '0' ELSE
      '0';

  
  switch_compare_1_1 <= '1' WHEN Relational_Operator1_relop1 > '0' ELSE
      '0';

  Constant1_out1 <= to_unsigned(16#0040A#, 18);

  ref_sig_dtc <= unsigned(resize(ref_sig_signed(13 DOWNTO 2), 18));

  Constant2_out1 <= to_unsigned(16#00000#, 18);

  
  Switch1_out1 <= Constant1_out1 WHEN switch_compare_1_1 = '0' ELSE
      Constant2_out1;

  
  Switch6_out1 <= ref_sig_dtc WHEN switch_compare_1 = '0' ELSE
      Switch1_out1;

  ref_sig_limit <= std_logic_vector(Switch6_out1);

END rtl;

