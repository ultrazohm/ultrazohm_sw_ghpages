-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V4_ip_src_GenPWM.vhd
-- Created: 2022-06-08 09:39:49
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V4_ip_src_GenPWM
-- Source Path: IP_Core_SS_Switch_and_PWM/PWM_and_Switching_Signal_Control/GenPWM
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.PWM_and_SS_control_V4_ip_src_PWM_and_Switching_Signal_Control_pkg.ALL;

ENTITY PWM_and_SS_control_V4_ip_src_GenPWM IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        PWM_en_AXI                        :   IN    std_logic;
        f_carrier_kHz_AXI                 :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
        T_carrier_us_AXI                  :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
        min_pulse_width_AXI               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        U1_norm                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        U2_norm                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        U3_norm                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        triangle_in                       :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
        count_src_ext_AXI                 :   IN    std_logic;
        triangle_shift                    :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
        S1                                :   OUT   std_logic;  -- ufix1
        S2                                :   OUT   std_logic;  -- ufix1
        S3                                :   OUT   std_logic;  -- ufix1
        S4                                :   OUT   std_logic;  -- ufix1
        S5                                :   OUT   std_logic;  -- ufix1
        S6                                :   OUT   std_logic;  -- ufix1
        PWM_en_rd_AXI                     :   OUT   std_logic;
        f_carrier_kHz_rd_AXI              :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
        T_carrier_us_rd_AXI               :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
        min_pulse_width_rd_AXI            :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        enb_out                           :   OUT   std_logic;
        Triangle_Max                      :   OUT   std_logic;
        Triangle_Min                      :   OUT   std_logic;
        triangle_out                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
        dir_out                           :   OUT   std_logic
        );
