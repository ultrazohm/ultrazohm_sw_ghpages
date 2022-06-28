-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_src_Compare_To_Constant.vhd
-- Created: 2022-05-08 18:42:59
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_src_Compare_To_Constant
-- Source Path: uz_inverter_3phgm/uz_inverter_3ph/HDL Subsystem/HDL Algorithm/Mode Iteration Manager/Compare To Constant
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_inverter_3ph_src_Compare_To_Constant IS
  GENERIC( const                          : integer := 0
           );
  PORT( u                                 :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        y                                 :   OUT   std_logic
        );
END uz_inverter_3ph_src_Compare_To_Constant;


ARCHITECTURE rtl OF uz_inverter_3ph_src_Compare_To_Constant IS

  -- Signals
  SIGNAL u_unsigned                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_relop1                   : std_logic;

BEGIN
  u_unsigned <= unsigned(u);

  Constant_out1 <= to_unsigned(const, 8);

  
  Compare_relop1 <= '1' WHEN u_unsigned = Constant_out1 ELSE
      '0';

  y <= Compare_relop1;

END rtl;

