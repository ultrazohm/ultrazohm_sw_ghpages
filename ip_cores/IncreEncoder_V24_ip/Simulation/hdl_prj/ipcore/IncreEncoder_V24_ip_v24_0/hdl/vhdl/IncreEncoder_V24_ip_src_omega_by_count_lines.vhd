-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq_V24\IncreEncoder_V24_ip_src_omega_by_count_lines.vhd
-- Created: 2020-06-13 11:16:18
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V24_ip_src_omega_by_count_lines
-- Source Path: Encoder_Zynq_V24/IncreEncoder_V24/omega_by_count_lines
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V24_ip_src_omega_by_count_lines IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_100_0                       :   IN    std_logic;
        Edge_rsvd                         :   IN    std_logic_vector(7 DOWNTO 0);  -- int8
        Reset_1                           :   IN    std_logic;
        IncsPerTurn                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        count                             :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
        );
END IncreEncoder_V24_ip_src_omega_by_count_lines;


ARCHITECTURE rtl OF IncreEncoder_V24_ip_src_omega_by_count_lines IS

  -- Signals
  SIGNAL Use_new_value                    : std_logic;
  SIGNAL Constant4_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL IncsPerTurn_unsigned             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Reset_when_overflow_add_cast     : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Reset_when_overflow_add_temp     : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Reset_when_overflow_out1         : signed(15 DOWNTO 0);  -- int16
  SIGNAL reset_old5_out1                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL Edge_signed                      : signed(7 DOWNTO 0);  -- int8
  SIGNAL Constant3_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL Constant2_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL reset_old4_out1                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL speed_old_switch1_out1           : signed(15 DOWNTO 0);  -- int16
  SIGNAL Constant1_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL reset_old3_out1                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL Add1_out1                        : signed(15 DOWNTO 0);  -- int16
  SIGNAL Resett_switch2_out1              : signed(15 DOWNTO 0);  -- int16
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL Resett_switch1_out1              : signed(15 DOWNTO 0);  -- int16
  SIGNAL reset_old_switch1_out1           : signed(15 DOWNTO 0);  -- int16
  SIGNAL reset_old1_out1                  : signed(15 DOWNTO 0);  -- int16

BEGIN
  -- Set new counter value
  -- 
  -- Check if count is to big in order to safe for value overflow
  -- 
  -- Count

  Use_new_value <= Reset_1;

  Constant4_out1 <= to_signed(16#000A#, 16);

  IncsPerTurn_unsigned <= unsigned(IncsPerTurn);

  Reset_when_overflow_add_cast <= signed(resize(IncsPerTurn_unsigned, 18));
  Reset_when_overflow_add_temp <= resize(Constant4_out1, 18) + Reset_when_overflow_add_cast;
  Reset_when_overflow_out1 <= Reset_when_overflow_add_temp(15 DOWNTO 0);

  reset_old5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old5_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        reset_old5_out1 <= Reset_when_overflow_out1;
      END IF;
    END IF;
  END PROCESS reset_old5_process;


  Edge_signed <= signed(Edge_rsvd);

  Constant3_out1 <= to_signed(16#0000#, 16);

  Constant2_out1 <= to_signed(16#0001#, 16);

  reset_old4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old4_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        reset_old4_out1 <= Constant2_out1;
      END IF;
    END IF;
  END PROCESS reset_old4_process;


  
  speed_old_switch1_out1 <= Constant3_out1 WHEN Edge_signed = to_signed(16#00#, 8) ELSE
      reset_old4_out1;

  Constant1_out1 <= to_signed(16#0000#, 16);

  Add1_out1 <= speed_old_switch1_out1 + reset_old3_out1;

  
  Resett_switch2_out1 <= Add1_out1 WHEN Use_new_value = '0' ELSE
      Constant1_out1;

  
  Relational_Operator_relop1 <= '1' WHEN reset_old3_out1 > reset_old5_out1 ELSE
      '0';

  
  Resett_switch1_out1 <= Resett_switch2_out1 WHEN Relational_Operator_relop1 = '0' ELSE
      Constant1_out1;

  reset_old3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old3_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        reset_old3_out1 <= Resett_switch1_out1;
      END IF;
    END IF;
  END PROCESS reset_old3_process;


  reset_old1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old1_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        reset_old1_out1 <= reset_old_switch1_out1;
      END IF;
    END IF;
  END PROCESS reset_old1_process;


  
  reset_old_switch1_out1 <= reset_old1_out1 WHEN Use_new_value = '0' ELSE
      reset_old3_out1;

  count <= std_logic_vector(reset_old_switch1_out1);

END rtl;

