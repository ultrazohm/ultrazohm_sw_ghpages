-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V4_ip_src_Triangle_shift1.vhd
-- Created: 2022-06-27 11:27:29
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

  -- Component Declarations
  COMPONENT PWM_and_SS_control_V4_ip_src_Subsystem2_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          triangle_in                     :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          modified_triangle_shift         :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          standardized_peak_of_triangle   :   IN    std_logic_vector(20 DOWNTO 0);  -- ufix21_En17
          Zero_input                      :   IN    std_logic;
          direction_down                  :   IN    std_logic;
          shifted_triangle_in_signal      :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En17
          enable_out                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_src_Subsystem1_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          standardized_peak_of_triangle   :   IN    std_logic_vector(20 DOWNTO 0);  -- ufix21_En17
          triangle_in                     :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          converted_triangle_shift        :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          modified_triangle_shift         :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          Zero_input                      :   IN    std_logic;
          direction_up                    :   IN    std_logic;
          shifted_triangle_in_signal      :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En17
          enable_out                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_src_Subsystem_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Zero_input                      :   IN    std_logic;
          converted_triangle_shift        :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          modified_triangle_shift         :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          triangle_in                     :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          direction_down                  :   IN    std_logic;
          shifted_triangle_in_signal      :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En17
          enable_out                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_src_Subsystem3_block
    PORT( triangle_in                     :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          modified_triangle_shift         :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          direction_up                    :   IN    std_logic;
          shifted_triangle_in_signal      :   OUT   std_logic_vector(20 DOWNTO 0)  -- sfix21_En17
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : PWM_and_SS_control_V4_ip_src_Subsystem2_block
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_Subsystem2_block(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_src_Subsystem1_block
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_Subsystem1_block(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_src_Subsystem_block
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_Subsystem_block(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_src_Subsystem3_block
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_Subsystem3_block(rtl);

  -- Signals
  SIGNAL triangle_in_unsigned             : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL triangle_in_1                    : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL triangle_shift_unsigned          : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Data_Type_Conversion_out1        : signed(18 DOWNTO 0);  -- sfix19_En17
  SIGNAL Gain_cast                        : signed(37 DOWNTO 0);  -- sfix38_En33
  SIGNAL converted_triangle_shift         : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL standardized_peak_of_triangle_1  : unsigned(20 DOWNTO 0);  -- ufix21_En17
  SIGNAL Gain1_cast                       : unsigned(41 DOWNTO 0);  -- ufix42_En36
  SIGNAL Gain1_out1                       : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Gain1_out1_1                     : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Sum10_out1                       : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL modified_triangle_shift          : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL alpha0_out1                      : std_logic;
  SIGNAL triangle_in_2                    : signed(19 DOWNTO 0);  -- sfix20_En17
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL direction_down                   : std_logic;
  SIGNAL Subsystem2_out1                  : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL Subsystem2_out2                  : std_logic;
  SIGNAL Relational_Operator7_relop1      : std_logic;
  SIGNAL Subsystem1_out1                  : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL Subsystem1_out2                  : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Subsystem_out1                   : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL Subsystem_out2                   : std_logic;
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL Subsystem_out1_signed            : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL switch_compare_1_3               : std_logic;
  SIGNAL or_out1                          : std_logic;
  SIGNAL switch_compare_1_4               : std_logic;
  SIGNAL direction_up                     : std_logic;
  SIGNAL Subsystem3_out1                  : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL Subsystem3_out1_signed           : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Subsystem1_out1_signed           : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL sw3_out1                         : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL sw2_out1                         : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL sw2_out1_dtc                     : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Subsystem2_out1_signed           : signed(20 DOWNTO 0);  -- sfix21_En17
  SIGNAL Subsystem2_out1_dtc              : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL sw1_out1                         : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL triangle_in_3                    : signed(19 DOWNTO 0);  -- sfix20_En17

BEGIN
  -- modifies triangle_in signal, 
  -- if the user demands a shift larger than 1/2 period
  -- 
  -- Detects, if the triangle_wave is increasing or decreasing
  -- 
  -- Shifts triangle_in signal, if:
  -- -direction of triangle_in is down
  -- -user input demands a shift larger than 1/2 of the period
  -- 
  -- Shifts triangle_in signal, if:
  -- -direction of triangle_in is up
  -- -user input demands a shift larger than 1/2 of the period
  -- 
  -- Shifts triangle_in signal, if:
  -- -direction of triangle_in is up
  -- -user input demands a shift smaller than 1/2 of the period
  -- 
  -- Shifts triangle_in signal, if:
  -- -direction of triangle_in is down
  -- -user input demands a shift smaller than 1/2 of the period

  u_Subsystem2 : PWM_and_SS_control_V4_ip_src_Subsystem2_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              triangle_in => std_logic_vector(triangle_in_1),  -- sfix20_En17
              modified_triangle_shift => std_logic_vector(modified_triangle_shift),  -- sfix20_En17
              standardized_peak_of_triangle => std_logic_vector(standardized_peak_of_triangle_1),  -- ufix21_En17
              Zero_input => alpha0_out1,
              direction_down => direction_down,
              shifted_triangle_in_signal => Subsystem2_out1,  -- sfix21_En17
              enable_out => Subsystem2_out2
              );

  u_Subsystem1 : PWM_and_SS_control_V4_ip_src_Subsystem1_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              standardized_peak_of_triangle => std_logic_vector(standardized_peak_of_triangle_1),  -- ufix21_En17
              triangle_in => std_logic_vector(triangle_in_1),  -- sfix20_En17
              converted_triangle_shift => std_logic_vector(converted_triangle_shift),  -- sfix20_En17
              modified_triangle_shift => std_logic_vector(modified_triangle_shift),  -- sfix20_En17
              Zero_input => alpha0_out1,
              direction_up => Relational_Operator7_relop1,
              shifted_triangle_in_signal => Subsystem1_out1,  -- sfix21_En17
              enable_out => Subsystem1_out2
              );

  u_Subsystem : PWM_and_SS_control_V4_ip_src_Subsystem_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Zero_input => alpha0_out1,
              converted_triangle_shift => std_logic_vector(converted_triangle_shift),  -- sfix20_En17
              modified_triangle_shift => std_logic_vector(modified_triangle_shift),  -- sfix20_En17
              triangle_in => std_logic_vector(triangle_in_1),  -- sfix20_En17
              direction_down => Relational_Operator1_relop1,
              shifted_triangle_in_signal => Subsystem_out1,  -- sfix21_En17
              enable_out => Subsystem_out2
              );

  u_Subsystem3 : PWM_and_SS_control_V4_ip_src_Subsystem3_block
    PORT MAP( triangle_in => std_logic_vector(triangle_in_1),  -- sfix20_En17
              modified_triangle_shift => std_logic_vector(modified_triangle_shift),  -- sfix20_En17
              direction_up => direction_up,
              shifted_triangle_in_signal => Subsystem3_out1  -- sfix21_En17
              );

  triangle_in_unsigned <= unsigned(triangle_in);

  triangle_in_1 <= signed(resize(triangle_in_unsigned, 20));

  triangle_shift_unsigned <= unsigned(triangle_shift);

  Data_Type_Conversion_out1 <= signed(resize(triangle_shift_unsigned, 19));

  Gain_cast <= resize(Data_Type_Conversion_out1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 38);
  converted_triangle_shift <= Gain_cast(35 DOWNTO 16);

  
  switch_compare_1 <= '1' WHEN converted_triangle_shift > to_signed(16#20000#, 20) ELSE
      '0';

  standardized_peak_of_triangle_1 <= to_unsigned(16#020000#, 21);

  Gain1_cast <= resize(standardized_peak_of_triangle_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 42);
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


  Sum10_out1 <= converted_triangle_shift - Gain1_out1_1;

  
  modified_triangle_shift <= converted_triangle_shift WHEN switch_compare_1 = '0' ELSE
      Sum10_out1;

  alpha0_out1 <= '0';

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        triangle_in_2 <= to_signed(16#00000#, 20);
      ELSIF enb = '1' THEN
        triangle_in_2 <= triangle_in_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  
  Relational_Operator1_relop1 <= '1' WHEN triangle_in_1 <= triangle_in_2 ELSE
      '0';

  direction_down <= Relational_Operator1_relop1;

  
  Relational_Operator7_relop1 <= '1' WHEN triangle_in_1 >= triangle_in_2 ELSE
      '0';

  
  switch_compare_1_1 <= '1' WHEN Subsystem1_out2 > '0' ELSE
      '0';

  
  switch_compare_1_2 <= '1' WHEN Subsystem1_out2 > '0' ELSE
      '0';

  Subsystem_out1_signed <= signed(Subsystem_out1);

  
  switch_compare_1_3 <= '1' WHEN Subsystem2_out2 > '0' ELSE
      '0';

  
  or_out1 <= Subsystem_out2 WHEN switch_compare_1_1 = '0' ELSE
      Subsystem1_out2;

  
  switch_compare_1_4 <= '1' WHEN or_out1 > '0' ELSE
      '0';

  direction_up <= Relational_Operator7_relop1;

  Subsystem3_out1_signed <= signed(Subsystem3_out1);

  Subsystem1_out1_signed <= signed(Subsystem1_out1);

  
  sw3_out1 <= Subsystem_out1_signed WHEN switch_compare_1_2 = '0' ELSE
      Subsystem1_out1_signed;

  
  sw2_out1 <= Subsystem3_out1_signed WHEN switch_compare_1_4 = '0' ELSE
      sw3_out1;

  sw2_out1_dtc <= sw2_out1(18 DOWNTO 1);

  Subsystem2_out1_signed <= signed(Subsystem2_out1);

  Subsystem2_out1_dtc <= Subsystem2_out1_signed(18 DOWNTO 1);

  
  sw1_out1 <= sw2_out1_dtc WHEN switch_compare_1_3 = '0' ELSE
      Subsystem2_out1_dtc;

  triangle_sig <= std_logic_vector(sw1_out1);

END rtl;

