-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq\IncreEncoder_ip_src_Counter_theta_ele.vhd
-- Created: 2018-10-01 09:32:45
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_ip_src_Counter_theta_ele
-- Source Path: Encoder_Zynq/IncreEncoder_V22/Counter_theta_ele
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IncreEncoder_ip_src_IncreEncoder_V22_pkg.ALL;

ENTITY IncreEncoder_ip_src_Counter_theta_ele IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_100_0                       :   IN    std_logic;
        Edge_rsvd                         :   IN    std_logic_vector(7 DOWNTO 0);  -- int8
        Reset_1                           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        IncsPerTurn                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Dir                               :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
        count                             :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
        );
END IncreEncoder_ip_src_Counter_theta_ele;


ARCHITECTURE rtl OF IncreEncoder_ip_src_Counter_theta_ele IS

  -- Signals
  SIGNAL IncsPerTurn_unsigned             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL IncsPerTurn_1                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Dir_signed                       : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL reset_old5_out1                  : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL reset_old5_out1_1                : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Constant1_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL Reset_unsigned                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Reset_2                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Edge_signed                      : signed(7 DOWNTO 0);  -- int8
  SIGNAL Constant3_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Constant5_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL Constant2_out1                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL speed_old_switch2_out1           : signed(15 DOWNTO 0);  -- int16
  SIGNAL delayMatch_reg                   : vector_of_signed16(0 TO 1);  -- sfix16 [2]
  SIGNAL reset_old4_out1                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL speed_old_switch1_out1           : signed(15 DOWNTO 0);  -- int16
  SIGNAL IncsPerTurn_dtc                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL reset_old3_out1                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL Add1_out1                        : signed(15 DOWNTO 0);  -- int16
  SIGNAL Resett_switch2_out1              : signed(15 DOWNTO 0);  -- int16
  SIGNAL Resett_switch3_out1              : signed(15 DOWNTO 0);  -- int16
  SIGNAL reset_old2_out1                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL Relational_Operator1_out1_dtc    : signed(15 DOWNTO 0);  -- int16
  SIGNAL only_use_for_neg_speed_out1      : signed(15 DOWNTO 0);  -- int16
  SIGNAL Relational_Operator_1_cast       : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL Resett_switch1_out1              : signed(15 DOWNTO 0);  -- int16

BEGIN
  -- Count
  -- 
  -- Check if count is to big
  -- 
  -- Check if count is  to small

  IncsPerTurn_unsigned <= unsigned(IncsPerTurn);

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        IncsPerTurn_1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        IncsPerTurn_1 <= IncsPerTurn_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch3_process;


  Dir_signed <= signed(Dir);

  reset_old5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old5_out1 <= to_signed(16#0#, 4);
      ELSIF enb_1_100_0 = '1' THEN
        reset_old5_out1 <= Dir_signed;
      END IF;
    END IF;
  END PROCESS reset_old5_process;


  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old5_out1_1 <= to_signed(16#0#, 4);
      ELSIF enb_1_100_0 = '1' THEN
        reset_old5_out1_1 <= reset_old5_out1;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  
  switch_compare_1 <= '1' WHEN reset_old5_out1_1 >= to_signed(16#1#, 4) ELSE
      '0';

  Constant1_out1 <= to_signed(16#0000#, 16);

  Reset_unsigned <= unsigned(Reset_1);

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Reset_2 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_100_0 = '1' THEN
        Reset_2 <= Reset_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  Edge_signed <= signed(Edge_rsvd);

  Constant3_out1 <= to_signed(16#0000#, 16);

  
  switch_compare_1_1 <= '1' WHEN reset_old5_out1 >= to_signed(16#1#, 4) ELSE
      '0';

  Constant5_out1 <= to_signed(-16#0001#, 16);

  Constant2_out1 <= to_signed(16#0001#, 16);

  
  speed_old_switch2_out1 <= Constant5_out1 WHEN switch_compare_1_1 = '0' ELSE
      Constant2_out1;

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch_reg <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_100_0 = '1' THEN
        delayMatch_reg(0) <= speed_old_switch2_out1;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  reset_old4_out1 <= delayMatch_reg(1);

  
  speed_old_switch1_out1 <= Constant3_out1 WHEN Edge_signed = to_signed(16#00#, 8) ELSE
      reset_old4_out1;

  IncsPerTurn_dtc <= signed(IncsPerTurn_1);

  Add1_out1 <= speed_old_switch1_out1 + reset_old3_out1;

  
  Resett_switch2_out1 <= Add1_out1 WHEN Reset_2 = to_unsigned(16#00#, 8) ELSE
      Constant1_out1;

  reset_old2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old2_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_100_0 = '1' THEN
        reset_old2_out1 <= Resett_switch3_out1;
      END IF;
    END IF;
  END PROCESS reset_old2_process;


  
  Relational_Operator1_relop1 <= '1' WHEN reset_old2_out1 <= Constant1_out1 ELSE
      '0';

  Relational_Operator1_out1_dtc <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Relational_Operator1_relop1;

  
  only_use_for_neg_speed_out1 <= Relational_Operator1_out1_dtc WHEN switch_compare_1 = '0' ELSE
      Constant1_out1;

  
  Resett_switch3_out1 <= Resett_switch2_out1 WHEN only_use_for_neg_speed_out1 = to_signed(16#0000#, 16) ELSE
      IncsPerTurn_dtc;

  Relational_Operator_1_cast <= signed(resize(IncsPerTurn_1, 17));
  
  Relational_Operator_relop1 <= '1' WHEN resize(reset_old3_out1, 17) > Relational_Operator_1_cast ELSE
      '0';

  
  Resett_switch1_out1 <= Resett_switch3_out1 WHEN Relational_Operator_relop1 = '0' ELSE
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


  count <= std_logic_vector(reset_old3_out1);

END rtl;