END PWM_and_SS_control_V4_ip_src_GenPWM;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip_src_GenPWM IS

  -- Component Declarations
  COMPONENT PWM_and_SS_control_V4_ip_src_Counter_Ctrl
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          hdl_cnt                         :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          f_carrier_kHz                   :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
          T_carrier_us                    :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          dir_ctrl                        :   OUT   std_logic;
          triangle_sig                    :   OUT   std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
          Period_CenterMax                :   OUT   std_logic;
          Period_CenterMin                :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_src_Triangle_shift
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          triangle_in                     :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
          triangle_shift                  :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
          triangle_sig                    :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_src_LimitPulseWidth
    PORT( ref_sig                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          min_pulse_width                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          ref_sig_limit                   :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_src_LimitPulseWidth1
    PORT( ref_sig                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          min_pulse_width                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          ref_sig_limit                   :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_src_LimitPulseWidth2
    PORT( ref_sig                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          min_pulse_width                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          ref_sig_limit                   :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : PWM_and_SS_control_V4_ip_src_Counter_Ctrl
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_Counter_Ctrl(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_src_Triangle_shift
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_Triangle_shift(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_src_LimitPulseWidth
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_LimitPulseWidth(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_src_LimitPulseWidth1
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_LimitPulseWidth1(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_src_LimitPulseWidth2
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_LimitPulseWidth2(rtl);

  -- Signals
  SIGNAL PWM_en_AXI_1                     : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Constant10_out1                  : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL count_src_ext_AXI_1              : std_logic;
  SIGNAL f_carrier_kHz_AXI_unsigned       : unsigned(24 DOWNTO 0);  -- ufix25_En26
  SIGNAL f_carrier_kHz_AXI_1              : unsigned(24 DOWNTO 0);  -- ufix25_En26
  SIGNAL T_carrier_us_AXI_unsigned        : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL T_carrier_us_AXI_1               : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL Counter_Ctrl_out1                : std_logic;
  SIGNAL HDL_Counter2_count               : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL HDL_Counter2_count_next          : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL HDL_Counter2_count_step          : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL HDL_Counter2_out1                : unsigned(19 DOWNTO 0);  -- ufix20
  SIGNAL Counter_Ctrl_out2                : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Counter_Ctrl_out3                : std_logic;
  SIGNAL Counter_Ctrl_out4                : std_logic;
  SIGNAL Counter_Ctrl_out2_unsigned       : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL triangle_in_unsigned             : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Delay4_reg                       : vector_of_unsigned18(0 TO 1);  -- ufix18 [2]
  SIGNAL Delay4_out1                      : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL triangle_shift_unsigned          : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Switch10_out1                    : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL triangle_shift_1                 : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Triangle_shift_out1              : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Triangle_shift_out1_signed       : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Allow_assymetrical_anew_reference_value : std_logic;
  SIGNAL U1_norm_signed                   : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL U1_norm_1                        : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch_out1                      : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay_out1                       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL min_pulse_width_AXI_signed       : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL min_pulse_width_AXI_1            : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL LimitPulseWidth_out1             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL LimitPulseWidth_out1_signed      : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Constant1_out1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Constant2_out1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch7_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch3_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch3_out1_0                   : std_logic;  -- ufix1
  SIGNAL Demux_out1                       : std_logic;  -- ufix1
  SIGNAL Switch3_out1_1                   : std_logic;  -- ufix1
  SIGNAL Demux_out2                       : std_logic;  -- ufix1
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL U2_norm_signed                   : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL U2_norm_1                        : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch1_out1                     : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay1_out1                      : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL LimitPulseWidth1_out1            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL LimitPulseWidth1_out1_signed     : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL switch_compare_1_3               : std_logic;
  SIGNAL Constant4_out1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Constant5_out1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch8_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch4_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch4_out1_0                   : std_logic;  -- ufix1
  SIGNAL Demux1_out1                      : std_logic;  -- ufix1
  SIGNAL Switch4_out1_1                   : std_logic;  -- ufix1
  SIGNAL Demux1_out2                      : std_logic;  -- ufix1
  SIGNAL switch_compare_1_4               : std_logic;
  SIGNAL U3_norm_signed                   : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL U3_norm_1                        : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch2_out1                     : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay2_out1                      : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL LimitPulseWidth2_out1            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL LimitPulseWidth2_out1_signed     : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Relational_Operator2_relop1      : std_logic;
  SIGNAL switch_compare_1_5               : std_logic;
  SIGNAL Constant7_out1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Constant8_out1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch9_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch5_out1                     : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch5_out1_0                   : std_logic;  -- ufix1
  SIGNAL Demux2_out1                      : std_logic;  -- ufix1
  SIGNAL Switch5_out1_1                   : std_logic;  -- ufix1
  SIGNAL Demux2_out2                      : std_logic;  -- ufix1
  SIGNAL PWM_en_AXI_2                     : std_logic;
  SIGNAL f_carrier_kHz_AXI_2              : unsigned(24 DOWNTO 0);  -- ufix25_En26
  SIGNAL T_carrier_us_AXI_2               : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL min_pulse_width_AXI_2            : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Constant11_out1                  : std_logic;
  SIGNAL Switch6_out1                     : std_logic;
  SIGNAL Switch6_out1_1                   : std_logic;
  SIGNAL Counter_Ctrl_out3_1              : std_logic;
  SIGNAL Counter_Ctrl_out4_1              : std_logic;
  SIGNAL Counter_Ctrl_out2_1              : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL Counter_Ctrl_out1_1              : std_logic;

BEGIN
  -- Asymetrical allows on the min
  -- and max counter value, a new
  -- Duty-Cycle (Compare value)
  -- 
  -- Phase-leg 1
  -- 
  -- Phase-leg 2
  -- 
  -- Phase-leg 3
  -- 
  -- Asymetrical allows on the min
  -- and max counter value, a new
  -- Duty-Cycle (Compare value)
  -- 
  -- Asymetrical allows on the min
  -- and max counter value, a new
  -- Duty-Cycle (Compare value)

  u_Counter_Ctrl : PWM_and_SS_control_V4_ip_src_Counter_Ctrl
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              hdl_cnt => std_logic_vector(HDL_Counter2_out1),  -- ufix20
              f_carrier_kHz => std_logic_vector(f_carrier_kHz_AXI_1),  -- ufix25_En26
              T_carrier_us => std_logic_vector(T_carrier_us_AXI_1),  -- ufix25
              dir_ctrl => Counter_Ctrl_out1,
              triangle_sig => Counter_Ctrl_out2,  -- ufix18_En17
              Period_CenterMax => Counter_Ctrl_out3,
              Period_CenterMin => Counter_Ctrl_out4
              );

  u_Triangle_shift : PWM_and_SS_control_V4_ip_src_Triangle_shift
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              triangle_in => std_logic_vector(Switch10_out1),  -- ufix18_En17
              triangle_shift => std_logic_vector(triangle_shift_1),  -- ufix18_En17
              triangle_sig => Triangle_shift_out1  -- sfix18_En16
              );

  u_LimitPulseWidth : PWM_and_SS_control_V4_ip_src_LimitPulseWidth
    PORT MAP( ref_sig => std_logic_vector(Switch_out1),  -- sfix14_En12
              min_pulse_width => std_logic_vector(min_pulse_width_AXI_1),  -- sfix18_En16
              ref_sig_limit => LimitPulseWidth_out1  -- sfix18_En16
              );

  u_LimitPulseWidth1 : PWM_and_SS_control_V4_ip_src_LimitPulseWidth1
    PORT MAP( ref_sig => std_logic_vector(Switch1_out1),  -- sfix14_En12
              min_pulse_width => std_logic_vector(min_pulse_width_AXI_1),  -- sfix18_En16
              ref_sig_limit => LimitPulseWidth1_out1  -- sfix18_En16
              );

  u_LimitPulseWidth2 : PWM_and_SS_control_V4_ip_src_LimitPulseWidth2
    PORT MAP( ref_sig => std_logic_vector(Switch2_out1),  -- sfix14_En12
              min_pulse_width => std_logic_vector(min_pulse_width_AXI_1),  -- sfix18_En16
              ref_sig_limit => LimitPulseWidth2_out1  -- sfix18_En16
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


  
  switch_compare_1 <= '1' WHEN PWM_en_AXI_1 > '0' ELSE
      '0';

  Constant10_out1(0) <= '0';
  Constant10_out1(1) <= '0';

  in_8_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        count_src_ext_AXI_1 <= '0';
      ELSIF enb = '1' THEN
        count_src_ext_AXI_1 <= count_src_ext_AXI;
      END IF;
    END IF;
  END PROCESS in_8_pipe_process;


  f_carrier_kHz_AXI_unsigned <= unsigned(f_carrier_kHz_AXI);

  in_1_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        f_carrier_kHz_AXI_1 <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' THEN
        f_carrier_kHz_AXI_1 <= f_carrier_kHz_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS in_1_pipe_process;


  T_carrier_us_AXI_unsigned <= unsigned(T_carrier_us_AXI);

  in_2_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        T_carrier_us_AXI_1 <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' THEN
        T_carrier_us_AXI_1 <= T_carrier_us_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS in_2_pipe_process;


  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  HDL_Counter2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        HDL_Counter2_count <= to_unsigned(16#00000#, 20);
      ELSIF enb = '1' AND PWM_en_AXI_1 = '1' THEN
        HDL_Counter2_count <= HDL_Counter2_count_next;
      END IF;
    END IF;
  END PROCESS HDL_Counter2_process;

  HDL_Counter2_out1 <= HDL_Counter2_count;
  
  HDL_Counter2_count_step <= to_unsigned(16#00001#, 20) WHEN Counter_Ctrl_out1 = '1' ELSE
      to_unsigned(16#FFFFF#, 20);
  HDL_Counter2_count_next <= HDL_Counter2_count + HDL_Counter2_count_step;

  Counter_Ctrl_out2_unsigned <= unsigned(Counter_Ctrl_out2);

  triangle_in_unsigned <= unsigned(triangle_in);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay4_reg <= (OTHERS => to_unsigned(16#00000#, 18));
      ELSIF enb = '1' THEN
        Delay4_reg(0) <= triangle_in_unsigned;
        Delay4_reg(1) <= Delay4_reg(0);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1 <= Delay4_reg(1);

  triangle_shift_unsigned <= unsigned(triangle_shift);

  
  Switch10_out1 <= Counter_Ctrl_out2_unsigned WHEN count_src_ext_AXI_1 = '0' ELSE
      Delay4_out1;

  in_9_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        triangle_shift_1 <= to_unsigned(16#00000#, 18);
      ELSIF enb = '1' THEN
        triangle_shift_1 <= triangle_shift_unsigned;
      END IF;
    END IF;
  END PROCESS in_9_pipe_process;


  Triangle_shift_out1_signed <= signed(Triangle_shift_out1);

  Allow_assymetrical_anew_reference_value <= Counter_Ctrl_out3 OR Counter_Ctrl_out4;

  U1_norm_signed <= signed(U1_norm);

  in_4_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        U1_norm_1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        U1_norm_1 <= U1_norm_signed;
      END IF;
    END IF;
  END PROCESS in_4_pipe_process;


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


  
  Switch_out1 <= Delay_out1 WHEN Allow_assymetrical_anew_reference_value = '0' ELSE
      U1_norm_1;

  min_pulse_width_AXI_signed <= signed(min_pulse_width_AXI);

  in_3_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        min_pulse_width_AXI_1 <= to_signed(16#00000#, 18);
      ELSIF enb = '1' THEN
        min_pulse_width_AXI_1 <= min_pulse_width_AXI_signed;
      END IF;
    END IF;
  END PROCESS in_3_pipe_process;


  LimitPulseWidth_out1_signed <= signed(LimitPulseWidth_out1);

  
  Relational_Operator_relop1 <= '1' WHEN Triangle_shift_out1_signed >= LimitPulseWidth_out1_signed ELSE
      '0';

  
  switch_compare_1_1 <= '1' WHEN Relational_Operator_relop1 > '0' ELSE
      '0';

  Constant1_out1(0) <= '1';
  Constant1_out1(1) <= '0';

  Constant2_out1(0) <= '0';
  Constant2_out1(1) <= '1';

  
  Switch7_out1 <= Constant1_out1 WHEN switch_compare_1_1 = '0' ELSE
      Constant2_out1;

  
  Switch3_out1 <= Constant10_out1 WHEN switch_compare_1 = '0' ELSE
      Switch7_out1;

  Switch3_out1_0 <= Switch3_out1(0);

  out_0_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Demux_out1 <= '0';
      ELSIF enb = '1' THEN
        Demux_out1 <= Switch3_out1_0;
      END IF;
    END IF;
  END PROCESS out_0_pipe_process;


  Switch3_out1_1 <= Switch3_out1(1);

  out_1_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Demux_out2 <= '0';
      ELSIF enb = '1' THEN
        Demux_out2 <= Switch3_out1_1;
      END IF;
    END IF;
  END PROCESS out_1_pipe_process;


  
  switch_compare_1_2 <= '1' WHEN PWM_en_AXI_1 > '0' ELSE
      '0';

  U2_norm_signed <= signed(U2_norm);

  in_5_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        U2_norm_1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        U2_norm_1 <= U2_norm_signed;
      END IF;
    END IF;
  END PROCESS in_5_pipe_process;


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


  
  Switch1_out1 <= Delay1_out1 WHEN Allow_assymetrical_anew_reference_value = '0' ELSE
      U2_norm_1;

  LimitPulseWidth1_out1_signed <= signed(LimitPulseWidth1_out1);

  
  Relational_Operator1_relop1 <= '1' WHEN Triangle_shift_out1_signed >= LimitPulseWidth1_out1_signed ELSE
      '0';

  
  switch_compare_1_3 <= '1' WHEN Relational_Operator1_relop1 > '0' ELSE
      '0';

  Constant4_out1(0) <= '1';
  Constant4_out1(1) <= '0';

  Constant5_out1(0) <= '0';
  Constant5_out1(1) <= '1';

  
  Switch8_out1 <= Constant4_out1 WHEN switch_compare_1_3 = '0' ELSE
      Constant5_out1;

  
  Switch4_out1 <= Constant10_out1 WHEN switch_compare_1_2 = '0' ELSE
      Switch8_out1;

  Switch4_out1_0 <= Switch4_out1(0);

  out_2_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Demux1_out1 <= '0';
      ELSIF enb = '1' THEN
        Demux1_out1 <= Switch4_out1_0;
      END IF;
    END IF;
  END PROCESS out_2_pipe_process;


  Switch4_out1_1 <= Switch4_out1(1);

  out_3_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Demux1_out2 <= '0';
      ELSIF enb = '1' THEN
        Demux1_out2 <= Switch4_out1_1;
      END IF;
    END IF;
  END PROCESS out_3_pipe_process;


  
  switch_compare_1_4 <= '1' WHEN PWM_en_AXI_1 > '0' ELSE
      '0';

  U3_norm_signed <= signed(U3_norm);

  in_6_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        U3_norm_1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        U3_norm_1 <= U3_norm_signed;
      END IF;
    END IF;
  END PROCESS in_6_pipe_process;


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


  
  Switch2_out1 <= Delay2_out1 WHEN Allow_assymetrical_anew_reference_value = '0' ELSE
      U3_norm_1;

  LimitPulseWidth2_out1_signed <= signed(LimitPulseWidth2_out1);

  
  Relational_Operator2_relop1 <= '1' WHEN Triangle_shift_out1_signed >= LimitPulseWidth2_out1_signed ELSE
      '0';

  
  switch_compare_1_5 <= '1' WHEN Relational_Operator2_relop1 > '0' ELSE
      '0';

  Constant7_out1(0) <= '1';
  Constant7_out1(1) <= '0';

  Constant8_out1(0) <= '0';
  Constant8_out1(1) <= '1';

  
  Switch9_out1 <= Constant7_out1 WHEN switch_compare_1_5 = '0' ELSE
      Constant8_out1;

  
  Switch5_out1 <= Constant10_out1 WHEN switch_compare_1_4 = '0' ELSE
      Switch9_out1;

  Switch5_out1_0 <= Switch5_out1(0);

  out_4_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Demux2_out1 <= '0';
      ELSIF enb = '1' THEN
        Demux2_out1 <= Switch5_out1_0;
      END IF;
    END IF;
  END PROCESS out_4_pipe_process;


  Switch5_out1_1 <= Switch5_out1(1);

  out_5_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Demux2_out2 <= '0';
      ELSIF enb = '1' THEN
        Demux2_out2 <= Switch5_out1_1;
      END IF;
    END IF;
  END PROCESS out_5_pipe_process;


  out_6_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        PWM_en_AXI_2 <= '0';
      ELSIF enb = '1' THEN
        PWM_en_AXI_2 <= PWM_en_AXI_1;
      END IF;
    END IF;
  END PROCESS out_6_pipe_process;


  out_7_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        f_carrier_kHz_AXI_2 <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' THEN
        f_carrier_kHz_AXI_2 <= f_carrier_kHz_AXI_1;
      END IF;
    END IF;
  END PROCESS out_7_pipe_process;


  f_carrier_kHz_rd_AXI <= std_logic_vector(f_carrier_kHz_AXI_2);

  out_8_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        T_carrier_us_AXI_2 <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' THEN
        T_carrier_us_AXI_2 <= T_carrier_us_AXI_1;
      END IF;
    END IF;
  END PROCESS out_8_pipe_process;


  T_carrier_us_rd_AXI <= std_logic_vector(T_carrier_us_AXI_2);

  out_9_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        min_pulse_width_AXI_2 <= to_signed(16#00000#, 18);
      ELSIF enb = '1' THEN
        min_pulse_width_AXI_2 <= min_pulse_width_AXI_1;
      END IF;
    END IF;
  END PROCESS out_9_pipe_process;


  min_pulse_width_rd_AXI <= std_logic_vector(min_pulse_width_AXI_2);

  Constant_out1 <= '1';

  Constant11_out1 <= '0';

  
  Switch6_out1 <= Constant_out1 WHEN Triangle_shift_out1_signed = to_signed(16#00000#, 18) ELSE
      Constant11_out1;

  out_10_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Switch6_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Switch6_out1_1 <= Switch6_out1;
      END IF;
    END IF;
  END PROCESS out_10_pipe_process;


  out_11_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Counter_Ctrl_out3_1 <= '0';
      ELSIF enb = '1' THEN
        Counter_Ctrl_out3_1 <= Counter_Ctrl_out3;
      END IF;
    END IF;
  END PROCESS out_11_pipe_process;


  out_12_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Counter_Ctrl_out4_1 <= '0';
      ELSIF enb = '1' THEN
        Counter_Ctrl_out4_1 <= Counter_Ctrl_out4;
      END IF;
    END IF;
  END PROCESS out_12_pipe_process;


  out_13_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Counter_Ctrl_out2_1 <= to_unsigned(16#00000#, 18);
      ELSIF enb = '1' THEN
        Counter_Ctrl_out2_1 <= Counter_Ctrl_out2_unsigned;
      END IF;
    END IF;
  END PROCESS out_13_pipe_process;


  triangle_out <= std_logic_vector(Counter_Ctrl_out2_1);

  out_14_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Counter_Ctrl_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Counter_Ctrl_out1_1 <= Counter_Ctrl_out1;
      END IF;
    END IF;
  END PROCESS out_14_pipe_process;


  S1 <= Demux_out1;

  S2 <= Demux_out2;

  S3 <= Demux1_out1;

  S4 <= Demux1_out2;

  S5 <= Demux2_out1;

  S6 <= Demux2_out2;

  PWM_en_rd_AXI <= PWM_en_AXI_2;

  enb_out <= Switch6_out1_1;

  Triangle_Max <= Counter_Ctrl_out3_1;

  Triangle_Min <= Counter_Ctrl_out4_1;

  dir_out <= Counter_Ctrl_out1_1;

END rtl;

