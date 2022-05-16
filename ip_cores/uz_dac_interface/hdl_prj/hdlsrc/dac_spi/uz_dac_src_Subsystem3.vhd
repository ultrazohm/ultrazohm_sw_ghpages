-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/dac_spi/uz_dac_src_Subsystem3.vhd
-- Created: 2022-05-16 14:45:28
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_dac_src_Subsystem3
-- Source Path: dac_spi/HDL_DUT/Subsystem3
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_dac_src_Subsystem3 IS
  PORT( u                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        Out1                              :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
        );
END uz_dac_src_Subsystem3;


ARCHITECTURE rtl OF uz_dac_src_Subsystem3 IS

  -- Signals
  SIGNAL u_signed                         : signed(15 DOWNTO 0);  -- int16
  SIGNAL Bit_Slice19_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Bit_Slice17_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice16_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice15_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice14_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice13_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice12_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice11_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice10_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice9_out1                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Bit_Slice7_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice6_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice5_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice4_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice2_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice1_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL Vector_Concatenate_out1          : std_logic_vector(0 TO 31);  -- ufix1 [32]

BEGIN
  u_signed <= signed(u);

  Bit_Slice19_out1 <= unsigned(u_signed(15 DOWNTO 8));

  Bit_Slice17_out1 <= Bit_Slice19_out1(7);

  Bit_Slice16_out1 <= Bit_Slice19_out1(6);

  Bit_Slice15_out1 <= Bit_Slice19_out1(5);

  Bit_Slice14_out1 <= Bit_Slice19_out1(4);

  Bit_Slice13_out1 <= Bit_Slice19_out1(3);

  Bit_Slice12_out1 <= Bit_Slice19_out1(2);

  Bit_Slice11_out1 <= Bit_Slice19_out1(1);

  Bit_Slice10_out1 <= Bit_Slice19_out1(0);

  Bit_Slice9_out1 <= unsigned(u_signed(7 DOWNTO 0));

  Bit_Slice7_out1 <= Bit_Slice9_out1(7);

  Bit_Slice6_out1 <= Bit_Slice9_out1(6);

  Bit_Slice5_out1 <= Bit_Slice9_out1(5);

  Bit_Slice4_out1 <= Bit_Slice9_out1(4);

  Bit_Slice3_out1 <= Bit_Slice9_out1(3);

  Bit_Slice2_out1 <= Bit_Slice9_out1(2);

  Bit_Slice1_out1 <= Bit_Slice9_out1(1);

  Bit_Slice_out1 <= Bit_Slice9_out1(0);

  Vector_Concatenate_out1(0) <= Bit_Slice17_out1;
  Vector_Concatenate_out1(1) <= Bit_Slice17_out1;
  Vector_Concatenate_out1(2) <= Bit_Slice16_out1;
  Vector_Concatenate_out1(3) <= Bit_Slice16_out1;
  Vector_Concatenate_out1(4) <= Bit_Slice15_out1;
  Vector_Concatenate_out1(5) <= Bit_Slice15_out1;
  Vector_Concatenate_out1(6) <= Bit_Slice14_out1;
  Vector_Concatenate_out1(7) <= Bit_Slice14_out1;
  Vector_Concatenate_out1(8) <= Bit_Slice13_out1;
  Vector_Concatenate_out1(9) <= Bit_Slice13_out1;
  Vector_Concatenate_out1(10) <= Bit_Slice12_out1;
  Vector_Concatenate_out1(11) <= Bit_Slice12_out1;
  Vector_Concatenate_out1(12) <= Bit_Slice11_out1;
  Vector_Concatenate_out1(13) <= Bit_Slice11_out1;
  Vector_Concatenate_out1(14) <= Bit_Slice10_out1;
  Vector_Concatenate_out1(15) <= Bit_Slice10_out1;
  Vector_Concatenate_out1(16) <= Bit_Slice7_out1;
  Vector_Concatenate_out1(17) <= Bit_Slice7_out1;
  Vector_Concatenate_out1(18) <= Bit_Slice6_out1;
  Vector_Concatenate_out1(19) <= Bit_Slice6_out1;
  Vector_Concatenate_out1(20) <= Bit_Slice5_out1;
  Vector_Concatenate_out1(21) <= Bit_Slice5_out1;
  Vector_Concatenate_out1(22) <= Bit_Slice4_out1;
  Vector_Concatenate_out1(23) <= Bit_Slice4_out1;
  Vector_Concatenate_out1(24) <= Bit_Slice3_out1;
  Vector_Concatenate_out1(25) <= Bit_Slice3_out1;
  Vector_Concatenate_out1(26) <= Bit_Slice2_out1;
  Vector_Concatenate_out1(27) <= Bit_Slice2_out1;
  Vector_Concatenate_out1(28) <= Bit_Slice1_out1;
  Vector_Concatenate_out1(29) <= Bit_Slice1_out1;
  Vector_Concatenate_out1(30) <= Bit_Slice_out1;
  Vector_Concatenate_out1(31) <= Bit_Slice_out1;

  Out1 <= Vector_Concatenate_out1;

END rtl;

