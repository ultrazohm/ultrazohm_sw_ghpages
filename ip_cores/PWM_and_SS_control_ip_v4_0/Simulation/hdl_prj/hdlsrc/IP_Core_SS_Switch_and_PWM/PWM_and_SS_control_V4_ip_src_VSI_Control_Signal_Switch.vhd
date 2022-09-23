-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V4_ip_src_VSI_Control_Signal_Switch.vhd
-- Created: 2022-06-27 11:27:29
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V4_ip_src_VSI_Control_Signal_Switch
-- Source Path: IP_Core_SS_Switch_and_PWM/PWM_and_Switching_Signal_Control/VSI Control Signal Switch
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.PWM_and_SS_control_V4_ip_src_PWM_and_Switching_Signal_Control_pkg.ALL;

ENTITY PWM_and_SS_control_V4_ip_src_VSI_Control_Signal_Switch IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Switch_AXI                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        SS0_IN_PWM                        :   IN    std_logic;  -- ufix1
        SS1_IN_PWM                        :   IN    std_logic;  -- ufix1
        SS2_IN_PWM                        :   IN    std_logic;  -- ufix1
        SS3_IN_PWM                        :   IN    std_logic;  -- ufix1
        SS4_IN_PWM                        :   IN    std_logic;  -- ufix1
        SS5_IN_PWM                        :   IN    std_logic;  -- ufix1
        SS0_IN_External                   :   IN    std_logic;
        SS1_IN_External                   :   IN    std_logic;
        SS2_IN_External                   :   IN    std_logic;
        SS3_IN_External                   :   IN    std_logic;
        SS4_IN_External                   :   IN    std_logic;
        SS5_IN_External                   :   IN    std_logic;
        TriState_HB1_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        TriState_HB2_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        TriState_HB3_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        SS0_OUT                           :   OUT   std_logic;
        SS1_OUT                           :   OUT   std_logic;
        SS2_OUT                           :   OUT   std_logic;
        SS3_OUT                           :   OUT   std_logic;
        SS4_OUT                           :   OUT   std_logic;
        SS5_OUT                           :   OUT   std_logic
        );
END PWM_and_SS_control_V4_ip_src_VSI_Control_Signal_Switch;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip_src_VSI_Control_Signal_Switch IS

  -- Signals
  SIGNAL TriState_HB1_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL reduced_reg                      : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL TriState_HB1_AXI_1               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Switch_AXI_unsigned              : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL reduced_reg_1                    : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL Switch_AXI_1                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SS0_IN_External_1                : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Switch6_out1                     : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL delayMatch3_reg                  : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SS1_IN_External_1                : std_logic;
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Switch7_out1                     : std_logic;
  SIGNAL TriState_HB2_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL reduced_reg_2                    : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL TriState_HB2_AXI_1               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL delayMatch6_reg                  : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SS2_IN_External_1                : std_logic;
  SIGNAL Switch2_out1                     : std_logic;
  SIGNAL Switch8_out1                     : std_logic;
  SIGNAL switch_compare_1_3               : std_logic;
  SIGNAL delayMatch9_reg                  : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SS3_IN_External_1                : std_logic;
  SIGNAL Switch3_out1                     : std_logic;
  SIGNAL Switch9_out1                     : std_logic;
  SIGNAL TriState_HB3_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL reduced_reg_3                    : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL TriState_HB3_AXI_1               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL switch_compare_1_4               : std_logic;
  SIGNAL delayMatch12_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SS4_IN_External_1                : std_logic;
  SIGNAL Switch4_out1                     : std_logic;
  SIGNAL Switch10_out1                    : std_logic;
  SIGNAL switch_compare_1_5               : std_logic;
  SIGNAL delayMatch15_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SS5_IN_External_1                : std_logic;
  SIGNAL Switch5_out1                     : std_logic;
  SIGNAL Switch11_out1                    : std_logic;

