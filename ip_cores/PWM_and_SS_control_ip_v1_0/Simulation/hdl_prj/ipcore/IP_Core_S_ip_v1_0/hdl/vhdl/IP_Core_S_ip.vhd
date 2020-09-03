-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\IP_Core_S_ip.vhd
-- Created: 2018-10-01 12:51:05
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
-- Module: IP_Core_S_ip
-- Source Path: IP_Core_S_ip
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IP_Core_S_ip IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        m_u1_norm                         :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        m_u2_norm                         :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        m_u3_norm                         :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        SS0_IN_External                   :   IN    std_logic;  -- ufix1
        SS1_IN_External                   :   IN    std_logic;  -- ufix1
        SS2_IN_External                   :   IN    std_logic;  -- ufix1
        SS3_IN_External                   :   IN    std_logic;  -- ufix1
        SS4_IN_External                   :   IN    std_logic;  -- ufix1
        SS5_IN_External                   :   IN    std_logic;  -- ufix1
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
        SS0_OUT                           :   OUT   std_logic;  -- ufix1
        SS1_OUT                           :   OUT   std_logic;  -- ufix1
        SS2_OUT                           :   OUT   std_logic;  -- ufix1
        SS3_OUT                           :   OUT   std_logic;  -- ufix1
        SS4_OUT                           :   OUT   std_logic;  -- ufix1
        SS5_OUT                           :   OUT   std_logic;  -- ufix1
        PWM_enb_out                       :   OUT   std_logic;  -- ufix1
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END IP_Core_S_ip;


ARCHITECTURE rtl OF IP_Core_S_ip IS

  -- Component Declarations
  COMPONENT IP_Core_S_ip_axi_lite
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
          read_PWM_en_rd_AXI              :   IN    std_logic;  -- ufix1
          read_PWM_f_carrier_kHz_rd_AXI   :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          read_PWM_min_pulse_width_rd_AXI :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          read_Mode_rd_AXI                :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_PWM_en_AXI                :   OUT   std_logic;  -- ufix1
          write_Mode_AXI                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          write_PWM_f_carrier_kHz_AXI     :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_PWM_min_pulse_wiidth_AXI  :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_m_u1_norm_AXI             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          write_m_u2_norm_AXI             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          write_m_u3_norm_AXI             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT IP_Core_S_ip_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          PWM_en_AXI                      :   IN    std_logic;  -- ufix1
          Mode_AXI                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          PWM_f_carrier_kHz_AXI           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          PWM_min_pulse_wiidth_AXI        :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          m_u1_norm                       :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u2_norm                       :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u3_norm                       :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u1_norm_AXI                   :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u2_norm_AXI                   :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u3_norm_AXI                   :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          SS0_IN_External                 :   IN    std_logic;  -- ufix1
          SS1_IN_External                 :   IN    std_logic;  -- ufix1
          SS2_IN_External                 :   IN    std_logic;  -- ufix1
          SS3_IN_External                 :   IN    std_logic;  -- ufix1
          SS4_IN_External                 :   IN    std_logic;  -- ufix1
          SS5_IN_External                 :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          SS0_OUT                         :   OUT   std_logic;  -- ufix1
          SS1_OUT                         :   OUT   std_logic;  -- ufix1
          SS2_OUT                         :   OUT   std_logic;  -- ufix1
          SS3_OUT                         :   OUT   std_logic;  -- ufix1
          SS4_OUT                         :   OUT   std_logic;  -- ufix1
          SS5_OUT                         :   OUT   std_logic;  -- ufix1
          PWM_en_rd_AXI                   :   OUT   std_logic;  -- ufix1
          PWM_f_carrier_kHz_rd_AXI        :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          PWM_min_pulse_width_rd_AXI      :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          PWM_enb_out                     :   OUT   std_logic;  -- ufix1
          Mode_rd_AXI                     :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IP_Core_S_ip_axi_lite
    USE ENTITY work.IP_Core_S_ip_axi_lite(rtl);

  FOR ALL : IP_Core_S_ip_dut
    USE ENTITY work.IP_Core_S_ip_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL PWM_en_rd_AXI_sig                : std_logic;  -- ufix1
  SIGNAL PWM_f_carrier_kHz_rd_AXI_sig     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL PWM_min_pulse_width_rd_AXI_sig   : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL Mode_rd_AXI_sig                  : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_axi_enable                 : std_logic;  -- ufix1
  SIGNAL write_PWM_en_AXI                 : std_logic;  -- ufix1
  SIGNAL write_Mode_AXI                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_PWM_f_carrier_kHz_AXI      : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL write_PWM_min_pulse_wiidth_AXI   : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL write_m_u1_norm_AXI              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL write_m_u2_norm_AXI              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL write_m_u3_norm_AXI              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL SS0_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS1_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS2_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS3_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS4_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS5_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL PWM_enb_out_sig                  : std_logic;  -- ufix1

