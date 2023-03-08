-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\uz_d_inverter_adapter\uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1.vhd
-- Created: 2022-05-31 17:55:04
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1
-- Source Path: uz_d_inverter_adapter/uz_d_inverter_adapter/PWMdutyFreqDetection/Detect Fall Nonpositive1
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        U                                 :   IN    std_logic;  -- ufix1
        Y                                 :   OUT   std_logic
        );
END uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1;


ARCHITECTURE rtl OF uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1 IS

  -- Signals
  SIGNAL U_k                              : std_logic;
  SIGNAL U_k_1                            : std_logic;
  SIGNAL FixPt_Relational_Operator_relop1 : std_logic;

BEGIN
  -- Edge
  -- 
  -- U(k)

  
  U_k <= '1' WHEN U = '0' ELSE
      '0';

  -- Store in Global RAM
  Delay_Input1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        U_k_1 <= '0';
      ELSIF enb = '1' THEN
        U_k_1 <= U_k;
      END IF;
    END IF;
  END PROCESS Delay_Input1_process;


  
  FixPt_Relational_Operator_relop1 <= '1' WHEN U_k > U_k_1 ELSE
      '0';

  Y <= FixPt_Relational_Operator_relop1;

END rtl;

