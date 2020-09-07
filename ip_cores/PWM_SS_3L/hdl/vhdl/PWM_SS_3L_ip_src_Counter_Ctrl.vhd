-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeL_PWM_direct\PWM_SS_3L_ip_src_Counter_Ctrl.vhd
-- Created: 2020-04-06 17:35:11
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_SS_3L_ip_src_Counter_Ctrl
-- Source Path: ThreeL_PWM_direct/PWM_SS_Ctrl/GenPWM/Counter_Ctrl
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_SS_3L_ip_src_Counter_Ctrl IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        PWM_en_AXI                        :   IN    std_logic;
        hdl_cnt                           :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
        max_counter_value                 :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
        direction_ctrl                    :   OUT   std_logic;
        carrier_positive                  :   OUT   std_logic_vector(19 DOWNTO 0);  -- ufix20
        carrier_negative                  :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21
        Period_Center                     :   OUT   std_logic;
        Period_Start                      :   OUT   std_logic
        );
END PWM_SS_3L_ip_src_Counter_Ctrl;


ARCHITECTURE rtl OF PWM_SS_3L_ip_src_Counter_Ctrl IS

  -- Signals
  SIGNAL hdl_cnt_unsigned                 : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL max_counter_value_unsigned       : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL Relational_Operator4_relop1      : std_logic;
  SIGNAL Constant11_out1                  : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL Relational_Operator5_relop1      : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Constant14_out1                  : std_logic;
  SIGNAL Constant12_out1                  : std_logic;
  SIGNAL Switch7_out1                     : std_logic;
  SIGNAL Switch6_out1                     : std_logic;
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL Add1_sub_cast                    : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Add1_sub_cast_1                  : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Add1_out1                        : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL Constant1_out1                   : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL Relational_Operator2_relop1      : std_logic;
  SIGNAL AND_out1                         : std_logic;

BEGIN
  -- if (hdl_cnt >= step_cnt)
  -- 	dir_ctrl = true;
  -- else if (hdl_cnt <= 0)
  -- 	dir_ctrl = false;
  -- else
  -- 	dir_ctrl = dir_ctrl;
  -- 
  -- from us to maximum counter value
  -- step_cnt = (f_pwm_clk / f_carrier) * 1/2

  hdl_cnt_unsigned <= unsigned(hdl_cnt);

  max_counter_value_unsigned <= unsigned(max_counter_value);

  
  Relational_Operator4_relop1 <= '1' WHEN hdl_cnt_unsigned >= max_counter_value_unsigned ELSE
      '0';

  Constant11_out1 <= to_unsigned(16#00000#, 20);

  
  Relational_Operator5_relop1 <= '1' WHEN hdl_cnt_unsigned <= Constant11_out1 ELSE
      '0';

  Logical_Operator_out1 <= Relational_Operator4_relop1 OR Relational_Operator5_relop1;

  
  switch_compare_1 <= '1' WHEN Logical_Operator_out1 > '0' ELSE
      '0';

  
  switch_compare_1_1 <= '1' WHEN Relational_Operator4_relop1 > '0' ELSE
      '0';

  Constant14_out1 <= '1';

  Constant12_out1 <= '0';

  
  Switch7_out1 <= Constant14_out1 WHEN switch_compare_1_1 = '0' ELSE
      Constant12_out1;

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay6_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay6_out1 <= Switch6_out1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  
  Switch6_out1 <= Delay6_out1 WHEN switch_compare_1 = '0' ELSE
      Switch7_out1;

  Add1_sub_cast <= signed(resize(hdl_cnt_unsigned, 21));
  Add1_sub_cast_1 <= signed(resize(max_counter_value_unsigned, 21));
  Add1_out1 <= Add1_sub_cast - Add1_sub_cast_1;

  carrier_negative <= std_logic_vector(Add1_out1);

  
  Relational_Operator1_relop1 <= '1' WHEN hdl_cnt_unsigned = max_counter_value_unsigned ELSE
      '0';

  Constant1_out1 <= to_unsigned(16#00000#, 20);

  
  Relational_Operator2_relop1 <= '1' WHEN hdl_cnt_unsigned = Constant1_out1 ELSE
      '0';

  AND_out1 <= PWM_en_AXI AND Relational_Operator2_relop1;

  direction_ctrl <= Switch6_out1;

  carrier_positive <= hdl_cnt;

  Period_Center <= Relational_Operator1_relop1;

  Period_Start <= AND_out1;

END rtl;

