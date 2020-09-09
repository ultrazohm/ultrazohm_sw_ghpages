-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeL_PWM_direct\PWM_SS_3L_ip_src_Chose_SS.vhd
-- Created: 2020-04-06 17:35:11
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_SS_3L_ip_src_Chose_SS
-- Source Path: ThreeL_PWM_direct/PWM_SS_Ctrl/Chose_SS
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.PWM_SS_3L_ip_src_PWM_SS_Ctrl_pkg.ALL;

ENTITY PWM_SS_3L_ip_src_Chose_SS IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Switch_AXI                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        SSa_IN_PWM                        :   IN    std_logic_vector(0 TO 1);  -- ufix1 [2]
        SSb_IN_PWM                        :   IN    std_logic_vector(0 TO 1);  -- ufix1 [2]
        SSc_IN_PWM                        :   IN    std_logic_vector(0 TO 1);  -- ufix1 [2]
        SSa_IN_External                   :   IN    std_logic_vector(0 TO 1);  -- boolean [2]
        SSb_IN_External                   :   IN    std_logic_vector(0 TO 1);  -- boolean [2]
        SSc_IN_External                   :   IN    std_logic_vector(0 TO 1);  -- boolean [2]
        TriState_HB1_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        TriState_HB2_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        TriState_HB3_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        SSa_OUT                           :   OUT   std_logic_vector(0 TO 1);  -- boolean [2]
        SSb_OUT                           :   OUT   std_logic_vector(0 TO 1);  -- boolean [2]
        SSc_OUT                           :   OUT   std_logic_vector(0 TO 1)  -- boolean [2]
        );
END PWM_SS_3L_ip_src_Chose_SS;


ARCHITECTURE rtl OF PWM_SS_3L_ip_src_Chose_SS IS

  -- Signals
  SIGNAL TriState_HB1_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL delayMatch2_reg                  : vector_of_unsigned2(0 TO 4);  -- ufix2 [5]
  SIGNAL TriState_HB1_AXI_1               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Switch_AXI_unsigned              : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL reduced_reg                      : vector_of_unsigned2(0 TO 4);  -- ufix2 [5]
  SIGNAL Switch_AXI_1                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL SSa_IN_External_0                : std_logic;
  SIGNAL SSa_IN_External_1                : std_logic;
  SIGNAL delayMatch_out_1                 : std_logic;
  SIGNAL delayMatch_1_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL delayMatch_out_2                 : std_logic;
  SIGNAL delayMatch_1_reg_1               : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SSa_IN_External_2                : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL Switch_out1                      : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL Constant2_out1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Switch6_out1                     : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL TriState_HB2_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL delayMatch5_reg                  : vector_of_unsigned2(0 TO 4);  -- ufix2 [5]
  SIGNAL TriState_HB2_AXI_1               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL SSb_IN_External_0                : std_logic;
  SIGNAL SSb_IN_External_1                : std_logic;
  SIGNAL delayMatch3_out_1                : std_logic;
  SIGNAL delayMatch3_1_reg                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL delayMatch3_out_2                : std_logic;
  SIGNAL delayMatch3_1_reg_1              : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SSb_IN_External_2                : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL Switch1_out1                     : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL Switch7_out1                     : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL TriState_HB3_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL delayMatch8_reg                  : vector_of_unsigned2(0 TO 4);  -- ufix2 [5]
  SIGNAL TriState_HB3_AXI_1               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL SSc_IN_External_0                : std_logic;
  SIGNAL SSc_IN_External_1                : std_logic;
  SIGNAL delayMatch6_out_1                : std_logic;
  SIGNAL delayMatch6_1_reg                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL delayMatch6_out_2                : std_logic;
  SIGNAL delayMatch6_1_reg_1              : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL SSc_IN_External_2                : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL Switch2_out1                     : std_logic_vector(0 TO 1);  -- boolean [2]
  SIGNAL Switch8_out1                     : std_logic_vector(0 TO 1);  -- boolean [2]

