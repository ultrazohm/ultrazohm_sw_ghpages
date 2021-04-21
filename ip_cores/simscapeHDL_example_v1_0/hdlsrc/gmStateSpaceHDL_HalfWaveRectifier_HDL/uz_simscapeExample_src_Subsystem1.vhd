-- -------------------------------------------------------------
-- 
-- File Name: /home/ts/Dokumente/ultrazohm_testbench/ultrazohm_test/ultrazohm_sw/ip_cores/simscapeHDL_example_v1_0/hdlsrc/gmStateSpaceHDL_HalfWaveRectifier_HDL/uz_simscapeExample_src_Subsystem1.vhd
-- Created: 2021-04-19 11:33:22
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_simscapeExample_src_Subsystem1
-- Source Path: gmStateSpaceHDL_HalfWaveRectifier_HDL/Simscape_system/HDL Subsystem/HDL Algorithm/Mode Selection/State 
-- Mode Vector To Index/Subsystem
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_simscapeExample_src_Subsystem1 IS
  GENERIC( Index                          : integer := 0
           );
  PORT( In1                               :   IN    std_logic;
        In2                               :   IN    std_logic;  -- ufix1
        In3                               :   IN    std_logic;
        Out1                              :   OUT   std_logic  -- ufix1
        );
END uz_simscapeExample_src_Subsystem1;


ARCHITECTURE rtl OF uz_simscapeExample_src_Subsystem1 IS

  -- Signals
  SIGNAL Bitwise_Operator_out1            : std_logic;
  SIGNAL Bitwise_Operator1_out1           : std_logic;
  SIGNAL Index_out1                       : std_logic;  -- ufix1
  SIGNAL Switch_out1                      : std_logic;  -- ufix1

BEGIN
  Bitwise_Operator_out1 <= In1 XOR In3;

  Bitwise_Operator1_out1 <=  NOT Bitwise_Operator_out1;

  Index_out1 <= '0' WHEN Index = 0 ELSE
                '1';

  
  Switch_out1 <= In2 WHEN Bitwise_Operator1_out1 = '0' ELSE
      Index_out1;

  Out1 <= Switch_out1;

END rtl;