BEGIN
  TriState_HB1_AXI_unsigned <= unsigned(TriState_HB1_AXI);

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        reduced_reg(0) <= TriState_HB1_AXI_unsigned;
        reduced_reg(1) <= reduced_reg(0);
      END IF;
    END IF;
  END PROCESS reduced_process;

  TriState_HB1_AXI_1 <= reduced_reg(1);

  Switch_AXI_unsigned <= unsigned(Switch_AXI);

  reduced_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg_1 <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        reduced_reg_1(0) <= Switch_AXI_unsigned;
        reduced_reg_1(1) <= reduced_reg_1(0);
      END IF;
    END IF;
  END PROCESS reduced_1_process;

  Switch_AXI_1 <= reduced_reg_1(1);

  
  switch_compare_1 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch_reg(0) <= SS0_IN_External;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  SS0_IN_External_1 <= delayMatch_reg(1);

  
  Switch_out1 <= SS0_IN_PWM WHEN switch_compare_1 = '0' ELSE
      SS0_IN_External_1;

  Constant_out1 <= '0';

  
  Switch6_out1 <= Switch_out1 WHEN TriState_HB1_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant_out1;

  
  switch_compare_1_1 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch3_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch3_reg(0) <= SS1_IN_External;
        delayMatch3_reg(1) <= delayMatch3_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch3_process;

  SS1_IN_External_1 <= delayMatch3_reg(1);

  
  Switch1_out1 <= SS1_IN_PWM WHEN switch_compare_1_1 = '0' ELSE
      SS1_IN_External_1;

  
  Switch7_out1 <= Switch1_out1 WHEN TriState_HB1_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant_out1;

  TriState_HB2_AXI_unsigned <= unsigned(TriState_HB2_AXI);

  reduced_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg_2 <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        reduced_reg_2(0) <= TriState_HB2_AXI_unsigned;
        reduced_reg_2(1) <= reduced_reg_2(0);
      END IF;
    END IF;
  END PROCESS reduced_2_process;

  TriState_HB2_AXI_1 <= reduced_reg_2(1);

  
  switch_compare_1_2 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  delayMatch6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch6_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch6_reg(0) <= SS2_IN_External;
        delayMatch6_reg(1) <= delayMatch6_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch6_process;

  SS2_IN_External_1 <= delayMatch6_reg(1);

  
  Switch2_out1 <= SS2_IN_PWM WHEN switch_compare_1_2 = '0' ELSE
      SS2_IN_External_1;

  
  Switch8_out1 <= Switch2_out1 WHEN TriState_HB2_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant_out1;

  
  switch_compare_1_3 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  delayMatch9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch9_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch9_reg(0) <= SS3_IN_External;
        delayMatch9_reg(1) <= delayMatch9_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch9_process;

  SS3_IN_External_1 <= delayMatch9_reg(1);

  
  Switch3_out1 <= SS3_IN_PWM WHEN switch_compare_1_3 = '0' ELSE
      SS3_IN_External_1;

  
  Switch9_out1 <= Switch3_out1 WHEN TriState_HB2_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant_out1;

  TriState_HB3_AXI_unsigned <= unsigned(TriState_HB3_AXI);

  reduced_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg_3 <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        reduced_reg_3(0) <= TriState_HB3_AXI_unsigned;
        reduced_reg_3(1) <= reduced_reg_3(0);
      END IF;
    END IF;
  END PROCESS reduced_3_process;

  TriState_HB3_AXI_1 <= reduced_reg_3(1);

  
  switch_compare_1_4 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  delayMatch12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch12_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch12_reg(0) <= SS4_IN_External;
        delayMatch12_reg(1) <= delayMatch12_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch12_process;

  SS4_IN_External_1 <= delayMatch12_reg(1);

  
  Switch4_out1 <= SS4_IN_PWM WHEN switch_compare_1_4 = '0' ELSE
      SS4_IN_External_1;

  
  Switch10_out1 <= Switch4_out1 WHEN TriState_HB3_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant_out1;

  
  switch_compare_1_5 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  delayMatch15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch15_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch15_reg(0) <= SS5_IN_External;
        delayMatch15_reg(1) <= delayMatch15_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch15_process;

  SS5_IN_External_1 <= delayMatch15_reg(1);

  
  Switch5_out1 <= SS5_IN_PWM WHEN switch_compare_1_5 = '0' ELSE
      SS5_IN_External_1;

  
  Switch11_out1 <= Switch5_out1 WHEN TriState_HB3_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant_out1;

  SS0_OUT <= Switch6_out1;

  SS1_OUT <= Switch7_out1;

  SS2_OUT <= Switch8_out1;

  SS3_OUT <= Switch9_out1;

  SS4_OUT <= Switch10_out1;

  SS5_OUT <= Switch11_out1;

END rtl;

