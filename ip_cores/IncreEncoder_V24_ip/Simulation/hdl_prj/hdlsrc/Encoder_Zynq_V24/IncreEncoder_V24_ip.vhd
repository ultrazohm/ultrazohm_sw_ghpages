-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq_V24\IncreEncoder_V24_ip.vhd
-- Created: 2020-06-13 11:16:29
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V24_ip
-- Source Path: IncreEncoder_V24_ip
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V24_ip IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        A                                 :   IN    std_logic;  -- ufix1
        B                                 :   IN    std_logic;  -- ufix1
        I                                 :   IN    std_logic;  -- ufix1
        PeriodEnd                         :   IN    std_logic;  -- ufix1
        AXI4_Lite_ACLK                    :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARESETN                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_AWADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_AWVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_WDATA                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_WSTRB                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Lite_WVALID                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_BREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_ARVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_RREADY                  :   IN    std_logic;  -- ufix1
        omega                             :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix24
        theta_el                          :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix24
        position                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        edge_rsvd                         :   OUT   std_logic;  -- ufix1
        count                             :   OUT   std_logic;  -- ufix1
        OverSamplFactor                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END IncreEncoder_V24_ip;


ARCHITECTURE rtl OF IncreEncoder_V24_ip IS

  -- Component Declarations
  COMPONENT IncreEncoder_V24_ip_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI4_Lite_ACLK                  :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARESETN               :   IN    std_logic;  -- ufix1
          AXI4_Lite_AWADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_AWVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_WDATA                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_WSTRB                 :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Lite_WVALID                :   IN    std_logic;  -- ufix1
          AXI4_Lite_BREADY                :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_ARVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_RREADY                :   IN    std_logic;  -- ufix1
          read_ip_timestamp               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_omega_AXI4                 :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          read_direction_AXI4             :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
          read_theta_el_AXI4              :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          read_position_AXI4              :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          read_countPerPeriod_AXI4        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_Timer_FPGA_ms_AXI4        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En32
          write_PI2_Inc_AXI4              :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
          write_IncPerTurn_mech_AXI4      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          write_IncPerTurn_elek_AXI4      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          write_OmegaPerOverSampl_AXI4    :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT IncreEncoder_V24_ip_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          A                               :   IN    std_logic;  -- ufix1
          B                               :   IN    std_logic;  -- ufix1
          I                               :   IN    std_logic;  -- ufix1
          PI2_Inc_AXI4                    :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
          Timer_FPGA_ms_AXI4              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En32
          IncPerTurn_mech_AXI4            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          IncPerTurn_elek_AXI4            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          OmegaPerOverSampl_AXI4          :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          PeriodEnd                       :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          omega                           :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          omega_AXI4                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          theta_el                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          theta_el_AXI4                   :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
          position                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          position_AXI4                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          edge_rsvd                       :   OUT   std_logic;  -- ufix1
          count                           :   OUT   std_logic;  -- ufix1
          direction_AXI4                  :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4
          countPerPeriod_AXI4             :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16
          OverSamplFactor                 :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IncreEncoder_V24_ip_axi_lite
    USE ENTITY work.IncreEncoder_V24_ip_axi_lite(rtl);

  FOR ALL : IncreEncoder_V24_ip_dut
    USE ENTITY work.IncreEncoder_V24_ip_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL omega_AXI4_sig                   : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL direction_AXI4_sig               : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL theta_el_AXI4_sig                : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL position_AXI4_sig                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL countPerPeriod_AXI4_sig          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_axi_enable                 : std_logic;  -- ufix1
  SIGNAL write_Timer_FPGA_ms_AXI4         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_PI2_Inc_AXI4               : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL write_IncPerTurn_mech_AXI4       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL write_IncPerTurn_elek_AXI4       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL write_OmegaPerOverSampl_AXI4     : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL omega_sig                        : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL theta_el_sig                     : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL position_sig                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL edge_rsvd_sig                    : std_logic;  -- ufix1
  SIGNAL count_sig                        : std_logic;  -- ufix1
  SIGNAL OverSamplFactor_sig              : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_IncreEncoder_V24_ip_axi_lite_inst : IncreEncoder_V24_ip_axi_lite
    PORT MAP( reset => reset,
              AXI4_Lite_ACLK => AXI4_Lite_ACLK,  -- ufix1
              AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,  -- ufix1
              AXI4_Lite_AWADDR => AXI4_Lite_AWADDR,  -- ufix16
              AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,  -- ufix1
              AXI4_Lite_WDATA => AXI4_Lite_WDATA,  -- ufix32
              AXI4_Lite_WSTRB => AXI4_Lite_WSTRB,  -- ufix4
              AXI4_Lite_WVALID => AXI4_Lite_WVALID,  -- ufix1
              AXI4_Lite_BREADY => AXI4_Lite_BREADY,  -- ufix1
              AXI4_Lite_ARADDR => AXI4_Lite_ARADDR,  -- ufix16
              AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,  -- ufix1
              AXI4_Lite_RREADY => AXI4_Lite_RREADY,  -- ufix1
              read_ip_timestamp => std_logic_vector(ip_timestamp),  -- ufix32
              read_omega_AXI4 => omega_AXI4_sig,  -- sfix24_En11
              read_direction_AXI4 => direction_AXI4_sig,  -- sfix4
              read_theta_el_AXI4 => theta_el_AXI4_sig,  -- sfix24_En20
              read_position_AXI4 => position_AXI4_sig,  -- ufix16
              read_countPerPeriod_AXI4 => countPerPeriod_AXI4_sig,  -- sfix16
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              write_axi_enable => write_axi_enable,  -- ufix1
              write_Timer_FPGA_ms_AXI4 => write_Timer_FPGA_ms_AXI4,  -- ufix32_En32
              write_PI2_Inc_AXI4 => write_PI2_Inc_AXI4,  -- ufix24_En24
              write_IncPerTurn_mech_AXI4 => write_IncPerTurn_mech_AXI4,  -- ufix16
              write_IncPerTurn_elek_AXI4 => write_IncPerTurn_elek_AXI4,  -- ufix16
              write_OmegaPerOverSampl_AXI4 => write_OmegaPerOverSampl_AXI4,  -- sfix24_En11
              reset_internal => reset_internal  -- ufix1
              );

  u_IncreEncoder_V24_ip_dut_inst : IncreEncoder_V24_ip_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => write_axi_enable,  -- ufix1
              A => A,  -- ufix1
              B => B,  -- ufix1
              I => I,  -- ufix1
              PI2_Inc_AXI4 => write_PI2_Inc_AXI4,  -- ufix24_En24
              Timer_FPGA_ms_AXI4 => write_Timer_FPGA_ms_AXI4,  -- ufix32_En32
              IncPerTurn_mech_AXI4 => write_IncPerTurn_mech_AXI4,  -- ufix16
              IncPerTurn_elek_AXI4 => write_IncPerTurn_elek_AXI4,  -- ufix16
              OmegaPerOverSampl_AXI4 => write_OmegaPerOverSampl_AXI4,  -- sfix24_En11
              PeriodEnd => PeriodEnd,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              omega => omega_sig,  -- sfix24_En11
              omega_AXI4 => omega_AXI4_sig,  -- sfix24_En11
              theta_el => theta_el_sig,  -- sfix24_En20
              theta_el_AXI4 => theta_el_AXI4_sig,  -- sfix24_En20
              position => position_sig,  -- ufix16
              position_AXI4 => position_AXI4_sig,  -- ufix16
              edge_rsvd => edge_rsvd_sig,  -- ufix1
              count => count_sig,  -- ufix1
              direction_AXI4 => direction_AXI4_sig,  -- sfix4
              countPerPeriod_AXI4 => countPerPeriod_AXI4_sig,  -- sfix16
              OverSamplFactor => OverSamplFactor_sig  -- ufix16
              );

  ip_timestamp <= to_unsigned(2006131116, 32);

  reset_cm <=  NOT IPCORE_RESETN;

  reset <= reset_cm OR reset_internal;

  omega <= omega_sig;

  theta_el <= theta_el_sig;

  position <= position_sig;

  edge_rsvd <= edge_rsvd_sig;

  count <= count_sig;

  OverSamplFactor <= OverSamplFactor_sig;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;

