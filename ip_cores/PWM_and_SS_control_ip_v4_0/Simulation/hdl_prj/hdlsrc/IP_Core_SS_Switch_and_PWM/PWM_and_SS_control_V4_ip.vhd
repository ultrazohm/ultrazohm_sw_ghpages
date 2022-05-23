-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V4_ip.vhd
-- Created: 2022-05-09 15:08:17
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
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
-- Module: PWM_and_SS_control_V4_ip
-- Source Path: PWM_and_SS_control_V4_ip
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_V4_ip IS
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
        triangle_in                       :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18
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
        Triangular_Max                    :   OUT   std_logic;  -- ufix1
        Triangular_Min                    :   OUT   std_logic;  -- ufix1
        triangle_out                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- ufix18
        dir_out                           :   OUT   std_logic;  -- ufix1
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END PWM_and_SS_control_V4_ip;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip IS

  -- Component Declarations
  COMPONENT PWM_and_SS_control_V4_ip_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_axi_lite
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
          read_PWM_f_carrier_kHz_rd_AXI   :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
          read_PWM_T_carrier_us_rd_AXI    :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          read_PWM_min_pulse_width_rd_AXI :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
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
          write_Scal_f_carrier_AXI        :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
          write_Scal_T_carrier_AXI        :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          write_PWM_min_pulse_width_AXI   :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          write_m_u1_norm_AXI             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          write_m_u2_norm_AXI             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          write_m_u3_norm_AXI             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          write_TriState_HB1_AXI          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          write_TriState_HB2_AXI          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          write_TriState_HB3_AXI          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          write_count_src_ext_AXI         :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT PWM_and_SS_control_V4_ip_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          PWM_en_AXI                      :   IN    std_logic;  -- ufix1
          Mode_AXI                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          Scal_f_carrier_AXI              :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
          Scal_T_carrier_AXI              :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          PWM_min_pulse_width_AXI         :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
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
          TriState_HB1_AXI                :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          TriState_HB2_AXI                :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          TriState_HB3_AXI                :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          triangle_in                     :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
          count_src_ext_AXI               :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          SS0_OUT                         :   OUT   std_logic;  -- ufix1
          SS1_OUT                         :   OUT   std_logic;  -- ufix1
          SS2_OUT                         :   OUT   std_logic;  -- ufix1
          SS3_OUT                         :   OUT   std_logic;  -- ufix1
          SS4_OUT                         :   OUT   std_logic;  -- ufix1
          SS5_OUT                         :   OUT   std_logic;  -- ufix1
          PWM_en_rd_AXI                   :   OUT   std_logic;  -- ufix1
          PWM_f_carrier_kHz_rd_AXI        :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
          PWM_T_carrier_us_rd_AXI         :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          PWM_min_pulse_width_rd_AXI      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          PWM_enb_out                     :   OUT   std_logic;  -- ufix1
          Mode_rd_AXI                     :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          Triangular_Max                  :   OUT   std_logic;  -- ufix1
          Triangular_Min                  :   OUT   std_logic;  -- ufix1
          triangle_out                    :   OUT   std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
          dir_out                         :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : PWM_and_SS_control_V4_ip_reset_sync
    USE ENTITY work.PWM_and_SS_control_V4_ip_reset_sync(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_axi_lite
    USE ENTITY work.PWM_and_SS_control_V4_ip_axi_lite(rtl);

  FOR ALL : PWM_and_SS_control_V4_ip_dut
    USE ENTITY work.PWM_and_SS_control_V4_ip_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL m_u1_norm_unsigned               : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL m_u1_norm_sig                    : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL m_u2_norm_unsigned               : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL m_u2_norm_sig                    : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL m_u3_norm_unsigned               : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL m_u3_norm_sig                    : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL triangle_in_unsigned             : unsigned(17 DOWNTO 0);  -- ufix18
  SIGNAL triangle_in_sig                  : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL reset_before_sync                : std_logic;  -- ufix1
  SIGNAL PWM_en_rd_AXI_sig                : std_logic;  -- ufix1
  SIGNAL PWM_f_carrier_kHz_rd_AXI_sig     : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL PWM_T_carrier_us_rd_AXI_sig      : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL PWM_min_pulse_width_rd_AXI_sig   : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Mode_rd_AXI_sig                  : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_axi_enable                 : std_logic;  -- ufix1
  SIGNAL write_PWM_en_AXI                 : std_logic;  -- ufix1
  SIGNAL write_Mode_AXI                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_Scal_f_carrier_AXI         : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL write_Scal_T_carrier_AXI         : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL write_PWM_min_pulse_width_AXI    : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL write_m_u1_norm_AXI              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL write_m_u2_norm_AXI              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL write_m_u3_norm_AXI              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL write_TriState_HB1_AXI           : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_TriState_HB2_AXI           : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_TriState_HB3_AXI           : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_count_src_ext_AXI          : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL SS0_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS1_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS2_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS3_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS4_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS5_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL PWM_enb_out_sig                  : std_logic;  -- ufix1
  SIGNAL Triangular_Max_sig               : std_logic;  -- ufix1
  SIGNAL Triangular_Min_sig               : std_logic;  -- ufix1
  SIGNAL triangle_out_sig                 : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL dir_out_sig                      : std_logic;  -- ufix1
  SIGNAL triangle_out_sig_unsigned        : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL triangle_out_tmp                 : unsigned(17 DOWNTO 0);  -- ufix18

BEGIN
  u_PWM_and_SS_control_V4_ip_reset_sync_inst : PWM_and_SS_control_V4_ip_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_before_sync,  -- ufix1
              reset_out => reset
              );

  u_PWM_and_SS_control_V4_ip_axi_lite_inst : PWM_and_SS_control_V4_ip_axi_lite
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
              read_PWM_f_carrier_kHz_rd_AXI => PWM_f_carrier_kHz_rd_AXI_sig,  -- ufix25_En26
              read_PWM_T_carrier_us_rd_AXI => PWM_T_carrier_us_rd_AXI_sig,  -- ufix25
              read_PWM_min_pulse_width_rd_AXI => PWM_min_pulse_width_rd_AXI_sig,  -- sfix18_En16
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
              write_Scal_f_carrier_AXI => write_Scal_f_carrier_AXI,  -- ufix25_En26
              write_Scal_T_carrier_AXI => write_Scal_T_carrier_AXI,  -- ufix25
              write_PWM_min_pulse_width_AXI => write_PWM_min_pulse_width_AXI,  -- sfix18_En16
              write_m_u1_norm_AXI => write_m_u1_norm_AXI,  -- sfix14_En12
              write_m_u2_norm_AXI => write_m_u2_norm_AXI,  -- sfix14_En12
              write_m_u3_norm_AXI => write_m_u3_norm_AXI,  -- sfix14_En12
              write_TriState_HB1_AXI => write_TriState_HB1_AXI,  -- ufix2
              write_TriState_HB2_AXI => write_TriState_HB2_AXI,  -- ufix2
              write_TriState_HB3_AXI => write_TriState_HB3_AXI,  -- ufix2
              write_count_src_ext_AXI => write_count_src_ext_AXI,  -- ufix1
              reset_internal => reset_internal  -- ufix1
              );

  u_PWM_and_SS_control_V4_ip_dut_inst : PWM_and_SS_control_V4_ip_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => write_axi_enable,  -- ufix1
              PWM_en_AXI => write_PWM_en_AXI,  -- ufix1
              Mode_AXI => write_Mode_AXI,  -- ufix2
              Scal_f_carrier_AXI => write_Scal_f_carrier_AXI,  -- ufix25_En26
              Scal_T_carrier_AXI => write_Scal_T_carrier_AXI,  -- ufix25
              PWM_min_pulse_width_AXI => write_PWM_min_pulse_width_AXI,  -- sfix18_En16
              m_u1_norm => std_logic_vector(m_u1_norm_sig),  -- sfix14_En12
              m_u2_norm => std_logic_vector(m_u2_norm_sig),  -- sfix14_En12
              m_u3_norm => std_logic_vector(m_u3_norm_sig),  -- sfix14_En12
              m_u1_norm_AXI => write_m_u1_norm_AXI,  -- sfix14_En12
              m_u2_norm_AXI => write_m_u2_norm_AXI,  -- sfix14_En12
              m_u3_norm_AXI => write_m_u3_norm_AXI,  -- sfix14_En12
              SS0_IN_External => SS0_IN_External,  -- ufix1
              SS1_IN_External => SS1_IN_External,  -- ufix1
              SS2_IN_External => SS2_IN_External,  -- ufix1
              SS3_IN_External => SS3_IN_External,  -- ufix1
              SS4_IN_External => SS4_IN_External,  -- ufix1
              SS5_IN_External => SS5_IN_External,  -- ufix1
              TriState_HB1_AXI => write_TriState_HB1_AXI,  -- ufix2
              TriState_HB2_AXI => write_TriState_HB2_AXI,  -- ufix2
              TriState_HB3_AXI => write_TriState_HB3_AXI,  -- ufix2
              triangle_in => std_logic_vector(triangle_in_sig),  -- ufix18_En17
              count_src_ext_AXI => write_count_src_ext_AXI,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              SS0_OUT => SS0_OUT_sig,  -- ufix1
              SS1_OUT => SS1_OUT_sig,  -- ufix1
              SS2_OUT => SS2_OUT_sig,  -- ufix1
              SS3_OUT => SS3_OUT_sig,  -- ufix1
              SS4_OUT => SS4_OUT_sig,  -- ufix1
              SS5_OUT => SS5_OUT_sig,  -- ufix1
              PWM_en_rd_AXI => PWM_en_rd_AXI_sig,  -- ufix1
              PWM_f_carrier_kHz_rd_AXI => PWM_f_carrier_kHz_rd_AXI_sig,  -- ufix25_En26
              PWM_T_carrier_us_rd_AXI => PWM_T_carrier_us_rd_AXI_sig,  -- ufix25
              PWM_min_pulse_width_rd_AXI => PWM_min_pulse_width_rd_AXI_sig,  -- sfix18_En16
              PWM_enb_out => PWM_enb_out_sig,  -- ufix1
              Mode_rd_AXI => Mode_rd_AXI_sig,  -- ufix2
              Triangular_Max => Triangular_Max_sig,  -- ufix1
              Triangular_Min => Triangular_Min_sig,  -- ufix1
              triangle_out => triangle_out_sig,  -- ufix18_En17
              dir_out => dir_out_sig  -- ufix1
              );

  ip_timestamp <= unsigned'(X"836F06B4");

  reset_cm <=  NOT IPCORE_RESETN;

  m_u1_norm_unsigned <= unsigned(m_u1_norm);

  m_u1_norm_sig <= signed(m_u1_norm_unsigned);

  m_u2_norm_unsigned <= unsigned(m_u2_norm);

  m_u2_norm_sig <= signed(m_u2_norm_unsigned);

  m_u3_norm_unsigned <= unsigned(m_u3_norm);

  m_u3_norm_sig <= signed(m_u3_norm_unsigned);

  triangle_in_unsigned <= unsigned(triangle_in);

  triangle_in_sig <= triangle_in_unsigned;

  reset_before_sync <= reset_cm OR reset_internal;

  triangle_out_sig_unsigned <= unsigned(triangle_out_sig);

  triangle_out_tmp <= triangle_out_sig_unsigned;

  triangle_out <= std_logic_vector(triangle_out_tmp);

  SS0_OUT <= SS0_OUT_sig;

  SS1_OUT <= SS1_OUT_sig;

  SS2_OUT <= SS2_OUT_sig;

  SS3_OUT <= SS3_OUT_sig;

  SS4_OUT <= SS4_OUT_sig;

  SS5_OUT <= SS5_OUT_sig;

  PWM_enb_out <= PWM_enb_out_sig;

  Triangular_Max <= Triangular_Max_sig;

  Triangular_Min <= Triangular_Min_sig;

  dir_out <= dir_out_sig;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;

