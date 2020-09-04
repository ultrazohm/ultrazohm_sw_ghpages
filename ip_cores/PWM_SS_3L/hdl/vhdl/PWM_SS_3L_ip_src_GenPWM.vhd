-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeL_PWM_direct\PWM_SS_3L_ip_src_GenPWM.vhd
-- Created: 2020-04-06 17:35:11
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_SS_3L_ip_src_GenPWM
-- Source Path: ThreeL_PWM_direct/PWM_SS_Ctrl/GenPWM
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.PWM_SS_3L_ip_src_PWM_SS_Ctrl_pkg.ALL;

ENTITY PWM_SS_3L_ip_src_GenPWM IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        PWM_en_AXI                        :   IN    std_logic;
        max_counter_value                 :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
        min_pulse_width_AXI               :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        U1_norm                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        U2_norm                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        U3_norm                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        Sa                                :   OUT   std_logic_vector(0 TO 1);  -- ufix1 [2]
        Sb                                :   OUT   std_logic_vector(0 TO 1);  -- ufix1 [2]
        Sc                                :   OUT   std_logic_vector(0 TO 1);  -- ufix1 [2]
        Period_Center                     :   OUT   std_logic;
        Period_Start                      :   OUT   std_logic
        );
END PWM_SS_3L_ip_src_GenPWM;


ARCHITECTURE rtl OF PWM_SS_3L_ip_src_GenPWM IS

  -- Component Declarations
  COMPONENT PWM_SS_3L_ip_src_Counter_Ctrl
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          PWM_en_AXI                      :   IN    std_logic;
          hdl_cnt                         :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          max_counter_value               :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          direction_ctrl                  :   OUT   std_logic;
          carrier_positive                :   OUT   std_logic_vector(19 DOWNTO 0);  -- ufix20
          carrier_negative                :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21
          Period_Center                   :   OUT   std_logic;
          Period_Start                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT PWM_SS_3L_ip_src_LimitPulseWidth_a
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          ref_sig                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          min_pulse_width                 :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          ref_sig_limited                 :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En12
          );
  END COMPONENT;

  COMPONENT PWM_SS_3L_ip_src_Modulator_a
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          carrier_peak_count              :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          carrier_signal_pos              :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          carrier_signal_neg              :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21
          modulation_signal               :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          S                               :   OUT   std_logic_vector(0 TO 1)  -- ufix1 [2]
          );
  END COMPONENT;

  COMPONENT PWM_SS_3L_ip_src_LimitPulseWidth_b
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          ref_sig                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          min_pulse_width                 :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          ref_sig_limited                 :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En12
          );
  END COMPONENT;

  COMPONENT PWM_SS_3L_ip_src_Modulator_b
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          carrier_peak_count              :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          carrier_signal_pos              :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          carrier_signal_neg              :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21
          modulation_signal               :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          S                               :   OUT   std_logic_vector(0 TO 1)  -- ufix1 [2]
          );
  END COMPONENT;

  COMPONENT PWM_SS_3L_ip_src_LimitPulseWidth_c
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          ref_sig                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          min_pulse_width                 :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          ref_sig_limited                 :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En12
          );
  END COMPONENT;

  COMPONENT PWM_SS_3L_ip_src_Modulator_c
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          carrier_peak_count              :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          carrier_signal_pos              :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          carrier_signal_neg              :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21
          modulation_signal               :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          S                               :   OUT   std_logic_vector(0 TO 1)  -- ufix1 [2]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : PWM_SS_3L_ip_src_Counter_Ctrl
    USE ENTITY work.PWM_SS_3L_ip_src_Counter_Ctrl(rtl);

  FOR ALL : PWM_SS_3L_ip_src_LimitPulseWidth_a
    USE ENTITY work.PWM_SS_3L_ip_src_LimitPulseWidth_a(rtl);

  FOR ALL : PWM_SS_3L_ip_src_Modulator_a
    USE ENTITY work.PWM_SS_3L_ip_src_Modulator_a(rtl);

  FOR ALL : PWM_SS_3L_ip_src_LimitPulseWidth_b
    USE ENTITY work.PWM_SS_3L_ip_src_LimitPulseWidth_b(rtl);

  FOR ALL : PWM_SS_3L_ip_src_Modulator_b
    USE ENTITY work.PWM_SS_3L_ip_src_Modulator_b(rtl);

  FOR ALL : PWM_SS_3L_ip_src_LimitPulseWidth_c
    USE ENTITY work.PWM_SS_3L_ip_src_LimitPulseWidth_c(rtl);

  FOR ALL : PWM_SS_3L_ip_src_Modulator_c
    USE ENTITY work.PWM_SS_3L_ip_src_Modulator_c(rtl);

  -- Signals
  SIGNAL PWM_en_AXI_1                     : std_logic;
  SIGNAL PWM_en_AXI_2                     : std_logic;
  SIGNAL reduced_reg                      : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL PWM_en_AXI_3                     : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Constant10_out1                  : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL max_counter_value_unsigned       : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL max_counter_value_1              : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL maximum_counter_value            : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL maximum_counter_value_1          : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL dir_ctrl                         : std_logic;
  SIGNAL HDL_Counter2_count               : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL HDL_Counter2_count_next          : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL HDL_Counter2_count_step          : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL HDL_Counter2_out1                : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL Counter_Ctrl_out2                : std_logic_vector(19 DOWNTO 0);  -- ufix20
  SIGNAL Counter_Ctrl_out3                : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL Counter_Ctrl_out4                : std_logic;
  SIGNAL Counter_Ctrl_out5                : std_logic;
  SIGNAL OR_out1                          : std_logic;
  SIGNAL U1_norm_signed                   : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL delayMatch1_reg                  : vector_of_signed14(0 TO 1);  -- sfix14 [2]
  SIGNAL U1_norm_1                        : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch_out1                      : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay_out1                       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL min_pulse_width_AXI_signed       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL min_pulse_width_AXI_1            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL LimitPulseWidth_a_out1           : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL Modulator_a_out1                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch3_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch3_out1_1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL U2_norm_signed                   : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL delayMatch3_reg                  : vector_of_signed14(0 TO 1);  -- sfix14 [2]
  SIGNAL U2_norm_1                        : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch1_out1                     : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay1_out1                      : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL LimitPulseWidth_b_out1           : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL Modulator_b_out1                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch4_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch4_out1_1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL U3_norm_signed                   : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL delayMatch5_reg                  : vector_of_signed14(0 TO 1);  -- sfix14 [2]
  SIGNAL U3_norm_1                        : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch2_out1                     : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay2_out1                      : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL LimitPulseWidth_c_out1           : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL Modulator_c_out1                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch5_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch5_out1_1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Counter_Ctrl_out4_1              : std_logic;
  SIGNAL Counter_Ctrl_out5_1              : std_logic;
  SIGNAL dir_ctrl_1                       : std_logic;

