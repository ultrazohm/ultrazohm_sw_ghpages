-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw_working\ip_cores\uz_sixphase_VSD_transformation\hdl_prj\hdlsrc\uz_sixphase_VSD_transformation\uz_sixphase_VSD_transformation_axi4.vhd
-- Created: 2022-09-17 15:32:17
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_sixphase_VSD_transformation_axi4
-- Source Path: uz_sixphase_VSD_transformation/uz_sixphase_VSD_transformation_axi4
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_sixphase_VSD_transformation_pkg.ALL;

ENTITY uz_sixphase_VSD_transformation_axi4 IS
  PORT( reset                             :   IN    std_logic;
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
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_theta_el_axi                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En14
        read_x_abc_out_axi                :   IN    vector_of_std_logic_vector27(0 TO 5);  -- sfix27_En18 [6]
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
        AXI4_RVALID                       :   OUT   std_logic;  -- ufix1
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        reset_internal                    :   OUT   std_logic  -- ufix1
        );
END uz_sixphase_VSD_transformation_axi4;


ARCHITECTURE rtl OF uz_sixphase_VSD_transformation_axi4 IS

  -- Component Declarations
  COMPONENT uz_sixphase_VSD_transformation_addr_decoder
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          data_write                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   IN    std_logic;  -- ufix1
          rd_enb                          :   IN    std_logic;  -- ufix1
          read_ip_timestamp               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_theta_el_axi               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En14
          read_x_abc_out_axi              :   IN    vector_of_std_logic_vector27(0 TO 5);  -- sfix27_En18 [6]
          data_read                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_axi_enable                :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT uz_sixphase_VSD_transformation_axi4_module
    PORT( clk                             :   IN    std_logic;  -- ufix1
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
          data_read                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
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
          data_write                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   OUT   std_logic;  -- ufix1
          rd_enb                          :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_sixphase_VSD_transformation_addr_decoder
    USE ENTITY work.uz_sixphase_VSD_transformation_addr_decoder(rtl);

  FOR ALL : uz_sixphase_VSD_transformation_axi4_module
    USE ENTITY work.uz_sixphase_VSD_transformation_axi4_module(rtl);

  -- Signals
  SIGNAL top_data_write                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL top_addr_sel                     : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL top_wr_enb                       : std_logic;  -- ufix1
  SIGNAL top_rd_enb                       : std_logic;  -- ufix1
  SIGNAL top_data_read                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_BID_tmp                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL AXI4_BRESP_tmp                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_RID_tmp                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL AXI4_RDATA_tmp                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_RRESP_tmp                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL top_reset_internal               : std_logic;  -- ufix1

BEGIN
  u_uz_sixphase_VSD_transformation_addr_decoder_inst : uz_sixphase_VSD_transformation_addr_decoder
    PORT MAP( clk => AXI4_ACLK,  -- ufix1
              reset => reset,
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              read_ip_timestamp => read_ip_timestamp,  -- ufix32
              read_theta_el_axi => read_theta_el_axi,  -- sfix18_En14
              read_x_abc_out_axi => read_x_abc_out_axi,  -- sfix27_En18 [6]
              data_read => top_data_read,  -- ufix32
              write_axi_enable => write_axi_enable  -- ufix1
              );

  u_uz_sixphase_VSD_transformation_axi4_module_inst : uz_sixphase_VSD_transformation_axi4_module
    PORT MAP( clk => AXI4_ACLK,  -- ufix1
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
              data_read => top_data_read,  -- ufix32
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
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              reset_internal => top_reset_internal  -- ufix1
              );

  reset_internal <= top_reset_internal;

  AXI4_BID <= AXI4_BID_tmp;

  AXI4_BRESP <= AXI4_BRESP_tmp;

  AXI4_RID <= AXI4_RID_tmp;

  AXI4_RDATA <= AXI4_RDATA_tmp;

  AXI4_RRESP <= AXI4_RRESP_tmp;

END rtl;

