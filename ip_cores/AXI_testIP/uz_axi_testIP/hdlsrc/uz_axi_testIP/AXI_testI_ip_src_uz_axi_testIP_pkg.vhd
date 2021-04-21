-- -------------------------------------------------------------
-- 
-- File Name: uz_axi_testIP/hdlsrc/uz_axi_testIP/AXI_testI_ip_src_uz_axi_testIP_pkg.vhd
-- Created: 2021-04-18 13:18:01
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE AXI_testI_ip_src_uz_axi_testIP_pkg IS
  TYPE vector_of_unsigned42 IS ARRAY (NATURAL RANGE <>) OF unsigned(41 DOWNTO 0);
  TYPE vector_of_unsigned26 IS ARRAY (NATURAL RANGE <>) OF unsigned(25 DOWNTO 0);
  TYPE vector_of_signed10 IS ARRAY (NATURAL RANGE <>) OF signed(9 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
  TYPE vector_of_signed28 IS ARRAY (NATURAL RANGE <>) OF signed(27 DOWNTO 0);
  TYPE vector_of_unsigned27 IS ARRAY (NATURAL RANGE <>) OF unsigned(26 DOWNTO 0);
  TYPE vector_of_unsigned23 IS ARRAY (NATURAL RANGE <>) OF unsigned(22 DOWNTO 0);
  TYPE matrix_of_std_logic_vector32 IS ARRAY (NATURAL RANGE <>, NATURAL RANGE <>) OF std_logic_vector(31 DOWNTO 0);
  TYPE vector_of_std_logic_vector32 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(31 DOWNTO 0);
  TYPE vector_of_unsigned32 IS ARRAY (NATURAL RANGE <>) OF unsigned(31 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
END AXI_testI_ip_src_uz_axi_testIP_pkg;
