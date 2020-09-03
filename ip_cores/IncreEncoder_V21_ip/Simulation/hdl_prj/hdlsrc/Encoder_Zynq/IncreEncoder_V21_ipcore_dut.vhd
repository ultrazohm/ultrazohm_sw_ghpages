-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq\IncreEncoder_V21_ipcore_dut.vhd
-- Created: 2018-06-28 14:05:37
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V21_ipcore_dut
-- Source Path: IncreEncoder_V21_ipcore/IncreEncoder_V21_ipcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V21_ipcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        A                                 :   IN    std_logic;  -- ufix1
        B                                 :   IN    std_logic;  -- ufix1
        I                                 :   IN    std_logic;  -- ufix1
        PI2_Inc_AXI4                      :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
        Timer_FPGA_ms_AXI4                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En26
        IncPerTurn_mech_AXI4              :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        Inc_PerTurn_mech_2PI_AXI4         :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
        IncrementePerTurn_elek_AXI4       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        OverSamplFactorInv_AXI4           :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En15
        OverSamplFactor_AXI4              :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        ce_out                            :   OUT   std_logic;  -- ufix1
        omega                             :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        omega_AXI4                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        thete_el                          :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        thete_el_AXI4                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        theta_mech_AXI4                   :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        edge_rsvd                         :   OUT   std_logic;  -- ufix1
        count                             :   OUT   std_logic;  -- ufix1
        direction_AXI4                    :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
        );
END IncreEncoder_V21_ipcore_dut;


ARCHITECTURE rtl OF IncreEncoder_V21_ipcore_dut IS

  -- Component Declarations
  COMPONENT IncreEncoder_V21_ipcore_src_IncreEncoder_V21
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          A                               :   IN    std_logic;  -- ufix1
          B                               :   IN    std_logic;  -- ufix1
          I                               :   IN    std_logic;  -- ufix1
          PI2_Inc_AXI4                    :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
          Timer_FPGA_ms_AXI4              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En26
          IncPerTurn_mech_AXI4            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          Inc_PerTurn_mech_2PI_AXI4       :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
          IncrementePerTurn_elek_AXI4     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          OverSamplFactorInv_AXI4         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En15
          OverSamplFactor_AXI4            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          ce_out                          :   OUT   std_logic;  -- ufix1
          omega                           :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          omega_AXI4                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          thete_el                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          thete_el_AXI4                   :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          theta_mech_AXI4                 :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          edge_rsvd                       :   OUT   std_logic;  -- ufix1
          count                           :   OUT   std_logic;  -- ufix1
          direction_AXI4                  :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IncreEncoder_V21_ipcore_src_IncreEncoder_V21
    USE ENTITY work.IncreEncoder_V21_ipcore_src_IncreEncoder_V21(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL A_sig                            : std_logic;  -- ufix1
  SIGNAL B_sig                            : std_logic;  -- ufix1
  SIGNAL I_sig                            : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL omega_sig                        : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL omega_AXI4_sig                   : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL thete_el_sig                     : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL thete_el_AXI4_sig                : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL theta_mech_AXI4_sig              : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL edge_rsvd_sig                    : std_logic;  -- ufix1
  SIGNAL count_sig                        : std_logic;  -- ufix1
  SIGNAL direction_AXI4_sig               : std_logic_vector(3 DOWNTO 0);  -- ufix4

BEGIN
  u_IncreEncoder_V21_ipcore_src_IncreEncoder_V21 : IncreEncoder_V21_ipcore_src_IncreEncoder_V21
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              A => A_sig,  -- ufix1
              B => B_sig,  -- ufix1
              I => I_sig,  -- ufix1
              PI2_Inc_AXI4 => PI2_Inc_AXI4,  -- ufix24_En24
              Timer_FPGA_ms_AXI4 => Timer_FPGA_ms_AXI4,  -- ufix32_En26
              IncPerTurn_mech_AXI4 => IncPerTurn_mech_AXI4,  -- ufix16
              Inc_PerTurn_mech_2PI_AXI4 => Inc_PerTurn_mech_2PI_AXI4,  -- ufix24_En24
              IncrementePerTurn_elek_AXI4 => IncrementePerTurn_elek_AXI4,  -- ufix16
              OverSamplFactorInv_AXI4 => OverSamplFactorInv_AXI4,  -- ufix16_En15
              OverSamplFactor_AXI4 => OverSamplFactor_AXI4,  -- ufix16
              ce_out => ce_out_sig,  -- ufix1
              omega => omega_sig,  -- sfix24_En11
              omega_AXI4 => omega_AXI4_sig,  -- sfix24_En11
              thete_el => thete_el_sig,  -- sfix24_En20
              thete_el_AXI4 => thete_el_AXI4_sig,  -- sfix24_En20
              theta_mech_AXI4 => theta_mech_AXI4_sig,  -- sfix24_En20
              edge_rsvd => edge_rsvd_sig,  -- ufix1
              count => count_sig,  -- ufix1
              direction_AXI4 => direction_AXI4_sig  -- sfix4
              );

  A_sig <= A;

  B_sig <= B;

  I_sig <= I;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  omega <= omega_sig;

  omega_AXI4 <= omega_AXI4_sig;

  thete_el <= thete_el_sig;

  thete_el_AXI4 <= thete_el_AXI4_sig;

  theta_mech_AXI4 <= theta_mech_AXI4_sig;

  edge_rsvd <= edge_rsvd_sig;

  count <= count_sig;

  direction_AXI4 <= direction_AXI4_sig;

END rtl;

