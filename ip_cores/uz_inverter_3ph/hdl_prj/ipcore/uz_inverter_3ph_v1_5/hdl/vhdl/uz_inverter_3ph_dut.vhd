-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_dut.vhd
-- Created: 2022-05-17 08:28:53
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_dut
-- Source Path: uz_inverter_3ph/uz_inverter_3ph_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_inverter_3ph_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        switch_pspl_abc                   :   IN    std_logic;  -- ufix1
        switch_pspl_gate                  :   IN    std_logic;  -- ufix1
        i_abc_ps_0                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        i_abc_ps_1                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        i_abc_ps_2                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        i_abc_pl_0                        :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
        i_abc_pl_1                        :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
        i_abc_pl_2                        :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
        gate_ps_0                         :   IN    std_logic;  -- ufix1
        gate_ps_1                         :   IN    std_logic;  -- ufix1
        gate_ps_2                         :   IN    std_logic;  -- ufix1
        gate_ps_3                         :   IN    std_logic;  -- ufix1
        gate_ps_4                         :   IN    std_logic;  -- ufix1
        gate_ps_5                         :   IN    std_logic;  -- ufix1
        gate_pl_0                         :   IN    std_logic;  -- ufix1
        gate_pl_1                         :   IN    std_logic;  -- ufix1
        gate_pl_2                         :   IN    std_logic;  -- ufix1
        gate_pl_3                         :   IN    std_logic;  -- ufix1
        gate_pl_4                         :   IN    std_logic;  -- ufix1
        gate_pl_5                         :   IN    std_logic;  -- ufix1
        u_dc                              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        ce_out                            :   OUT   std_logic;  -- ufix1
        u_abc_ps_0                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        u_abc_ps_1                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        u_abc_ps_2                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        u_abc_pl_0                        :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
        u_abc_pl_1                        :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
        u_abc_pl_2                        :   OUT   std_logic_vector(24 DOWNTO 0)  -- sfix25_En12
        );
END uz_inverter_3ph_dut;


ARCHITECTURE rtl OF uz_inverter_3ph_dut IS

  -- Component Declarations
  COMPONENT uz_inverter_3ph_src_uz_inverter_3ph
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          switch_pspl_abc                 :   IN    std_logic;  -- ufix1
          switch_pspl_gate                :   IN    std_logic;  -- ufix1
          i_abc_ps_0                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          i_abc_ps_1                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          i_abc_ps_2                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          i_abc_pl_0                      :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
          i_abc_pl_1                      :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
          i_abc_pl_2                      :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
          gate_ps_0                       :   IN    std_logic;  -- ufix1
          gate_ps_1                       :   IN    std_logic;  -- ufix1
          gate_ps_2                       :   IN    std_logic;  -- ufix1
          gate_ps_3                       :   IN    std_logic;  -- ufix1
          gate_ps_4                       :   IN    std_logic;  -- ufix1
          gate_ps_5                       :   IN    std_logic;  -- ufix1
          gate_pl_0                       :   IN    std_logic;  -- ufix1
          gate_pl_1                       :   IN    std_logic;  -- ufix1
          gate_pl_2                       :   IN    std_logic;  -- ufix1
          gate_pl_3                       :   IN    std_logic;  -- ufix1
          gate_pl_4                       :   IN    std_logic;  -- ufix1
          gate_pl_5                       :   IN    std_logic;  -- ufix1
          u_dc                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          ce_out                          :   OUT   std_logic;  -- ufix1
          u_abc_ps_0                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          u_abc_ps_1                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          u_abc_ps_2                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          u_abc_pl_0                      :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
          u_abc_pl_1                      :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
          u_abc_pl_2                      :   OUT   std_logic_vector(24 DOWNTO 0)  -- sfix25_En12
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_inverter_3ph_src_uz_inverter_3ph
    USE ENTITY work.uz_inverter_3ph_src_uz_inverter_3ph(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL u_abc_ps_0_sig                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL u_abc_ps_1_sig                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL u_abc_ps_2_sig                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL u_abc_pl_0_sig                   : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL u_abc_pl_1_sig                   : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL u_abc_pl_2_sig                   : std_logic_vector(24 DOWNTO 0);  -- ufix25

BEGIN
  u_uz_inverter_3ph_src_uz_inverter_3ph : uz_inverter_3ph_src_uz_inverter_3ph
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              switch_pspl_abc => switch_pspl_abc,  -- ufix1
              switch_pspl_gate => switch_pspl_gate,  -- ufix1
              i_abc_ps_0 => i_abc_ps_0,  -- ufix32
              i_abc_ps_1 => i_abc_ps_1,  -- ufix32
              i_abc_ps_2 => i_abc_ps_2,  -- ufix32
              i_abc_pl_0 => i_abc_pl_0,  -- sfix25_En12
              i_abc_pl_1 => i_abc_pl_1,  -- sfix25_En12
              i_abc_pl_2 => i_abc_pl_2,  -- sfix25_En12
              gate_ps_0 => gate_ps_0,  -- ufix1
              gate_ps_1 => gate_ps_1,  -- ufix1
              gate_ps_2 => gate_ps_2,  -- ufix1
              gate_ps_3 => gate_ps_3,  -- ufix1
              gate_ps_4 => gate_ps_4,  -- ufix1
              gate_ps_5 => gate_ps_5,  -- ufix1
              gate_pl_0 => gate_pl_0,  -- ufix1
              gate_pl_1 => gate_pl_1,  -- ufix1
              gate_pl_2 => gate_pl_2,  -- ufix1
              gate_pl_3 => gate_pl_3,  -- ufix1
              gate_pl_4 => gate_pl_4,  -- ufix1
              gate_pl_5 => gate_pl_5,  -- ufix1
              u_dc => u_dc,  -- ufix32
              ce_out => ce_out_sig,  -- ufix1
              u_abc_ps_0 => u_abc_ps_0_sig,  -- ufix32
              u_abc_ps_1 => u_abc_ps_1_sig,  -- ufix32
              u_abc_ps_2 => u_abc_ps_2_sig,  -- ufix32
              u_abc_pl_0 => u_abc_pl_0_sig,  -- sfix25_En12
              u_abc_pl_1 => u_abc_pl_1_sig,  -- sfix25_En12
              u_abc_pl_2 => u_abc_pl_2_sig  -- sfix25_En12
              );

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  u_abc_ps_0 <= u_abc_ps_0_sig;

  u_abc_ps_1 <= u_abc_ps_1_sig;

  u_abc_ps_2 <= u_abc_ps_2_sig;

  u_abc_pl_0 <= u_abc_pl_0_sig;

  u_abc_pl_1 <= u_abc_pl_1_sig;

  u_abc_pl_2 <= u_abc_pl_2_sig;

END rtl;