BEGIN
  u_Counter_Ctrl : PWM_SS_3L_ip_src_Counter_Ctrl
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              PWM_en_AXI => PWM_en_AXI_2,
              hdl_cnt => std_logic_vector(HDL_Counter2_out1),  -- ufix20
              max_counter_value => std_logic_vector(maximum_counter_value_1),  -- ufix20
              direction_ctrl => dir_ctrl,
              carrier_positive => Counter_Ctrl_out2,  -- ufix20
              carrier_negative => Counter_Ctrl_out3,  -- sfix21
              Period_Center => Counter_Ctrl_out4,
              Period_Start => Counter_Ctrl_out5
              );

  u_LimitPulseWidth_a : PWM_SS_3L_ip_src_LimitPulseWidth_a
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              ref_sig => std_logic_vector(Switch_out1),  -- sfix14_En12
              min_pulse_width => std_logic_vector(min_pulse_width_AXI_1),  -- sfix14_En12
              ref_sig_limited => LimitPulseWidth_a_out1  -- sfix14_En12
              );

  u_Modulator_a : PWM_SS_3L_ip_src_Modulator_a
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              carrier_peak_count => std_logic_vector(maximum_counter_value_1),  -- ufix20
              carrier_signal_pos => Counter_Ctrl_out2,  -- ufix20
              carrier_signal_neg => Counter_Ctrl_out3,  -- sfix21
              modulation_signal => LimitPulseWidth_a_out1,  -- sfix14_En12
              S => Modulator_a_out1  -- ufix1 [2]
              );

  u_LimitPulseWidth_b : PWM_SS_3L_ip_src_LimitPulseWidth_b
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              ref_sig => std_logic_vector(Switch1_out1),  -- sfix14_En12
              min_pulse_width => std_logic_vector(min_pulse_width_AXI_1),  -- sfix14_En12
              ref_sig_limited => LimitPulseWidth_b_out1  -- sfix14_En12
              );

  u_Modulator_b : PWM_SS_3L_ip_src_Modulator_b
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              carrier_peak_count => std_logic_vector(maximum_counter_value_1),  -- ufix20
              carrier_signal_pos => Counter_Ctrl_out2,  -- ufix20
              carrier_signal_neg => Counter_Ctrl_out3,  -- sfix21
              modulation_signal => LimitPulseWidth_b_out1,  -- sfix14_En12
              S => Modulator_b_out1  -- ufix1 [2]
              );

  u_LimitPulseWidth_c : PWM_SS_3L_ip_src_LimitPulseWidth_c
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              ref_sig => std_logic_vector(Switch2_out1),  -- sfix14_En12
              min_pulse_width => std_logic_vector(min_pulse_width_AXI_1),  -- sfix14_En12
              ref_sig_limited => LimitPulseWidth_c_out1  -- sfix14_En12
              );

  u_Modulator_c : PWM_SS_3L_ip_src_Modulator_c
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              carrier_peak_count => std_logic_vector(maximum_counter_value_1),  -- ufix20
              carrier_signal_pos => Counter_Ctrl_out2,  -- ufix20
              carrier_signal_neg => Counter_Ctrl_out3,  -- sfix21
              modulation_signal => LimitPulseWidth_c_out1,  -- sfix14_En12
              S => Modulator_c_out1  -- ufix1 [2]
              );

  in_0_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        PWM_en_AXI_1 <= '0';
      ELSIF enb = '1' THEN
        PWM_en_AXI_1 <= PWM_en_AXI;
      END IF;
    END IF;
  END PROCESS in_0_pipe_process;


  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        PWM_en_AXI_2 <= '0';
      ELSIF enb = '1' THEN
        PWM_en_AXI_2 <= PWM_en_AXI_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  reduced_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        reduced_reg(0) <= PWM_en_AXI_2;
        reduced_reg(1) <= reduced_reg(0);
      END IF;
    END IF;
  END PROCESS reduced_1_process;

  PWM_en_AXI_3 <= reduced_reg(1);

  
  switch_compare_1 <= '1' WHEN PWM_en_AXI_3 > '0' ELSE
      '0';

  Constant10_out1(0) <= '0';
  Constant10_out1(1) <= '0';

  max_counter_value_unsigned <= unsigned(max_counter_value);

  in_1_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        max_counter_value_1 <= to_unsigned(16#00000#, 20);
      ELSIF enb = '1' THEN
        max_counter_value_1 <= max_counter_value_unsigned;
      END IF;
    END IF;
  END PROCESS in_1_pipe_process;


  
  maximum_counter_value <= to_unsigned(16#7A120#, 20) WHEN max_counter_value_1 > to_unsigned(16#7A120#, 20) ELSE
      to_unsigned(16#001F4#, 20) WHEN max_counter_value_1 < to_unsigned(16#001F4#, 20) ELSE
      max_counter_value_1;

  Saturation1_out_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        maximum_counter_value_1 <= to_unsigned(16#00000#, 20);
      ELSIF enb = '1' THEN
        maximum_counter_value_1 <= maximum_counter_value;
      END IF;
    END IF;
  END PROCESS Saturation1_out_pipe_process;


  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  HDL_Counter2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        HDL_Counter2_count <= to_unsigned(16#00000#, 20);
      ELSIF enb = '1' AND PWM_en_AXI_2 = '1' THEN
        HDL_Counter2_count <= HDL_Counter2_count_next;
      END IF;
    END IF;
  END PROCESS HDL_Counter2_process;

  HDL_Counter2_out1 <= HDL_Counter2_count;
  
  HDL_Counter2_count_step <= to_unsigned(16#00001#, 20) WHEN dir_ctrl = '1' ELSE
      to_unsigned(16#FFFFF#, 20);
  HDL_Counter2_count_next <= HDL_Counter2_count + HDL_Counter2_count_step;

  OR_out1 <= Counter_Ctrl_out4 OR Counter_Ctrl_out5;

  U1_norm_signed <= signed(U1_norm);

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch1_reg <= (OTHERS => to_signed(16#0000#, 14));
      ELSIF enb = '1' THEN
        delayMatch1_reg(0) <= U1_norm_signed;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  U1_norm_1 <= delayMatch1_reg(1);

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  
  Switch_out1 <= Delay_out1 WHEN OR_out1 = '0' ELSE
      U1_norm_1;

  min_pulse_width_AXI_signed <= signed(min_pulse_width_AXI);

  in_2_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        min_pulse_width_AXI_1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        min_pulse_width_AXI_1 <= min_pulse_width_AXI_signed;
      END IF;
    END IF;
  END PROCESS in_2_pipe_process;


  
  Switch3_out1 <= Constant10_out1 WHEN switch_compare_1 = '0' ELSE
      Modulator_a_out1;

  out_0_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Switch3_out1_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Switch3_out1_1 <= Switch3_out1;
      END IF;
    END IF;
  END PROCESS out_0_pipe_process;


  
  switch_compare_1_1 <= '1' WHEN PWM_en_AXI_3 > '0' ELSE
      '0';

  U2_norm_signed <= signed(U2_norm);

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch3_reg <= (OTHERS => to_signed(16#0000#, 14));
      ELSIF enb = '1' THEN
        delayMatch3_reg(0) <= U2_norm_signed;
        delayMatch3_reg(1) <= delayMatch3_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch3_process;

  U2_norm_1 <= delayMatch3_reg(1);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay1_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  
  Switch1_out1 <= Delay1_out1 WHEN OR_out1 = '0' ELSE
      U2_norm_1;

  
  Switch4_out1 <= Constant10_out1 WHEN switch_compare_1_1 = '0' ELSE
      Modulator_b_out1;

  out_1_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Switch4_out1_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Switch4_out1_1 <= Switch4_out1;
      END IF;
    END IF;
  END PROCESS out_1_pipe_process;


  
  switch_compare_1_2 <= '1' WHEN PWM_en_AXI_3 > '0' ELSE
      '0';

  U3_norm_signed <= signed(U3_norm);

  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch5_reg <= (OTHERS => to_signed(16#0000#, 14));
      ELSIF enb = '1' THEN
        delayMatch5_reg(0) <= U3_norm_signed;
        delayMatch5_reg(1) <= delayMatch5_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch5_process;

  U3_norm_1 <= delayMatch5_reg(1);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay2_out1 <= Switch2_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  
  Switch2_out1 <= Delay2_out1 WHEN OR_out1 = '0' ELSE
      U3_norm_1;

  
  Switch5_out1 <= Constant10_out1 WHEN switch_compare_1_2 = '0' ELSE
      Modulator_c_out1;

  out_2_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Switch5_out1_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Switch5_out1_1 <= Switch5_out1;
      END IF;
    END IF;
  END PROCESS out_2_pipe_process;


  out_3_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Counter_Ctrl_out4_1 <= '0';
      ELSIF enb = '1' THEN
        Counter_Ctrl_out4_1 <= Counter_Ctrl_out4;
      END IF;
    END IF;
  END PROCESS out_3_pipe_process;


  out_4_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Counter_Ctrl_out5_1 <= '0';
      ELSIF enb = '1' THEN
        Counter_Ctrl_out5_1 <= Counter_Ctrl_out5;
      END IF;
    END IF;
  END PROCESS out_4_pipe_process;




  Sa <= Switch3_out1_1;

  Sb <= Switch4_out1_1;

  Sc <= Switch5_out1_1;

  Period_Center <= Counter_Ctrl_out4_1;

  Period_Start <= Counter_Ctrl_out5_1;

END rtl;

