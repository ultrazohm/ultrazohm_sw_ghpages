-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq\IncreEncoder_ip_src_omega_by_measure_time.vhd
-- Created: 2018-10-01 09:32:45
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_ip_src_omega_by_measure_time
-- Source Path: Encoder_Zynq/IncreEncoder_V22/omega_by_measure_time
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_ip_src_omega_by_measure_time IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_100_0                       :   IN    std_logic;
        Edge_rsvd                         :   IN    std_logic;
        T                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En26
        rps                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En26
        NewMeasurement                    :   OUT   std_logic
        );
END IncreEncoder_ip_src_omega_by_measure_time;


ARCHITECTURE rtl OF IncreEncoder_ip_src_omega_by_measure_time IS

  -- Signals
  SIGNAL alpha1_for_one_cycle_if_edge_recognized : signed(7 DOWNTO 0);  -- int8
  SIGNAL reset_old1_out1                  : std_logic;
  SIGNAL reset_old_switch1_out1           : std_logic;
  SIGNAL Detec_edge_sub_cast              : signed(7 DOWNTO 0);  -- sfix8
  SIGNAL Detec_edge_sub_cast_1            : signed(7 DOWNTO 0);  -- sfix8
  SIGNAL count_old1_out1                  : signed(7 DOWNTO 0);  -- int8
  SIGNAL Constant3_out1                   : signed(7 DOWNTO 0);  -- int8
  SIGNAL ProtectToUseOmegaIfThetaJump1_relop1 : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL T_unsigned                       : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL T_1                              : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL Constant1_out1                   : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL Constant_out1                    : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL T_count_switch_out1              : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL ProtectOverflow_T_count_out1     : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL T_count_out1                     : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL Add1_out1                        : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL speed_old_switch_out1            : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL speed_old_out1                   : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL Constant2_out1                   : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL ProtectOverflow_rps_out1         : unsigned(31 DOWNTO 0);  -- ufix32_En26

BEGIN
  -- Count up in order to measure the time between to positive edges of the A-Line of the encoder 
  -- 
  -- Reset time measurement
  -- 
  -- Detect each positive edge of the A-Line of the encoder
  -- 
  -- 1 for one cycle if edge recognized
  -- 
  -- Use new Speed after every positive A-Line Edge

  
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

  
  switch_compare_1 <= '1' WHEN ProtectToUseOmegaIfThetaJump1_relop1 > '0' ELSE
      '0';

  T_unsigned <= unsigned(T);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        T_1 <= to_unsigned(0, 32);
      ELSIF enb_1_100_0 = '1' THEN
        T_1 <= T_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  Constant1_out1 <= to_unsigned(0, 32);

  Constant_out1 <= to_unsigned(0, 32);

  
  switch_compare_1_1 <= '1' WHEN T_count_switch_out1 >= unsigned'(X"C8000000") ELSE
      '0';

  
  ProtectOverflow_T_count_out1 <= T_count_switch_out1 WHEN switch_compare_1_1 = '0' ELSE
      Constant1_out1;

  T_count_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        T_count_out1 <= to_unsigned(0, 32);
      ELSIF enb_1_100_0 = '1' THEN
        T_count_out1 <= ProtectOverflow_T_count_out1;
      END IF;
    END IF;
  END PROCESS T_count_process;


  Add1_out1 <= T_1 + T_count_out1;

  
  T_count_switch_out1 <= Add1_out1 WHEN switch_compare_1 = '0' ELSE
      Constant_out1;

  
  switch_compare_1_2 <= '1' WHEN T_count_switch_out1 >= unsigned'(X"C8000000") ELSE
      '0';

  speed_old_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        speed_old_out1 <= to_unsigned(0, 32);
      ELSIF enb_1_100_0 = '1' THEN
        speed_old_out1 <= speed_old_switch_out1;
      END IF;
    END IF;
  END PROCESS speed_old_process;


  
  speed_old_switch_out1 <= speed_old_out1 WHEN ProtectToUseOmegaIfThetaJump1_relop1 = '0' ELSE
      Add1_out1;

  Constant2_out1 <= to_unsigned(0, 32);

  
  ProtectOverflow_rps_out1 <= speed_old_switch_out1 WHEN switch_compare_1_2 = '0' ELSE
      Constant2_out1;

  rps <= std_logic_vector(ProtectOverflow_rps_out1);


  NewMeasurement <= ProtectToUseOmegaIfThetaJump1_relop1;

END rtl;

