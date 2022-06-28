-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_src_Subsystem1.vhd
-- Created: 2022-05-17 08:28:44
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_src_Subsystem1
-- Source Path: uz_inverter_3phgm/uz_inverter_3ph/HDL Subsystem/HDL Algorithm/Mode Selection/State Mode Vector To 
-- Index/Subsystem
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_inverter_3ph_src_Subsystem1 IS
  GENERIC( Index                          : integer := 0
           );
  PORT( In1                               :   IN    std_logic_vector(0 TO 11);  -- boolean [12]
        In2                               :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        In3                               :   IN    std_logic_vector(0 TO 11);  -- boolean [12]
        Out1                              :   OUT   std_logic_vector(2 DOWNTO 0)  -- ufix3
        );
END uz_inverter_3ph_src_Subsystem1;


ARCHITECTURE rtl OF uz_inverter_3ph_src_Subsystem1 IS

  -- Signals
  SIGNAL Bitwise_Operator_out1            : std_logic_vector(0 TO 11);  -- boolean [12]
  SIGNAL Bitwise_Operator_out1_0          : std_logic;
  SIGNAL Bitwise_Operator_out1_1          : std_logic;
  SIGNAL Bitwise_Operator_out1_2          : std_logic;
  SIGNAL Bitwise_Operator_out1_3          : std_logic;
  SIGNAL Bitwise_Operator_out1_4          : std_logic;
  SIGNAL Bitwise_Operator_out1_5          : std_logic;
  SIGNAL Bitwise_Operator_out1_6          : std_logic;
  SIGNAL Bitwise_Operator_out1_7          : std_logic;
  SIGNAL Bitwise_Operator_out1_8          : std_logic;
  SIGNAL Bitwise_Operator_out1_9          : std_logic;
  SIGNAL Bitwise_Operator_out1_10         : std_logic;
  SIGNAL Bitwise_Operator_out1_11         : std_logic;
  SIGNAL Bitwise_Operator1_out1           : std_logic;
  SIGNAL In2_unsigned                     : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Index_out1                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Switch_out1                      : unsigned(2 DOWNTO 0);  -- ufix3

BEGIN
  Bitwise_Operator_out1(0) <= In1(0) XOR In3(0);
  Bitwise_Operator_out1(1) <= In1(1) XOR In3(1);
  Bitwise_Operator_out1(2) <= In1(2) XOR In3(2);
  Bitwise_Operator_out1(3) <= In1(3) XOR In3(3);
  Bitwise_Operator_out1(4) <= In1(4) XOR In3(4);
  Bitwise_Operator_out1(5) <= In1(5) XOR In3(5);
  Bitwise_Operator_out1(6) <= In1(6) XOR In3(6);
  Bitwise_Operator_out1(7) <= In1(7) XOR In3(7);
  Bitwise_Operator_out1(8) <= In1(8) XOR In3(8);
  Bitwise_Operator_out1(9) <= In1(9) XOR In3(9);
  Bitwise_Operator_out1(10) <= In1(10) XOR In3(10);
  Bitwise_Operator_out1(11) <= In1(11) XOR In3(11);

  Bitwise_Operator_out1_0 <= Bitwise_Operator_out1(0);

  Bitwise_Operator_out1_1 <= Bitwise_Operator_out1(1);

  Bitwise_Operator_out1_2 <= Bitwise_Operator_out1(2);

  Bitwise_Operator_out1_3 <= Bitwise_Operator_out1(3);

  Bitwise_Operator_out1_4 <= Bitwise_Operator_out1(4);

  Bitwise_Operator_out1_5 <= Bitwise_Operator_out1(5);

  Bitwise_Operator_out1_6 <= Bitwise_Operator_out1(6);

  Bitwise_Operator_out1_7 <= Bitwise_Operator_out1(7);

  Bitwise_Operator_out1_8 <= Bitwise_Operator_out1(8);

  Bitwise_Operator_out1_9 <= Bitwise_Operator_out1(9);

  Bitwise_Operator_out1_10 <= Bitwise_Operator_out1(10);

  Bitwise_Operator_out1_11 <= Bitwise_Operator_out1(11);

  Bitwise_Operator1_out1 <=  NOT (Bitwise_Operator_out1_11 OR (Bitwise_Operator_out1_10 OR (Bitwise_Operator_out1_9 OR (Bitwise_Operator_out1_8 OR (Bitwise_Operator_out1_7 OR (Bitwise_Operator_out1_6 OR (Bitwise_Operator_out1_5 OR (Bitwise_Operator_out1_4 OR (Bitwise_Operator_out1_3 OR (Bitwise_Operator_out1_2 OR (Bitwise_Operator_out1_0 OR Bitwise_Operator_out1_1)))))))))));

  In2_unsigned <= unsigned(In2);

  Index_out1 <= to_unsigned(Index, 3);

  
  Switch_out1 <= In2_unsigned WHEN Bitwise_Operator1_out1 = '0' ELSE
      Index_out1;

  Out1 <= std_logic_vector(Switch_out1);

END rtl;

