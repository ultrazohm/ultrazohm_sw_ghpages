-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph.vhd
-- Created: 2022-05-17 08:28:53
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
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
-- Module: uz_inverter_3ph
-- Source Path: uz_inverter_3ph
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_inverter_3ph_pkg.ALL;

ENTITY uz_inverter_3ph IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        i_abc_pl_0                        :   IN    std_logic_vector(74 DOWNTO 0);  -- ufix75
        gate_pl_0                         :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        AXI4_ACLK                         :   IN    std_logic;  -- ufix1
        AXI4_ARESETN                      :   IN    std_logic;  -- ufix1
        AXI4_AWID                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        AXI4_AWADDR                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_AWLEN                        :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI4_AWSIZE                       :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_AWBURST                      :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_AWLOCK                       :   IN    std_logic;  -- ufix1
        AXI4_AWCACHE                      :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_AWPROT                       :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_AWVALID                      :   IN    std_logic;  -- ufix1
        AXI4_WDATA                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_WSTRB                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_WLAST                        :   IN    std_logic;  -- ufix1
        AXI4_WVALID                       :   IN    std_logic;  -- ufix1
        AXI4_BREADY                       :   IN    std_logic;  -- ufix1
        AXI4_ARID                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        AXI4_ARADDR                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_ARLEN                        :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI4_ARSIZE                       :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_ARBURST                      :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_ARLOCK                       :   IN    std_logic;  -- ufix1
        AXI4_ARCACHE                      :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_ARPROT                       :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_ARVALID                      :   IN    std_logic;  -- ufix1
        AXI4_RREADY                       :   IN    std_logic;  -- ufix1
        u_abc_pl_0                        :   OUT   std_logic_vector(74 DOWNTO 0);  -- ufix75
        AXI4_AWREADY                      :   OUT   std_logic;  -- ufix1
        AXI4_WREADY                       :   OUT   std_logic;  -- ufix1
        AXI4_BID                          :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        AXI4_BRESP                        :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_BVALID                       :   OUT   std_logic;  -- ufix1
        AXI4_ARREADY                      :   OUT   std_logic;  -- ufix1
        AXI4_RID                          :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        AXI4_RDATA                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_RRESP                        :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_RLAST                        :   OUT   std_logic;  -- ufix1
        AXI4_RVALID                       :   OUT   std_logic  -- ufix1
        );
END uz_inverter_3ph;


