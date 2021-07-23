-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_pmsm_model/uz_pmsm_model_src_nfp_abs_double.vhd
-- Created: 2021-07-23 14:36:59
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_pmsm_model_src_nfp_abs_double
-- Source Path: uz_pmsm_model/uz_pmsm_model/nfp_abs_double
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_pmsm_model_src_nfp_abs_double IS
  PORT( nfp_in                            :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        nfp_out                           :   OUT   std_logic_vector(63 DOWNTO 0)  -- ufix64
        );
END uz_pmsm_model_src_nfp_abs_double;


ARCHITECTURE rtl OF uz_pmsm_model_src_nfp_abs_double IS

  -- Signals
  SIGNAL Constant_out1                    : std_logic;  -- ufix1
  SIGNAL nfp_in_unsigned                  : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL XS                               : std_logic;  -- ufix1
  SIGNAL XE                               : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL XM                               : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL nfp_out_pack                     : unsigned(63 DOWNTO 0);  -- ufix64

BEGIN
  Constant_out1 <= '0';

  nfp_in_unsigned <= unsigned(nfp_in);

  -- Split 64 bit word into FP sign, exponent, mantissa
  XS <= nfp_in_unsigned(63);
  XE <= nfp_in_unsigned(62 DOWNTO 52);
  XM <= nfp_in_unsigned(51 DOWNTO 0);

  -- Combine FP sign, exponent, mantissa into 64 bit word
  nfp_out_pack <= Constant_out1 & XE & XM;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

