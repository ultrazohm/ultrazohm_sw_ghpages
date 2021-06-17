-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_plantModel_pt1/uz_plantModel_pt1_dut.vhd
-- Created: 2021-06-17 10:07:10
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_plantModel_pt1_dut
-- Source Path: uz_plantModel_pt1/uz_plantModel_pt1_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_plantModel_pt1_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        input                             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        gain                              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        reciprocal_time_constant          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        reset_1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        ce_out                            :   OUT   std_logic;  -- ufix1
        output                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END uz_plantModel_pt1_dut;


ARCHITECTURE rtl OF uz_plantModel_pt1_dut IS

  -- Component Declarations
  COMPONENT uz_plantModel_pt1_src_uz_plantModel_pt1
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          input                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          gain                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          reciprocal_time_constant        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          reset_1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          ce_out                          :   OUT   std_logic;  -- ufix1
          output                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_plantModel_pt1_src_uz_plantModel_pt1
    USE ENTITY work.uz_plantModel_pt1_src_uz_plantModel_pt1(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL output_sig                       : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_uz_plantModel_pt1_src_uz_plantModel_pt1 : uz_plantModel_pt1_src_uz_plantModel_pt1
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              input => input,  -- ufix32
              gain => gain,  -- ufix32
              reciprocal_time_constant => reciprocal_time_constant,  -- ufix32
              reset_1 => reset_1,  -- ufix32
              ce_out => ce_out_sig,  -- ufix1
              output => output_sig  -- ufix32
              );

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  output <= output_sig;

END rtl;