ARCHITECTURE rtl OF uz_inverter_3ph IS

  -- Component Declarations
  COMPONENT uz_inverter_3ph_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_inverter_3ph_axi4
    PORT( reset                           :   IN    std_logic;
          AXI4_ACLK                       :   IN    std_logic;  -- ufix1
          AXI4_ARESETN                    :   IN    std_logic;  -- ufix1
          AXI4_AWID                       :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          AXI4_AWADDR                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_AWLEN                      :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          AXI4_AWSIZE                     :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_AWBURST                    :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_AWLOCK                     :   IN    std_logic;  -- ufix1
          AXI4_AWCACHE                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_AWPROT                     :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_AWVALID                    :   IN    std_logic;  -- ufix1
          AXI4_WDATA                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_WSTRB                      :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_WLAST                      :   IN    std_logic;  -- ufix1
          AXI4_WVALID                     :   IN    std_logic;  -- ufix1
          AXI4_BREADY                     :   IN    std_logic;  -- ufix1
          AXI4_ARID                       :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          AXI4_ARADDR                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_ARLEN                      :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          AXI4_ARSIZE                     :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_ARBURST                    :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_ARLOCK                     :   IN    std_logic;  -- ufix1
          AXI4_ARCACHE                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_ARPROT                     :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_ARVALID                    :   IN    std_logic;  -- ufix1
          AXI4_RREADY                     :   IN    std_logic;  -- ufix1
          read_ip_timestamp               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_u_abc_ps                   :   IN    vector_of_std_logic_vector32(0 TO 2);  -- ufix32 [3]
          AXI4_AWREADY                    :   OUT   std_logic;  -- ufix1
          AXI4_WREADY                     :   OUT   std_logic;  -- ufix1
          AXI4_BID                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
          AXI4_BRESP                      :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_BVALID                     :   OUT   std_logic;  -- ufix1
          AXI4_ARREADY                    :   OUT   std_logic;  -- ufix1
          AXI4_RID                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
          AXI4_RDATA                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_RRESP                      :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_RLAST                      :   OUT   std_logic;  -- ufix1
          AXI4_RVALID                     :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_switch_pspl_abc           :   OUT   std_logic;  -- ufix1
          write_switch_pspl_gate          :   OUT   std_logic;  -- ufix1
          write_u_dc                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_i_abc_ps                  :   OUT   vector_of_std_logic_vector32(0 TO 2);  -- ufix32 [3]
          write_gate_ps                   :   OUT   std_logic_vector(0 TO 5);  -- ufix1 [6]
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT uz_inverter_3ph_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
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
  FOR ALL : uz_inverter_3ph_reset_sync
    USE ENTITY work.uz_inverter_3ph_reset_sync(rtl);

  FOR ALL : uz_inverter_3ph_axi4
    USE ENTITY work.uz_inverter_3ph_axi4(rtl);

  FOR ALL : uz_inverter_3ph_dut
    USE ENTITY work.uz_inverter_3ph_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL i_abc_pl_0_unsigned              : unsigned(74 DOWNTO 0);  -- ufix75
  SIGNAL i_abc_pl_0_slice                 : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL i_abc_pl_0_sig                   : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL i_abc_pl_0_slice_1               : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL i_abc_pl_1_sig                   : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL i_abc_pl_0_slice_2               : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL i_abc_pl_2_sig                   : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL gate_pl_0_unsigned               : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL gate_pl_0_slice                  : std_logic;  -- ufix1
  SIGNAL gate_pl_0_slice_1                : std_logic;  -- ufix1
  SIGNAL gate_pl_0_slice_2                : std_logic;  -- ufix1
  SIGNAL gate_pl_0_slice_3                : std_logic;  -- ufix1
  SIGNAL gate_pl_0_slice_4                : std_logic;  -- ufix1
  SIGNAL gate_pl_0_slice_5                : std_logic;  -- ufix1
  SIGNAL write_gate_ps                    : std_logic_vector(0 TO 5);  -- ufix1 [6]
  SIGNAL write_i_abc_ps_unsigned          : vector_of_std_logic_vector32(0 TO 2);  -- ufix32 [3]
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL reset_before_sync                : std_logic;  -- ufix1
  SIGNAL read_u_abc_ps_vec                : vector_of_std_logic_vector32(0 TO 2);  -- ufix32 [3]
  SIGNAL AXI4_BID_tmp                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL AXI4_BRESP_tmp                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_RID_tmp                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL AXI4_RDATA_tmp                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_RRESP_tmp                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_axi_enable                 : std_logic;  -- ufix1
  SIGNAL write_switch_pspl_abc            : std_logic;  -- ufix1
  SIGNAL write_switch_pspl_gate           : std_logic;  -- ufix1
  SIGNAL write_u_dc                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL u_abc_pl_0_sig                   : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL u_abc_pl_1_sig                   : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL u_abc_pl_2_sig                   : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL u_abc_pl_2_sig_signed            : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL u_abc_pl_1_sig_signed            : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL u_abc_pl_0_sig_signed            : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL u_abc_pl_0_tmp                   : unsigned(74 DOWNTO 0);  -- ufix75

BEGIN
  u_uz_inverter_3ph_reset_sync_inst : uz_inverter_3ph_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_before_sync,  -- ufix1
              reset_out => reset
              );

  u_uz_inverter_3ph_axi4_inst : uz_inverter_3ph_axi4
    PORT MAP( reset => reset,
              AXI4_ACLK => AXI4_ACLK,  -- ufix1
              AXI4_ARESETN => AXI4_ARESETN,  -- ufix1
              AXI4_AWID => AXI4_AWID,  -- ufix12
              AXI4_AWADDR => AXI4_AWADDR,  -- ufix16
              AXI4_AWLEN => AXI4_AWLEN,  -- ufix8
              AXI4_AWSIZE => AXI4_AWSIZE,  -- ufix3
              AXI4_AWBURST => AXI4_AWBURST,  -- ufix2
              AXI4_AWLOCK => AXI4_AWLOCK,  -- ufix1
              AXI4_AWCACHE => AXI4_AWCACHE,  -- ufix4
              AXI4_AWPROT => AXI4_AWPROT,  -- ufix3
              AXI4_AWVALID => AXI4_AWVALID,  -- ufix1
              AXI4_WDATA => AXI4_WDATA,  -- ufix32
              AXI4_WSTRB => AXI4_WSTRB,  -- ufix4
              AXI4_WLAST => AXI4_WLAST,  -- ufix1
              AXI4_WVALID => AXI4_WVALID,  -- ufix1
              AXI4_BREADY => AXI4_BREADY,  -- ufix1
              AXI4_ARID => AXI4_ARID,  -- ufix12
              AXI4_ARADDR => AXI4_ARADDR,  -- ufix16
              AXI4_ARLEN => AXI4_ARLEN,  -- ufix8
              AXI4_ARSIZE => AXI4_ARSIZE,  -- ufix3
              AXI4_ARBURST => AXI4_ARBURST,  -- ufix2
              AXI4_ARLOCK => AXI4_ARLOCK,  -- ufix1
              AXI4_ARCACHE => AXI4_ARCACHE,  -- ufix4
              AXI4_ARPROT => AXI4_ARPROT,  -- ufix3
              AXI4_ARVALID => AXI4_ARVALID,  -- ufix1
              AXI4_RREADY => AXI4_RREADY,  -- ufix1
              read_ip_timestamp => std_logic_vector(ip_timestamp),  -- ufix32
              read_u_abc_ps => read_u_abc_ps_vec,  -- ufix32 [3]
              AXI4_AWREADY => AXI4_AWREADY,  -- ufix1
              AXI4_WREADY => AXI4_WREADY,  -- ufix1
              AXI4_BID => AXI4_BID_tmp,  -- ufix12
              AXI4_BRESP => AXI4_BRESP_tmp,  -- ufix2
              AXI4_BVALID => AXI4_BVALID,  -- ufix1
              AXI4_ARREADY => AXI4_ARREADY,  -- ufix1
              AXI4_RID => AXI4_RID_tmp,  -- ufix12
              AXI4_RDATA => AXI4_RDATA_tmp,  -- ufix32
              AXI4_RRESP => AXI4_RRESP_tmp,  -- ufix2
              AXI4_RLAST => AXI4_RLAST,  -- ufix1
              AXI4_RVALID => AXI4_RVALID,  -- ufix1
              write_axi_enable => write_axi_enable,  -- ufix1
              write_switch_pspl_abc => write_switch_pspl_abc,  -- ufix1
              write_switch_pspl_gate => write_switch_pspl_gate,  -- ufix1
              write_u_dc => write_u_dc,  -- ufix32
              write_i_abc_ps => write_i_abc_ps_unsigned,  -- ufix32 [3]
              write_gate_ps => write_gate_ps,  -- ufix1 [6]
              reset_internal => reset_internal  -- ufix1
              );

  u_uz_inverter_3ph_dut_inst : uz_inverter_3ph_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => write_axi_enable,  -- ufix1
              switch_pspl_abc => write_switch_pspl_abc,  -- ufix1
              switch_pspl_gate => write_switch_pspl_gate,  -- ufix1
              i_abc_ps_0 => write_i_abc_ps_unsigned(0),  -- ufix32
              i_abc_ps_1 => write_i_abc_ps_unsigned(1),  -- ufix32
              i_abc_ps_2 => write_i_abc_ps_unsigned(2),  -- ufix32
              i_abc_pl_0 => std_logic_vector(i_abc_pl_0_sig),  -- sfix25_En12
              i_abc_pl_1 => std_logic_vector(i_abc_pl_1_sig),  -- sfix25_En12
              i_abc_pl_2 => std_logic_vector(i_abc_pl_2_sig),  -- sfix25_En12
              gate_ps_0 => write_gate_ps(0),  -- ufix1
              gate_ps_1 => write_gate_ps(1),  -- ufix1
              gate_ps_2 => write_gate_ps(2),  -- ufix1
              gate_ps_3 => write_gate_ps(3),  -- ufix1
              gate_ps_4 => write_gate_ps(4),  -- ufix1
              gate_ps_5 => write_gate_ps(5),  -- ufix1
              gate_pl_0 => gate_pl_0_slice,  -- ufix1
              gate_pl_1 => gate_pl_0_slice_1,  -- ufix1
              gate_pl_2 => gate_pl_0_slice_2,  -- ufix1
              gate_pl_3 => gate_pl_0_slice_3,  -- ufix1
              gate_pl_4 => gate_pl_0_slice_4,  -- ufix1
              gate_pl_5 => gate_pl_0_slice_5,  -- ufix1
              u_dc => write_u_dc,  -- ufix32
              ce_out => ce_out_sig,  -- ufix1
              u_abc_ps_0 => read_u_abc_ps_vec(0),  -- ufix32
              u_abc_ps_1 => read_u_abc_ps_vec(1),  -- ufix32
              u_abc_ps_2 => read_u_abc_ps_vec(2),  -- ufix32
              u_abc_pl_0 => u_abc_pl_0_sig,  -- sfix25_En12
              u_abc_pl_1 => u_abc_pl_1_sig,  -- sfix25_En12
              u_abc_pl_2 => u_abc_pl_2_sig  -- sfix25_En12
              );

  ip_timestamp <= unsigned'(X"83703C8C");

  reset_cm <=  NOT IPCORE_RESETN;

  i_abc_pl_0_unsigned <= unsigned(i_abc_pl_0);

  i_abc_pl_0_slice <= i_abc_pl_0_unsigned(24 DOWNTO 0);

  i_abc_pl_0_sig <= signed(i_abc_pl_0_slice);

  i_abc_pl_0_slice_1 <= i_abc_pl_0_unsigned(49 DOWNTO 25);

  i_abc_pl_1_sig <= signed(i_abc_pl_0_slice_1);

  i_abc_pl_0_slice_2 <= i_abc_pl_0_unsigned(74 DOWNTO 50);

  i_abc_pl_2_sig <= signed(i_abc_pl_0_slice_2);

  gate_pl_0_unsigned <= unsigned(gate_pl_0);

  gate_pl_0_slice <= gate_pl_0_unsigned(0);

  gate_pl_0_slice_1 <= gate_pl_0_unsigned(1);

  gate_pl_0_slice_2 <= gate_pl_0_unsigned(2);

  gate_pl_0_slice_3 <= gate_pl_0_unsigned(3);

  gate_pl_0_slice_4 <= gate_pl_0_unsigned(4);

  gate_pl_0_slice_5 <= gate_pl_0_unsigned(5);

  reset_before_sync <= reset_cm OR reset_internal;


  u_abc_pl_2_sig_signed <= signed(u_abc_pl_2_sig);

  u_abc_pl_1_sig_signed <= signed(u_abc_pl_1_sig);

  u_abc_pl_0_sig_signed <= signed(u_abc_pl_0_sig);

  u_abc_pl_0_tmp <= unsigned(u_abc_pl_2_sig_signed) & unsigned(u_abc_pl_1_sig_signed) & unsigned(u_abc_pl_0_sig_signed);

  u_abc_pl_0 <= std_logic_vector(u_abc_pl_0_tmp);

  AXI4_BID <= AXI4_BID_tmp;

  AXI4_BRESP <= AXI4_BRESP_tmp;

  AXI4_RID <= AXI4_RID_tmp;

  AXI4_RDATA <= AXI4_RDATA_tmp;

  AXI4_RRESP <= AXI4_RRESP_tmp;

END rtl;