BEGIN
  TriState_HB1_AXI_unsigned <= unsigned(TriState_HB1_AXI);

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch2_reg <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        delayMatch2_reg(0) <= TriState_HB1_AXI_unsigned;
        delayMatch2_reg(1 TO 4) <= delayMatch2_reg(0 TO 3);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  TriState_HB1_AXI_1 <= delayMatch2_reg(4);

  Switch_AXI_unsigned <= unsigned(Switch_AXI);

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        reduced_reg(0) <= Switch_AXI_unsigned;
        reduced_reg(1 TO 4) <= reduced_reg(0 TO 3);
      END IF;
    END IF;
  END PROCESS reduced_process;

  Switch_AXI_1 <= reduced_reg(4);

  
  switch_compare_1 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  SSa_IN_External_0 <= SSa_IN_External(0);

  delayMatch_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch_1_reg <= (OTHERS => '0');
        delayMatch_1_reg_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch_1_reg(0) <= SSa_IN_External_0;
        delayMatch_1_reg(1) <= delayMatch_1_reg(0);
        delayMatch_1_reg_1(0) <= SSa_IN_External_1;
        delayMatch_1_reg_1(1) <= delayMatch_1_reg_1(0);
      END IF;
    END IF;
  END PROCESS delayMatch_1_process;

  delayMatch_out_1 <= delayMatch_1_reg(1);
  delayMatch_out_2 <= delayMatch_1_reg_1(1);

  SSa_IN_External_1 <= SSa_IN_External(1);

  SSa_IN_External_2(0) <= delayMatch_out_1;
  SSa_IN_External_2(1) <= delayMatch_out_2;

  
  Switch_out1 <= SSa_IN_PWM WHEN switch_compare_1 = '0' ELSE
      SSa_IN_External_2;

  Constant2_out1(0) <= '0';
  Constant2_out1(1) <= '0';

  
  Switch6_out1 <= Switch_out1 WHEN TriState_HB1_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant2_out1;

  TriState_HB2_AXI_unsigned <= unsigned(TriState_HB2_AXI);

  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch5_reg <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        delayMatch5_reg(0) <= TriState_HB2_AXI_unsigned;
        delayMatch5_reg(1 TO 4) <= delayMatch5_reg(0 TO 3);
      END IF;
    END IF;
  END PROCESS delayMatch5_process;

  TriState_HB2_AXI_1 <= delayMatch5_reg(4);

  
  switch_compare_1_1 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  SSb_IN_External_0 <= SSb_IN_External(0);

  delayMatch3_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch3_1_reg <= (OTHERS => '0');
        delayMatch3_1_reg_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch3_1_reg(0) <= SSb_IN_External_0;
        delayMatch3_1_reg(1) <= delayMatch3_1_reg(0);
        delayMatch3_1_reg_1(0) <= SSb_IN_External_1;
        delayMatch3_1_reg_1(1) <= delayMatch3_1_reg_1(0);
      END IF;
    END IF;
  END PROCESS delayMatch3_1_process;

  delayMatch3_out_1 <= delayMatch3_1_reg(1);
  delayMatch3_out_2 <= delayMatch3_1_reg_1(1);

  SSb_IN_External_1 <= SSb_IN_External(1);

  SSb_IN_External_2(0) <= delayMatch3_out_1;
  SSb_IN_External_2(1) <= delayMatch3_out_2;

  
  Switch1_out1 <= SSb_IN_PWM WHEN switch_compare_1_1 = '0' ELSE
      SSb_IN_External_2;

  
  Switch7_out1 <= Switch1_out1 WHEN TriState_HB2_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant2_out1;

  TriState_HB3_AXI_unsigned <= unsigned(TriState_HB3_AXI);

  delayMatch8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch8_reg <= (OTHERS => to_unsigned(16#0#, 2));
      ELSIF enb = '1' THEN
        delayMatch8_reg(0) <= TriState_HB3_AXI_unsigned;
        delayMatch8_reg(1 TO 4) <= delayMatch8_reg(0 TO 3);
      END IF;
    END IF;
  END PROCESS delayMatch8_process;

  TriState_HB3_AXI_1 <= delayMatch8_reg(4);

  
  switch_compare_1_2 <= '1' WHEN Switch_AXI_1 > to_unsigned(16#1#, 2) ELSE
      '0';

  SSc_IN_External_0 <= SSc_IN_External(0);

  delayMatch6_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch6_1_reg <= (OTHERS => '0');
        delayMatch6_1_reg_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch6_1_reg(0) <= SSc_IN_External_0;
        delayMatch6_1_reg(1) <= delayMatch6_1_reg(0);
        delayMatch6_1_reg_1(0) <= SSc_IN_External_1;
        delayMatch6_1_reg_1(1) <= delayMatch6_1_reg_1(0);
      END IF;
    END IF;
  END PROCESS delayMatch6_1_process;

  delayMatch6_out_1 <= delayMatch6_1_reg(1);
  delayMatch6_out_2 <= delayMatch6_1_reg_1(1);

  SSc_IN_External_1 <= SSc_IN_External(1);

  SSc_IN_External_2(0) <= delayMatch6_out_1;
  SSc_IN_External_2(1) <= delayMatch6_out_2;

  
  Switch2_out1 <= SSc_IN_PWM WHEN switch_compare_1_2 = '0' ELSE
      SSc_IN_External_2;

  
  Switch8_out1 <= Switch2_out1 WHEN TriState_HB3_AXI_1 = to_unsigned(16#0#, 2) ELSE
      Constant2_out1;

  SSa_OUT <= Switch6_out1;

  SSb_OUT <= Switch7_out1;

  SSc_OUT <= Switch8_out1;

END rtl;

