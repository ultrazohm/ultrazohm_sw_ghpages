-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_ninephase_VSD_transformation\hdlsrc\hdlsrc\uz_ninephase_VSD_transformation\uz_ninephase_VSD_transformation_src_abc_to_dq_pkg.vhd
-- Created: 2022-08-31 14:46:30
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE uz_ninephase_VSD_transformation_src_abc_to_dq_pkg IS
  TYPE vector_of_signed18 IS ARRAY (NATURAL RANGE <>) OF signed(17 DOWNTO 0);
  TYPE vector_of_unsigned10 IS ARRAY (NATURAL RANGE <>) OF unsigned(9 DOWNTO 0);
  TYPE vector_of_std_logic_vector18 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(17 DOWNTO 0);
  TYPE vector_of_std_logic_vector27 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(26 DOWNTO 0);
  TYPE vector_of_signed27 IS ARRAY (NATURAL RANGE <>) OF signed(26 DOWNTO 0);
  TYPE vector_of_std_logic_vector45 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(44 DOWNTO 0);
  TYPE vector_of_signed45 IS ARRAY (NATURAL RANGE <>) OF signed(44 DOWNTO 0);
  TYPE matrix_of_signed18 IS ARRAY (NATURAL RANGE <>, NATURAL RANGE <>) OF signed(17 DOWNTO 0);
  TYPE matrix_of_signed27 IS ARRAY (NATURAL RANGE <>, NATURAL RANGE <>) OF signed(26 DOWNTO 0);
END uz_ninephase_VSD_transformation_src_abc_to_dq_pkg;

