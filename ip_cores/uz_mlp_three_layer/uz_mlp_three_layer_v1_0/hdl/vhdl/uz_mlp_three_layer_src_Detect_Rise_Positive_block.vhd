-- -------------------------------------------------------------
-- 
-- File Name: /home/ts/Documents/integrate_nn_to_uz/ultrazohm_sw/ip_cores/nnAXI_v1_0/hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_Detect_Rise_Positive_block.vhd
-- Created: 2021-10-22 11:38:39
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_Detect_Rise_Positive_block
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer/LastLayer/StateMachines/Detect Rise Positive
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_mlp_three_layer_src_Detect_Rise_Positive_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        U                                 :   IN    std_logic;
        Y                                 :   OUT   std_logic
        );
END uz_mlp_three_layer_src_Detect_Rise_Positive_block;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_Detect_Rise_Positive_block IS

  -- Signals
  SIGNAL U_k                              : std_logic;
  SIGNAL U_k_1                            : std_logic;
  SIGNAL FixPt_Relational_Operator_relop1 : std_logic;

BEGIN
  -- Edge
  -- 
  -- U(k)

  
  U_k <= '1' WHEN U > '0' ELSE
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

