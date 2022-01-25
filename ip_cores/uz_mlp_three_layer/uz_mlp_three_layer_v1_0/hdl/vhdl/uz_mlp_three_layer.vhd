-- -------------------------------------------------------------
-- 
-- File Name: /home/ts/Documents/integrate_nn_to_uz/ultrazohm_sw/ip_cores/nnAXI_v1_0/hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer.vhd
-- Created: 2021-10-22 11:38:57
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
-- Module: uz_mlp_three_layer
-- Source Path: uz_mlp_three_layer
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_mlp_three_layer_pkg.ALL;

ENTITY uz_mlp_three_layer IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        x1                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x2                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x3                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x4                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x5                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x6                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x7                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x8                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x9                                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x10                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x11                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x12                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x13                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x14                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x15                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        x16                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
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
        layer2_rdy                        :   OUT   std_logic;  -- ufix1
        finished                          :   OUT   std_logic;  -- ufix1
        out_rsvd                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        out1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        out2                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        out3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        out4                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        out5                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        out6                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        out7                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        biasData                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        biasWriteAddr                     :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        biasWriteEnable                   :   OUT   std_logic;  -- ufix1
        valid_output                      :   OUT   std_logic;  -- ufix1
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
END uz_mlp_three_layer;


ARCHITECTURE rtl OF uz_mlp_three_layer IS

  -- Component Declarations
  COMPONENT uz_mlp_three_layer_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_axi4
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
          read_axi_valid_output           :   IN    std_logic;  -- ufix1
          read_axi_nn_output              :   IN    vector_of_std_logic_vector32(0 TO 7);  -- sfix32_En14 [8]
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
          write_enable_nn                 :   OUT   std_logic;  -- ufix1
          write_axi_bias                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          write_axi_weight                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          write_axi_bias_addr             :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          write_axi_weight_addr           :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          write_axi_wrEnBias              :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_axi_wrEnWeights           :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_axi_layerNr               :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_use_axi_input             :   OUT   std_logic;  -- ufix1
          write_axi_number_of_inputs      :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          write_axi_output_number_configuration :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          write_axi_x_input               :   OUT   vector_of_std_logic_vector32(0 TO 15);  -- sfix32_En14 [16]
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          enable_nn                       :   IN    std_logic;  -- ufix1
          x1                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x2                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x3                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x4                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x5                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x6                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x7                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x8                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x9                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x10                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x11                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x12                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x13                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x14                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x15                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x16                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_bias                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_weight                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_bias_addr                   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_weight_addr                 :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_wrEnBias                    :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          axi_wrEnWeights                 :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          axi_layerNr                     :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          use_axi_input                   :   IN    std_logic;  -- ufix1
          axi_x_input_0                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_1                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_2                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_3                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_4                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_5                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_6                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_7                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_8                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_9                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_10                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_11                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_12                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_13                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_14                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_15                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_number_of_inputs            :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_output_number_configuration :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          ce_out                          :   OUT   std_logic;  -- ufix1
          layer2_rdy                      :   OUT   std_logic;  -- ufix1
          finished                        :   OUT   std_logic;  -- ufix1
          out_rsvd                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out1                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out2                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out3                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out4                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out5                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out6                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out7                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasData                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasWriteAddr                   :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          biasWriteEnable                 :   OUT   std_logic;  -- ufix1
          valid_output                    :   OUT   std_logic;  -- ufix1
          axi_nn_output_0                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_1                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_2                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_3                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_4                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_5                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_6                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_7                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_valid_output                :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_mlp_three_layer_reset_sync
    USE ENTITY work.uz_mlp_three_layer_reset_sync(rtl);

  FOR ALL : uz_mlp_three_layer_axi4
    USE ENTITY work.uz_mlp_three_layer_axi4(rtl);

  FOR ALL : uz_mlp_three_layer_dut
    USE ENTITY work.uz_mlp_three_layer_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL x1_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x1_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x2_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x2_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x3_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x3_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x4_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x4_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x5_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x5_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x6_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x6_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x7_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x7_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x8_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x8_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x9_unsigned                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x9_sig                           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x10_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x10_sig                          : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x11_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x11_sig                          : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x12_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x12_sig                          : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x13_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x13_sig                          : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x14_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x14_sig                          : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x15_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x15_sig                          : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x16_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL x16_sig                          : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL write_axi_x_input                : vector_of_std_logic_vector32(0 TO 15);  -- ufix32 [16]
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL reset_before_sync                : std_logic;  -- ufix1
  SIGNAL read_axi_nn_output_vec           : vector_of_std_logic_vector32(0 TO 7);  -- ufix32 [8]
  SIGNAL axi_valid_output_sig             : std_logic;  -- ufix1
  SIGNAL AXI4_BID_tmp                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL AXI4_BRESP_tmp                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_RID_tmp                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL AXI4_RDATA_tmp                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_RRESP_tmp                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_axi_enable                 : std_logic;  -- ufix1
  SIGNAL write_enable_nn                  : std_logic;  -- ufix1
  SIGNAL write_axi_bias                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_axi_weight                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_axi_bias_addr              : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL write_axi_weight_addr            : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL write_axi_wrEnBias               : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL write_axi_wrEnWeights            : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL write_axi_layerNr                : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL write_use_axi_input              : std_logic;  -- ufix1
  SIGNAL write_axi_number_of_inputs       : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL write_axi_output_number_configuration : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL layer2_rdy_sig                   : std_logic;  -- ufix1
  SIGNAL finished_sig                     : std_logic;  -- ufix1
  SIGNAL out_rsvd_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out1_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out2_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out3_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out4_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out5_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out6_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out7_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL biasData_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL biasWriteAddr_sig                : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL biasWriteEnable_sig              : std_logic;  -- ufix1
  SIGNAL valid_output_sig                 : std_logic;  -- ufix1
  SIGNAL out_rsvd_sig_signed              : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out_rsvd_tmp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out1_sig_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out1_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out2_sig_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out2_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out3_sig_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out3_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out4_sig_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out4_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out5_sig_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out5_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out6_sig_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out6_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out7_sig_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL out7_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL biasData_sig_signed              : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL biasData_tmp                     : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  u_uz_mlp_three_layer_reset_sync_inst : uz_mlp_three_layer_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_before_sync,  -- ufix1
              reset_out => reset
              );

  u_uz_mlp_three_layer_axi4_inst : uz_mlp_three_layer_axi4
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
              read_axi_valid_output => axi_valid_output_sig,  -- ufix1
              read_axi_nn_output => read_axi_nn_output_vec,  -- sfix32_En14 [8]
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
              write_enable_nn => write_enable_nn,  -- ufix1
              write_axi_bias => write_axi_bias,  -- sfix32_En14
              write_axi_weight => write_axi_weight,  -- sfix32_En14
              write_axi_bias_addr => write_axi_bias_addr,  -- ufix10
              write_axi_weight_addr => write_axi_weight_addr,  -- ufix10
              write_axi_wrEnBias => write_axi_wrEnBias,  -- ufix8
              write_axi_wrEnWeights => write_axi_wrEnWeights,  -- ufix8
              write_axi_layerNr => write_axi_layerNr,  -- ufix8
              write_use_axi_input => write_use_axi_input,  -- ufix1
              write_axi_number_of_inputs => write_axi_number_of_inputs,  -- ufix10
              write_axi_output_number_configuration => write_axi_output_number_configuration,  -- ufix10
              write_axi_x_input => write_axi_x_input,  -- sfix32_En14 [16]
              reset_internal => reset_internal  -- ufix1
              );

  u_uz_mlp_three_layer_dut_inst : uz_mlp_three_layer_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => write_axi_enable,  -- ufix1
              enable_nn => write_enable_nn,  -- ufix1
              x1 => std_logic_vector(x1_sig),  -- sfix32_En14
              x2 => std_logic_vector(x2_sig),  -- sfix32_En14
              x3 => std_logic_vector(x3_sig),  -- sfix32_En14
              x4 => std_logic_vector(x4_sig),  -- sfix32_En14
              x5 => std_logic_vector(x5_sig),  -- sfix32_En14
              x6 => std_logic_vector(x6_sig),  -- sfix32_En14
              x7 => std_logic_vector(x7_sig),  -- sfix32_En14
              x8 => std_logic_vector(x8_sig),  -- sfix32_En14
              x9 => std_logic_vector(x9_sig),  -- sfix32_En14
              x10 => std_logic_vector(x10_sig),  -- sfix32_En14
              x11 => std_logic_vector(x11_sig),  -- sfix32_En14
              x12 => std_logic_vector(x12_sig),  -- sfix32_En14
              x13 => std_logic_vector(x13_sig),  -- sfix32_En14
              x14 => std_logic_vector(x14_sig),  -- sfix32_En14
              x15 => std_logic_vector(x15_sig),  -- sfix32_En14
              x16 => std_logic_vector(x16_sig),  -- sfix32_En14
              axi_bias => write_axi_bias,  -- sfix32_En14
              axi_weight => write_axi_weight,  -- sfix32_En14
              axi_bias_addr => write_axi_bias_addr,  -- ufix10
              axi_weight_addr => write_axi_weight_addr,  -- ufix10
              axi_wrEnBias => write_axi_wrEnBias,  -- ufix8
              axi_wrEnWeights => write_axi_wrEnWeights,  -- ufix8
              axi_layerNr => write_axi_layerNr,  -- ufix8
              use_axi_input => write_use_axi_input,  -- ufix1
              axi_x_input_0 => write_axi_x_input(0),  -- sfix32_En14
              axi_x_input_1 => write_axi_x_input(1),  -- sfix32_En14
              axi_x_input_2 => write_axi_x_input(2),  -- sfix32_En14
              axi_x_input_3 => write_axi_x_input(3),  -- sfix32_En14
              axi_x_input_4 => write_axi_x_input(4),  -- sfix32_En14
              axi_x_input_5 => write_axi_x_input(5),  -- sfix32_En14
              axi_x_input_6 => write_axi_x_input(6),  -- sfix32_En14
              axi_x_input_7 => write_axi_x_input(7),  -- sfix32_En14
              axi_x_input_8 => write_axi_x_input(8),  -- sfix32_En14
              axi_x_input_9 => write_axi_x_input(9),  -- sfix32_En14
              axi_x_input_10 => write_axi_x_input(10),  -- sfix32_En14
              axi_x_input_11 => write_axi_x_input(11),  -- sfix32_En14
              axi_x_input_12 => write_axi_x_input(12),  -- sfix32_En14
              axi_x_input_13 => write_axi_x_input(13),  -- sfix32_En14
              axi_x_input_14 => write_axi_x_input(14),  -- sfix32_En14
              axi_x_input_15 => write_axi_x_input(15),  -- sfix32_En14
              axi_number_of_inputs => write_axi_number_of_inputs,  -- ufix10
              axi_output_number_configuration => write_axi_output_number_configuration,  -- ufix10
              ce_out => ce_out_sig,  -- ufix1
              layer2_rdy => layer2_rdy_sig,  -- ufix1
              finished => finished_sig,  -- ufix1
              out_rsvd => out_rsvd_sig,  -- sfix32_En14
              out1 => out1_sig,  -- sfix32_En14
              out2 => out2_sig,  -- sfix32_En14
              out3 => out3_sig,  -- sfix32_En14
              out4 => out4_sig,  -- sfix32_En14
              out5 => out5_sig,  -- sfix32_En14
              out6 => out6_sig,  -- sfix32_En14
              out7 => out7_sig,  -- sfix32_En14
              biasData => biasData_sig,  -- sfix32_En14
              biasWriteAddr => biasWriteAddr_sig,  -- ufix10
              biasWriteEnable => biasWriteEnable_sig,  -- ufix1
              valid_output => valid_output_sig,  -- ufix1
              axi_nn_output_0 => read_axi_nn_output_vec(0),  -- sfix32_En14
              axi_nn_output_1 => read_axi_nn_output_vec(1),  -- sfix32_En14
              axi_nn_output_2 => read_axi_nn_output_vec(2),  -- sfix32_En14
              axi_nn_output_3 => read_axi_nn_output_vec(3),  -- sfix32_En14
              axi_nn_output_4 => read_axi_nn_output_vec(4),  -- sfix32_En14
              axi_nn_output_5 => read_axi_nn_output_vec(5),  -- sfix32_En14
              axi_nn_output_6 => read_axi_nn_output_vec(6),  -- sfix32_En14
              axi_nn_output_7 => read_axi_nn_output_vec(7),  -- sfix32_En14
              axi_valid_output => axi_valid_output_sig  -- ufix1
              );

  ip_timestamp <= to_unsigned(2110221138, 32);

  reset_cm <=  NOT IPCORE_RESETN;

  x1_unsigned <= unsigned(x1);

  x1_sig <= signed(x1_unsigned);

  x2_unsigned <= unsigned(x2);

  x2_sig <= signed(x2_unsigned);

  x3_unsigned <= unsigned(x3);

  x3_sig <= signed(x3_unsigned);

  x4_unsigned <= unsigned(x4);

  x4_sig <= signed(x4_unsigned);

  x5_unsigned <= unsigned(x5);

  x5_sig <= signed(x5_unsigned);

  x6_unsigned <= unsigned(x6);

  x6_sig <= signed(x6_unsigned);

  x7_unsigned <= unsigned(x7);

  x7_sig <= signed(x7_unsigned);

  x8_unsigned <= unsigned(x8);

  x8_sig <= signed(x8_unsigned);

  x9_unsigned <= unsigned(x9);

  x9_sig <= signed(x9_unsigned);

  x10_unsigned <= unsigned(x10);

  x10_sig <= signed(x10_unsigned);

  x11_unsigned <= unsigned(x11);

  x11_sig <= signed(x11_unsigned);

  x12_unsigned <= unsigned(x12);

  x12_sig <= signed(x12_unsigned);

  x13_unsigned <= unsigned(x13);

  x13_sig <= signed(x13_unsigned);

  x14_unsigned <= unsigned(x14);

  x14_sig <= signed(x14_unsigned);

  x15_unsigned <= unsigned(x15);

  x15_sig <= signed(x15_unsigned);

  x16_unsigned <= unsigned(x16);

  x16_sig <= signed(x16_unsigned);

  reset_before_sync <= reset_cm OR reset_internal;


  out_rsvd_sig_signed <= signed(out_rsvd_sig);

  out_rsvd_tmp <= unsigned(out_rsvd_sig_signed);

  out_rsvd <= std_logic_vector(out_rsvd_tmp);

  out1_sig_signed <= signed(out1_sig);

  out1_tmp <= unsigned(out1_sig_signed);

  out1 <= std_logic_vector(out1_tmp);

  out2_sig_signed <= signed(out2_sig);

  out2_tmp <= unsigned(out2_sig_signed);

  out2 <= std_logic_vector(out2_tmp);

  out3_sig_signed <= signed(out3_sig);

  out3_tmp <= unsigned(out3_sig_signed);

  out3 <= std_logic_vector(out3_tmp);

  out4_sig_signed <= signed(out4_sig);

  out4_tmp <= unsigned(out4_sig_signed);

  out4 <= std_logic_vector(out4_tmp);

  out5_sig_signed <= signed(out5_sig);

  out5_tmp <= unsigned(out5_sig_signed);

  out5 <= std_logic_vector(out5_tmp);

  out6_sig_signed <= signed(out6_sig);

  out6_tmp <= unsigned(out6_sig_signed);

  out6 <= std_logic_vector(out6_tmp);

  out7_sig_signed <= signed(out7_sig);

  out7_tmp <= unsigned(out7_sig_signed);

  out7 <= std_logic_vector(out7_tmp);

  biasData_sig_signed <= signed(biasData_sig);

  biasData_tmp <= unsigned(biasData_sig_signed);

  biasData <= std_logic_vector(biasData_tmp);

  layer2_rdy <= layer2_rdy_sig;

  finished <= finished_sig;

  biasWriteAddr <= biasWriteAddr_sig;

  biasWriteEnable <= biasWriteEnable_sig;

  valid_output <= valid_output_sig;

  AXI4_BID <= AXI4_BID_tmp;

  AXI4_BRESP <= AXI4_BRESP_tmp;

  AXI4_RID <= AXI4_RID_tmp;

  AXI4_RDATA <= AXI4_RDATA_tmp;

  AXI4_RRESP <= AXI4_RRESP_tmp;

END rtl;

