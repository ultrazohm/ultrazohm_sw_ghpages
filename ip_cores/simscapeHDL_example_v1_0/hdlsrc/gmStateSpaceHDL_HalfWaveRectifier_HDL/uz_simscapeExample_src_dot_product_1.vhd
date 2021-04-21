-- -------------------------------------------------------------
-- 
-- File Name: /home/ts/Dokumente/ultrazohm_testbench/ultrazohm_test/ultrazohm_sw/ip_cores/simscapeHDL_example_v1_0/hdlsrc/gmStateSpaceHDL_HalfWaveRectifier_HDL/uz_simscapeExample_src_dot_product_1.vhd
-- Created: 2021-04-19 11:33:22
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_simscapeExample_src_dot_product_1
-- Source Path: dot_product_1
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_simscapeExample_src_dot_product_1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in1                               :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        in2                               :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        out1                              :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END uz_simscapeExample_src_dot_product_1;


ARCHITECTURE rtl OF uz_simscapeExample_src_dot_product_1 IS

  -- Component Declarations
  COMPONENT uz_simscapeExample_src_nfp_mul_single
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_simscapeExample_src_nfp_mul_single
    USE ENTITY work.uz_simscapeExample_src_nfp_mul_single(rtl);

  -- Signals
  SIGNAL mul_out1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_nfp_mul_comp : uz_simscapeExample_src_nfp_mul_single
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              nfp_in1 => in1,  -- single
              nfp_in2 => in2,  -- single
              nfp_out => mul_out1  -- single
              );

  out1 <= mul_out1;

END rtl;

