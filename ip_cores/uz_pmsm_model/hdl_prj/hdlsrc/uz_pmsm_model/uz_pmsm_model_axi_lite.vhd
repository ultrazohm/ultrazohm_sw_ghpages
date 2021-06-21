-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_pmsm_model/uz_pmsm_model_axi_lite.vhd
-- Created: 2021-06-21 14:13:51
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_pmsm_model_axi_lite
-- Source Path: uz_pmsm_model/uz_pmsm_model_axi_lite
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_pmsm_model_axi_lite IS
  PORT( reset                             :   IN    std_logic;
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
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_i_d                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_i_q                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_omega_mech                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_torque                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic;  -- ufix1
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_u_d                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_u_q                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_mu                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_M_n0                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_reset_integrators           :   OUT   std_logic;  -- ufix1
        write_R1                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_polepairs                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_psi_pm                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_recirprocal_L_d             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_reciprocal_L_q              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_in_omega_mech               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_simulate_mechanical         :   OUT   std_logic;  -- ufix1
        write_reciprocal_J                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        reset_internal                    :   OUT   std_logic  -- ufix1
        );
END uz_pmsm_model_axi_lite;


ARCHITECTURE rtl OF uz_pmsm_model_axi_lite IS

  -- Component Declarations
  COMPONENT uz_pmsm_model_addr_decoder
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          data_write                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   IN    std_logic;  -- ufix1
          rd_enb                          :   IN    std_logic;  -- ufix1
          read_ip_timestamp               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_i_d                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_i_q                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_omega_mech                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_torque                     :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          data_read                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_u_d                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_u_q                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_mu                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_M_n0                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_reset_integrators         :   OUT   std_logic;  -- ufix1
          write_R1                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_polepairs                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_psi_pm                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_recirprocal_L_d           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_reciprocal_L_q            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_in_omega_mech             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_simulate_mechanical       :   OUT   std_logic;  -- ufix1
          write_reciprocal_J              :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  COMPONENT uz_pmsm_model_axi_lite_module
    PORT( clk                             :   IN    std_logic;  -- ufix1
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
          data_read                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          data_write                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   OUT   std_logic;  -- ufix1
          rd_enb                          :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_pmsm_model_addr_decoder
    USE ENTITY work.uz_pmsm_model_addr_decoder(rtl);

  FOR ALL : uz_pmsm_model_axi_lite_module
    USE ENTITY work.uz_pmsm_model_axi_lite_module(rtl);

  -- Signals
  SIGNAL top_data_write                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL top_addr_sel                     : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL top_wr_enb                       : std_logic;  -- ufix1
  SIGNAL top_rd_enb                       : std_logic;  -- ufix1
  SIGNAL top_data_read                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_u_d_tmp                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_u_q_tmp                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_mu_tmp                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_M_n0_tmp                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_R1_tmp                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_polepairs_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_psi_pm_tmp                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_recirprocal_L_d_tmp        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_reciprocal_L_q_tmp         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_in_omega_mech_tmp          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_reciprocal_J_tmp           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL top_reset_internal               : std_logic;  -- ufix1

BEGIN
  u_uz_pmsm_model_addr_decoder_inst : uz_pmsm_model_addr_decoder
    PORT MAP( clk => AXI4_Lite_ACLK,  -- ufix1
              reset => reset,
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              read_ip_timestamp => read_ip_timestamp,  -- ufix32
              read_i_d => read_i_d,  -- ufix32
              read_i_q => read_i_q,  -- ufix32
              read_omega_mech => read_omega_mech,  -- ufix32
              read_torque => read_torque,  -- ufix32
              data_read => top_data_read,  -- ufix32
              write_axi_enable => write_axi_enable,  -- ufix1
              write_u_d => write_u_d_tmp,  -- ufix32
              write_u_q => write_u_q_tmp,  -- ufix32
              write_mu => write_mu_tmp,  -- ufix32
              write_M_n0 => write_M_n0_tmp,  -- ufix32
              write_reset_integrators => write_reset_integrators,  -- ufix1
              write_R1 => write_R1_tmp,  -- ufix32
              write_polepairs => write_polepairs_tmp,  -- ufix32
              write_psi_pm => write_psi_pm_tmp,  -- ufix32
              write_recirprocal_L_d => write_recirprocal_L_d_tmp,  -- ufix32
              write_reciprocal_L_q => write_reciprocal_L_q_tmp,  -- ufix32
              write_in_omega_mech => write_in_omega_mech_tmp,  -- ufix32
              write_simulate_mechanical => write_simulate_mechanical,  -- ufix1
              write_reciprocal_J => write_reciprocal_J_tmp  -- ufix32
              );

  u_uz_pmsm_model_axi_lite_module_inst : uz_pmsm_model_axi_lite_module
    PORT MAP( clk => AXI4_Lite_ACLK,  -- ufix1
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
              data_read => top_data_read,  -- ufix32
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              reset_internal => top_reset_internal  -- ufix1
              );

  reset_internal <= top_reset_internal;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

  write_u_d <= write_u_d_tmp;

  write_u_q <= write_u_q_tmp;

  write_mu <= write_mu_tmp;

  write_M_n0 <= write_M_n0_tmp;

  write_R1 <= write_R1_tmp;

  write_polepairs <= write_polepairs_tmp;

  write_psi_pm <= write_psi_pm_tmp;

  write_recirprocal_L_d <= write_recirprocal_L_d_tmp;

  write_reciprocal_L_q <= write_reciprocal_L_q_tmp;

  write_in_omega_mech <= write_in_omega_mech_tmp;

  write_reciprocal_J <= write_reciprocal_J_tmp;

END rtl;

