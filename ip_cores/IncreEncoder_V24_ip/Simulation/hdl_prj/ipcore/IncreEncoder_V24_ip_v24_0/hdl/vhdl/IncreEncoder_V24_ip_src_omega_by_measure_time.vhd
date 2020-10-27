-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq_V24\IncreEncoder_V24_ip_src_omega_by_measure_time.vhd
-- Created: 2020-06-13 11:16:18
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V24_ip_src_omega_by_measure_time
-- Source Path: Encoder_Zynq_V24/IncreEncoder_V24/omega_by_measure_time
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V24_ip_src_omega_by_measure_time IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_100_0                       :   IN    std_logic;
        Edge_rsvd                         :   IN    std_logic;
        T                                 :   IN    std_logic_vector(37 DOWNTO 0);  -- sfix38_En32
        Dir                               :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
        ReadBack_Omega                    :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        OverSamplOmega                    :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        one_Omega                         :   OUT   std_logic_vector(37 DOWNTO 0);  -- sfix38_En32
        OverSamplingFactor                :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        NewMeasurement                    :   OUT   std_logic
        );
END IncreEncoder_V24_ip_src_omega_by_measure_time;


ARCHITECTURE rtl OF IncreEncoder_V24_ip_src_omega_by_measure_time IS

  -- Component Declarations
  COMPONENT IncreEncoder_V24_ip_src_Count
    PORT( AllowCheckOverSampl             :   IN    std_logic;
          ReadBack_Omega                  :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          OverSamplOmega                  :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          state                           :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          InternalOmega                   :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          state_Out                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          InternalOmega_Out               :   OUT   std_logic_vector(23 DOWNTO 0)  -- sfix24_En11
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IncreEncoder_V24_ip_src_Count
    USE ENTITY work.IncreEncoder_V24_ip_src_Count(rtl);

  -- Signals
  SIGNAL alpha1_for_one_cycle_if_edge_recognized : signed(7 DOWNTO 0);  -- int8
  SIGNAL reset_old1_out1                  : std_logic;
  SIGNAL reset_old_switch1_out1           : std_logic;
  SIGNAL Detec_edge_sub_cast              : signed(7 DOWNTO 0);  -- sfix8
  SIGNAL Detec_edge_sub_cast_1            : signed(7 DOWNTO 0);  -- sfix8
  SIGNAL count_old1_out1                  : signed(7 DOWNTO 0);  -- int8
  SIGNAL Constant3_out1                   : signed(7 DOWNTO 0);  -- int8
  SIGNAL ProtectToUseOmegaIfThetaJump1_relop1 : std_logic;
  SIGNAL ProtectToUseOmegaIfThetaJump1_relop1_dtc : signed(15 DOWNTO 0);  -- int16
  SIGNAL Constant4_out1                   : signed(7 DOWNTO 0);  -- int8
  SIGNAL Constant4_out1_dtc               : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Delay7_ctrl_const_out            : std_logic;
  SIGNAL Delay7_ctrl_delay_out            : std_logic;
  SIGNAL Delay7_Initial_Val_out           : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL ReadBack_Omega_signed            : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Abs_y                            : signed(24 DOWNTO 0);  -- sfix25_En11
  SIGNAL Abs_cast                         : signed(24 DOWNTO 0);  -- sfix25_En11
  SIGNAL Abs_out1                         : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Delay5_out1                      : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL InternalOmega_Out                : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL InternalOmega_Out_signed         : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Delay6_out1                      : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Delay7_out1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Allow_ToCheckOversampling        : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL state_Out                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL state_Out_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay7_out                       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL OnlyAllowInNewPeriod_out1        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL OnlyAllowInNewPeriod_out1_1      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay1_out1                      : signed(15 DOWNTO 0);  -- int16
  SIGNAL Delay1_out1_dtc                  : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Reset_out1                       : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Add3_add_cast                    : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL state_prev                       : signed(15 DOWNTO 0);  -- int16
  SIGNAL IfFinalState_1_cast              : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL IfFinalState_relop1              : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Dir_signed                       : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Constant1_out1                   : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL T_signed                         : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL Constant_out1                    : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL T_count_out1                     : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL Add1_out1                        : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL Pipeline1_out1                   : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL T_count_switch_out1              : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL ProtectOverflow_T_count_out1     : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL Add2_out1                        : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL speed_old_switch2_out1           : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL Pipeline_out1                    : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL ABS_y_1                          : signed(38 DOWNTO 0);  -- sfix39_En32
  SIGNAL ABS_cast_1                       : signed(38 DOWNTO 0);  -- sfix39_En32
  SIGNAL ABS_out1_1                       : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL switch_compare_1_3               : std_logic;
  SIGNAL speed_old_switch_out1            : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL speed_old_out1                   : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL Constant2_out1                   : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL ProtectOverflow_rps_out1         : signed(37 DOWNTO 0);  -- sfix38_En32
  SIGNAL Reset1_out1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay4_out1                      : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  -- Oversampling
  -- - At high speed, it may happen that the granularity of the time measurment between 
  -- two edges is to low for a good speed accuracy (e.g. over 2000rpm), therefore, using 
  -- the oversampling factor, not the time between two edges is measured. Instead, the
  -- time between "Oversampling" edges is measured.
  -- - Since at high speed anyway the speed is not necessary at each line edge,
  -- it is totally ok to do this.
  -- - At the moment it is tested until 20 edges time window. However, more is possible.
  -- - At low speed, only two edges are used.
  -- - At maximum speed, the "Oversampling" number of edges are used.
  -- - Between them, a linear factor is used.
  -- - Using the OverSampling number also at low speed is not possible,
  -- since the fixpoint range must be quite high! (fixdt(1,36,30) is used at the moment)
  -- 
  -- Count up in order to measure the time between to positive edges of the A-Line of the encoder 
  -- 
  -- Reset time measurement
  -- 
  -- Detect each positive edge of the A-Line of the encoder
  -- 
  -- 1 for one cycle if edge recognized
  -- 
  -- Use new Speed after every positive A-Line Edge
  -- It outputs 1/omega. This is possible, since "T" input is already scaled to rad.
  -- 
  -- Select direction of counting
  -- 
  -- If ABS of counted values is bigger than the
  -- fixpoint data format can represent, reset the
  -- value in order to protect for value overflow.

  u_Count : IncreEncoder_V24_ip_src_Count
    PORT MAP( AllowCheckOverSampl => Delay3_out1,
              ReadBack_Omega => std_logic_vector(Delay5_out1),  -- sfix24_En11
              OverSamplOmega => OverSamplOmega,  -- sfix24_En11
              state => std_logic_vector(Delay7_out1),  -- uint16
              InternalOmega => std_logic_vector(Delay6_out1),  -- sfix24_En11
              state_Out => state_Out,  -- uint16
              InternalOmega_Out => InternalOmega_Out  -- sfix24_En11
              );

  
  reset_old_switch1_out1 <= reset_old1_out1 WHEN alpha1_for_one_cycle_if_edge_recognized = to_signed(16#00#, 8) ELSE
      Edge_rsvd;

  reset_old1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old1_out1 <= '0';
      ELSIF enb_1_100_0 = '1' THEN
        reset_old1_out1 <= reset_old_switch1_out1;
      END IF;
    END IF;
  END PROCESS reset_old1_process;


  Detec_edge_sub_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & Edge_rsvd;
  Detec_edge_sub_cast_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & reset_old1_out1;
  alpha1_for_one_cycle_if_edge_recognized <= Detec_edge_sub_cast - Detec_edge_sub_cast_1;

  count_old1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        count_old1_out1 <= to_signed(16#00#, 8);
      ELSIF enb_1_100_0 = '1' THEN
        count_old1_out1 <= alpha1_for_one_cycle_if_edge_recognized;
      END IF;
    END IF;
  END PROCESS count_old1_process;


  Constant3_out1 <= to_signed(16#00#, 8);

  
  ProtectToUseOmegaIfThetaJump1_relop1 <= '1' WHEN count_old1_out1 > Constant3_out1 ELSE
      '0';

  ProtectToUseOmegaIfThetaJump1_relop1_dtc <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & ProtectToUseOmegaIfThetaJump1_relop1;

  Constant4_out1 <= to_signed(16#01#, 8);

  Constant4_out1_dtc <= resize(Constant4_out1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 24);

  Delay7_ctrl_const_out <= '1';

  Delay7_ctrl_delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay7_ctrl_delay_out <= '0';
      ELSIF enb_1_100_0 = '1' THEN
        Delay7_ctrl_delay_out <= Delay7_ctrl_const_out;
      END IF;
    END IF;
  END PROCESS Delay7_ctrl_delay_process;


  Delay7_Initial_Val_out <= to_unsigned(16#0001#, 16);

  ReadBack_Omega_signed <= signed(ReadBack_Omega);

  Abs_cast <= resize(ReadBack_Omega_signed, 25);
  
  Abs_y <=  - (Abs_cast) WHEN ReadBack_Omega_signed < to_signed(16#000000#, 24) ELSE
      resize(ReadBack_Omega_signed, 25);
  Abs_out1 <= Abs_y(23 DOWNTO 0);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay5_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_100_0 = '1' THEN
        Delay5_out1 <= Abs_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  InternalOmega_Out_signed <= signed(InternalOmega_Out);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay6_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_100_0 = '1' THEN
        Delay6_out1 <= InternalOmega_Out_signed;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb_1_100_0 = '1' THEN
        Delay3_out1 <= Allow_ToCheckOversampling;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  state_Out_unsigned <= unsigned(state_Out);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay7_out <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        Delay7_out <= state_Out_unsigned;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  
  Delay7_out1 <= Delay7_Initial_Val_out WHEN Delay7_ctrl_delay_out = '0' ELSE
      Delay7_out;

  
  OnlyAllowInNewPeriod_out1_1 <= OnlyAllowInNewPeriod_out1 WHEN Allow_ToCheckOversampling = '0' ELSE
      Delay7_out1;

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        OnlyAllowInNewPeriod_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        OnlyAllowInNewPeriod_out1 <= OnlyAllowInNewPeriod_out1_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Delay1_out1_dtc <= Delay1_out1(12 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';

  
  Reset_out1 <= Delay1_out1_dtc WHEN Allow_ToCheckOversampling = '0' ELSE
      Constant4_out1_dtc;

  Add3_add_cast <= resize(Reset_out1(23 DOWNTO 11), 16);
  state_prev <= ProtectToUseOmegaIfThetaJump1_relop1_dtc + Add3_add_cast;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        Delay1_out1 <= state_prev;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  IfFinalState_1_cast <= signed(resize(OnlyAllowInNewPeriod_out1, 17));
  
  IfFinalState_relop1 <= '1' WHEN resize(Delay1_out1, 17) > IfFinalState_1_cast ELSE
      '0';

  Allow_ToCheckOversampling <= IfFinalState_relop1;

  
  switch_compare_1 <= '1' WHEN Allow_ToCheckOversampling > '0' ELSE
      '0';

  Dir_signed <= signed(Dir);

  
  switch_compare_1_1 <= '1' WHEN Dir_signed >= to_signed(16#1#, 4) ELSE
      '0';

  Constant1_out1 <= to_signed(0, 38);

  T_signed <= signed(T);

  Constant_out1 <= to_signed(0, 38);

  Add1_out1 <= T_count_out1 + T_signed;

  
  switch_compare_1_2 <= '1' WHEN Pipeline1_out1 >= signed'("01111000000000000000000000000000000000") ELSE
      '0';

  
  ProtectOverflow_T_count_out1 <= T_count_switch_out1 WHEN switch_compare_1_2 = '0' ELSE
      Constant1_out1;

  T_count_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        T_count_out1 <= to_signed(0, 38);
      ELSIF enb_1_100_0 = '1' THEN
        T_count_out1 <= ProtectOverflow_T_count_out1;
      END IF;
    END IF;
  END PROCESS T_count_process;


  Add2_out1 <= T_count_out1 - T_signed;

  
  speed_old_switch2_out1 <= Add2_out1 WHEN switch_compare_1_1 = '0' ELSE
      Add1_out1;

  
  T_count_switch_out1 <= speed_old_switch2_out1 WHEN switch_compare_1 = '0' ELSE
      Constant_out1;

  Pipeline_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Pipeline_out1 <= to_signed(0, 38);
      ELSIF enb_1_100_0 = '1' THEN
        Pipeline_out1 <= T_count_switch_out1;
      END IF;
    END IF;
  END PROCESS Pipeline_process;


  ABS_cast_1 <= resize(Pipeline_out1, 39);
  
  ABS_y_1 <=  - (ABS_cast_1) WHEN Pipeline_out1 < to_signed(0, 38) ELSE
      resize(Pipeline_out1, 39);
  ABS_out1_1 <= ABS_y_1(37 DOWNTO 0);

  Pipeline1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Pipeline1_out1 <= to_signed(0, 38);
      ELSIF enb_1_100_0 = '1' THEN
        Pipeline1_out1 <= ABS_out1_1;
      END IF;
    END IF;
  END PROCESS Pipeline1_process;


  
  switch_compare_1_3 <= '1' WHEN Pipeline1_out1 >= signed'("01111000000000000000000000000000000000") ELSE
      '0';

  speed_old_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        speed_old_out1 <= to_signed(0, 38);
      ELSIF enb_1_100_0 = '1' THEN
        speed_old_out1 <= speed_old_switch_out1;
      END IF;
    END IF;
  END PROCESS speed_old_process;


  
  speed_old_switch_out1 <= speed_old_out1 WHEN Allow_ToCheckOversampling = '0' ELSE
      speed_old_switch2_out1;

  Constant2_out1 <= to_signed(0, 38);

  
  ProtectOverflow_rps_out1 <= speed_old_switch_out1 WHEN switch_compare_1_3 = '0' ELSE
      Constant2_out1;

  one_Omega <= std_logic_vector(ProtectOverflow_rps_out1);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay4_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        Delay4_out1 <= Reset1_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  
  Reset1_out1 <= Delay4_out1 WHEN Allow_ToCheckOversampling = '0' ELSE
      OnlyAllowInNewPeriod_out1;

  OverSamplingFactor <= std_logic_vector(Reset1_out1);


  NewMeasurement <= IfFinalState_relop1;

END rtl;
