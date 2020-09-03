-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq\IncreEncoder_V18_ipcore_dut.vhd
-- Created: 2017-07-30 17:53:25
-- 
-- Generated by MATLAB 9.0 and HDL Coder 3.8
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V18_ipcore_dut
-- Source Path: IncreEncoder_V18_ipcore/IncreEncoder_V18_ipcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V18_ipcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        A                                 :   IN    std_logic;  -- ufix1
        B                                 :   IN    std_logic;  -- ufix1
        I                                 :   IN    std_logic;  -- ufix1
        PI2_Inc_AXI4                      :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
        IncPerTurn_AXI4                   :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        Timer_FPGA_ms_AXI4                :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        IncPerTurn_mech_AXI4              :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        Inc_PerTurn_mech_2PI_AXI4         :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
        IncrementePerTurn_elek_AXI4       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        ce_out                            :   OUT   std_logic;  -- ufix1
        rps                               :   OUT   std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        rps_AXI4                          :   OUT   std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        thete_el                          :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        thete_el_AXI4                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        theta_mech_AXI4                   :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        edge_rsvd                         :   OUT   std_logic;  -- ufix1
        count                             :   OUT   std_logic;  -- ufix1
        direction_AXI4                    :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
        );
END IncreEncoder_V18_ipcore_dut;


ARCHITECTURE rtl OF IncreEncoder_V18_ipcore_dut IS

  -- Component Declarations
  COMPONENT IncreEncoder_V18_ipcore_src_IncreEncoder_V18
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          A                               :   IN    std_logic;  -- ufix1
          B                               :   IN    std_logic;  -- ufix1
          I                               :   IN    std_logic;  -- ufix1
          PI2_Inc_AXI4                    :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
          IncPerTurn_AXI4                 :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          Timer_FPGA_ms_AXI4              :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          IncPerTurn_mech_AXI4            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          Inc_PerTurn_mech_2PI_AXI4       :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
          IncrementePerTurn_elek_AXI4     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          ce_out                          :   OUT   std_logic;  -- ufix1
          rps                             :   OUT   std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          rps_AXI4                        :   OUT   std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          thete_el                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          thete_el_AXI4                   :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          theta_mech_AXI4                 :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          edge_rsvd                       :   OUT   std_logic;  -- ufix1
          count                           :   OUT   std_logic;  -- ufix1
          direction_AXI4                  :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IncreEncoder_V18_ipcore_src_IncreEncoder_V18
    USE ENTITY work.IncreEncoder_V18_ipcore_src_IncreEncoder_V18(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL A_sig                            : std_logic;  -- ufix1
  SIGNAL B_sig                            : std_logic;  -- ufix1
  SIGNAL I_sig                            : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL rps_sig                          : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL rps_AXI4_sig                     : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL thete_el_sig                     : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL thete_el_AXI4_sig                : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL theta_mech_AXI4_sig              : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL edge_rsvd_sig                    : std_logic;  -- ufix1
  SIGNAL count_sig                        : std_logic;  -- ufix1
  SIGNAL direction_AXI4_sig               : std_logic_vector(3 DOWNTO 0);  -- ufix4

BEGIN
  u_IncreEncoder_V18_ipcore_src_IncreEncoder_V18 : IncreEncoder_V18_ipcore_src_IncreEncoder_V18
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              A => A_sig,  -- ufix1
              B => B_sig,  -- ufix1
              I => I_sig,  -- ufix1
              PI2_Inc_AXI4 => PI2_Inc_AXI4,  -- ufix24_En24
              IncPerTurn_AXI4 => IncPerTurn_AXI4,  -- ufix16
              Timer_FPGA_ms_AXI4 => Timer_FPGA_ms_AXI4,  -- ufix30_En24
              IncPerTurn_mech_AXI4 => IncPerTurn_mech_AXI4,  -- ufix16
              Inc_PerTurn_mech_2PI_AXI4 => Inc_PerTurn_mech_2PI_AXI4,  -- ufix24_En24
              IncrementePerTurn_elek_AXI4 => IncrementePerTurn_elek_AXI4,  -- ufix16
              ce_out => ce_out_sig,  -- ufix1
              rps => rps_sig,  -- ufix30_En24
              rps_AXI4 => rps_AXI4_sig,  -- ufix30_En24
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

  rps <= rps_sig;

  rps_AXI4 <= rps_AXI4_sig;

  thete_el <= thete_el_sig;

  thete_el_AXI4 <= thete_el_AXI4_sig;

  theta_mech_AXI4 <= theta_mech_AXI4_sig;

  edge_rsvd <= edge_rsvd_sig;

  count <= count_sig;

  direction_AXI4 <= direction_AXI4_sig;

END rtl;