BEGIN
  u_IP_Core_S_ip_axi_lite_inst : IP_Core_S_ip_axi_lite
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
              read_PWM_en_rd_AXI => PWM_en_rd_AXI_sig,  -- ufix1
              read_PWM_f_carrier_kHz_rd_AXI => PWM_f_carrier_kHz_rd_AXI_sig,  -- ufix8
              read_PWM_min_pulse_width_rd_AXI => PWM_min_pulse_width_rd_AXI_sig,  -- ufix8
              read_Mode_rd_AXI => Mode_rd_AXI_sig,  -- ufix2
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              write_axi_enable => write_axi_enable,  -- ufix1
              write_PWM_en_AXI => write_PWM_en_AXI,  -- ufix1
              write_Mode_AXI => write_Mode_AXI,  -- ufix2
              write_PWM_f_carrier_kHz_AXI => write_PWM_f_carrier_kHz_AXI,  -- ufix8
              write_PWM_min_pulse_wiidth_AXI => write_PWM_min_pulse_wiidth_AXI,  -- ufix8
              write_m_u1_norm_AXI => write_m_u1_norm_AXI,  -- sfix14_En12
              write_m_u2_norm_AXI => write_m_u2_norm_AXI,  -- sfix14_En12
              write_m_u3_norm_AXI => write_m_u3_norm_AXI,  -- sfix14_En12
              reset_internal => reset_internal  -- ufix1
              );

  u_IP_Core_S_ip_dut_inst : IP_Core_S_ip_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => write_axi_enable,  -- ufix1
              PWM_en_AXI => write_PWM_en_AXI,  -- ufix1
              Mode_AXI => write_Mode_AXI,  -- ufix2
              PWM_f_carrier_kHz_AXI => write_PWM_f_carrier_kHz_AXI,  -- ufix8
              PWM_min_pulse_wiidth_AXI => write_PWM_min_pulse_wiidth_AXI,  -- ufix8
              m_u1_norm => m_u1_norm,  -- sfix14_En12
              m_u2_norm => m_u2_norm,  -- sfix14_En12
              m_u3_norm => m_u3_norm,  -- sfix14_En12
              m_u1_norm_AXI => write_m_u1_norm_AXI,  -- sfix14_En12
              m_u2_norm_AXI => write_m_u2_norm_AXI,  -- sfix14_En12
              m_u3_norm_AXI => write_m_u3_norm_AXI,  -- sfix14_En12
              SS0_IN_External => SS0_IN_External,  -- ufix1
              SS1_IN_External => SS1_IN_External,  -- ufix1
              SS2_IN_External => SS2_IN_External,  -- ufix1
              SS3_IN_External => SS3_IN_External,  -- ufix1
              SS4_IN_External => SS4_IN_External,  -- ufix1
              SS5_IN_External => SS5_IN_External,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              SS0_OUT => SS0_OUT_sig,  -- ufix1
              SS1_OUT => SS1_OUT_sig,  -- ufix1
              SS2_OUT => SS2_OUT_sig,  -- ufix1
              SS3_OUT => SS3_OUT_sig,  -- ufix1
              SS4_OUT => SS4_OUT_sig,  -- ufix1
              SS5_OUT => SS5_OUT_sig,  -- ufix1
              PWM_en_rd_AXI => PWM_en_rd_AXI_sig,  -- ufix1
              PWM_f_carrier_kHz_rd_AXI => PWM_f_carrier_kHz_rd_AXI_sig,  -- ufix8
              PWM_min_pulse_width_rd_AXI => PWM_min_pulse_width_rd_AXI_sig,  -- ufix8
              PWM_enb_out => PWM_enb_out_sig,  -- ufix1
              Mode_rd_AXI => Mode_rd_AXI_sig  -- ufix2
              );

  ip_timestamp <= to_unsigned(1810011250, 32);

  reset_cm <=  NOT IPCORE_RESETN;

  reset <= reset_cm OR reset_internal;

  SS0_OUT <= SS0_OUT_sig;

  SS1_OUT <= SS1_OUT_sig;

  SS2_OUT <= SS2_OUT_sig;

  SS3_OUT <= SS3_OUT_sig;

  SS4_OUT <= SS4_OUT_sig;

  SS5_OUT <= SS5_OUT_sig;

  PWM_enb_out <= PWM_enb_out_sig;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;

