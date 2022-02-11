-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_MAC6.vhd
-- Created: 2021-02-12 15:30:23
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_MAC6
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer/reluLayer_8Parallel/MAC6
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_mlp_three_layer_src_MAC6 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        rd_addr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        b                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_signals_axi_weightData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_signals_axi_weightAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        axi_signals_axi_biasData          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_signals_axi_biasAddr          :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_signals_axi_biasWriteEnable   :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        axi_signals_axi_layerNr           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        fromStateMachine_validIn          :   IN    std_logic;
        fromStateMachine_startin          :   IN    std_logic;
        fromStateMachine_mac_counter      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        fromStateMachine_write_enable     :   IN    std_logic;
        fromStateMachine_n_perceptron     :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        rd_dout                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
        );
END uz_mlp_three_layer_src_MAC6;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_MAC6 IS

  -- Component Declarations
  COMPONENT uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block33
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block35
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block34
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block33
    USE ENTITY work.uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block33(rtl);

  FOR ALL : uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block35
    USE ENTITY work.uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block35(rtl);

  FOR ALL : uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block34
    USE ENTITY work.uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block34(rtl);

  -- Signals
  SIGNAL validIn                          : std_logic;
  SIGNAL startin                          : std_logic;
  SIGNAL Multiply_Accumulate1_and1_out    : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL axi_biasData                     : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_biasData_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_biasAddr                     : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL axi_biasAddr_1                   : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL axi_biasWriteEnable              : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL axi_layerNr                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant2_out1        : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL c                                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL c_signed                         : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_weightData                   : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_weightData_1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_weightAddr                   : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL axi_weightAddr_1                 : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL axi_weightsWriteEnable           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL n_perceptron                     : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL AND_out1                         : std_logic;
  SIGNAL Gain_cast                        : unsigned(19 DOWNTO 0);  -- ufix20_En3
  SIGNAL Gain_out1                        : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL mac_counter                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Sum1_out1                        : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Multiply_Accumulate1_not1_out    : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Dual_Port_RAM_System3_out1       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Dual_Port_RAM_System3_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL s                                : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Multiply_Accumulate1_input_mux_out : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL b_signed                         : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Multiply_Accumulate1_multiply_out : signed(63 DOWNTO 0);  -- sfix64_En28
  SIGNAL s_1                              : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Multiply_Accumulate1_add_fb_in   : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Multiply_Accumulate1_add_add_cast : signed(64 DOWNTO 0);  -- sfix65_En28
  SIGNAL Multiply_Accumulate1_add_add_cast_1 : signed(64 DOWNTO 0);  -- sfix65_En28
  SIGNAL Multiply_Accumulate1_add_add_temp : signed(64 DOWNTO 0);  -- sfix65_En28
  SIGNAL Multiply_Accumulate1_multiplyAdd_out : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Constant_out1                    : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL data                             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Saturation1_out1                 : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Sum_out1                         : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL write_enable                     : std_logic;
  SIGNAL Dual_Port_RAM_System2_out1       : std_logic_vector(31 DOWNTO 0);  -- ufix32

  ATTRIBUTE use_dsp : string;

  ATTRIBUTE use_dsp OF Multiply_Accumulate1_multiply_out : SIGNAL IS "yes";

BEGIN
  u_Dual_Port_RAM_System1 : uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block33
    GENERIC MAP( AddrWidth => 10,
                 DataWidth => 32
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => axi_biasData_1,
              wr_addr => axi_biasAddr_1,
              wr_en => AND1_out1,
              rd_addr => fromStateMachine_n_perceptron,
              rd_dout => c
              );

  u_Dual_Port_RAM_System3 : uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block35
    GENERIC MAP( AddrWidth => 10,
                 DataWidth => 32
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => axi_weightData_1,
              wr_addr => axi_weightAddr_1,
              wr_en => AND_out1,
              rd_addr => std_logic_vector(Sum1_out1),
              rd_dout => Dual_Port_RAM_System3_out1
              );

  u_Dual_Port_RAM_System2 : uz_mlp_three_layer_src_SimpleDualPortRAM_generic_block34
    GENERIC MAP( AddrWidth => 10,
                 DataWidth => 32
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => std_logic_vector(Saturation1_out1),
              wr_addr => std_logic_vector(Sum_out1),
              wr_en => write_enable,
              rd_addr => rd_addr,
              rd_dout => Dual_Port_RAM_System2_out1
              );

  validIn <= fromStateMachine_validIn;

  startin <= fromStateMachine_startin;

  Multiply_Accumulate1_and1_out <= validIn AND startin;

  
  switch_compare_1 <= '1' WHEN Multiply_Accumulate1_and1_out > '0' ELSE
      '0';

  axi_biasData <= signed(axi_signals_axi_biasData);

  axi_biasData_1 <= std_logic_vector(axi_biasData);

  axi_biasAddr <= unsigned(axi_signals_axi_biasAddr);

  axi_biasAddr_1 <= std_logic_vector(axi_biasAddr);

  axi_biasWriteEnable <= unsigned(axi_signals_axi_biasWriteEnable);

  
  Compare_To_Constant1_out1 <= '1' WHEN axi_biasWriteEnable = to_unsigned(16#07#, 8) ELSE
      '0';

  axi_layerNr <= unsigned(axi_signals_axi_layerNr);

  
  Compare_To_Constant2_out1 <= '1' WHEN axi_layerNr = to_unsigned(16#02#, 8) ELSE
      '0';

  AND1_out1 <= Compare_To_Constant1_out1 AND Compare_To_Constant2_out1;

  c_signed <= signed(c);

  axi_weightData <= signed(axi_signals_axi_weightData);

  axi_weightData_1 <= std_logic_vector(axi_weightData);

  axi_weightAddr <= unsigned(axi_signals_axi_weightAddr);

  axi_weightAddr_1 <= std_logic_vector(axi_weightAddr);

  axi_weightsWriteEnable <= unsigned(axi_signals_axi_weightsWriteEnable);

  
  Compare_To_Constant_out1 <= '1' WHEN axi_weightsWriteEnable = to_unsigned(16#07#, 8) ELSE
      '0';

  n_perceptron <= unsigned(fromStateMachine_n_perceptron);

  AND_out1 <= Compare_To_Constant_out1 AND Compare_To_Constant2_out1;

  Gain_cast <= resize(n_perceptron & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 20);
  Gain_out1 <= Gain_cast(12 DOWNTO 3);

  mac_counter <= unsigned(fromStateMachine_mac_counter);

  Sum1_out1 <= Gain_out1 + mac_counter;

  Multiply_Accumulate1_not1_out <=  NOT validIn;

  
  switch_compare_1_1 <= '1' WHEN Multiply_Accumulate1_not1_out > '0' ELSE
      '0';

  Dual_Port_RAM_System3_out1_signed <= signed(Dual_Port_RAM_System3_out1);

  s <= to_signed(0, 32);

  
  Multiply_Accumulate1_input_mux_out <= Dual_Port_RAM_System3_out1_signed WHEN switch_compare_1_1 = '0' ELSE
      s;

  b_signed <= signed(b);

  Multiply_Accumulate1_multiply_out <= Multiply_Accumulate1_input_mux_out * b_signed;

  
  Multiply_Accumulate1_add_fb_in <= s_1 WHEN switch_compare_1 = '0' ELSE
      c_signed;

  Multiply_Accumulate1_add_add_cast <= resize(Multiply_Accumulate1_add_fb_in & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 65);
  Multiply_Accumulate1_add_add_cast_1 <= resize(Multiply_Accumulate1_multiply_out, 65);
  Multiply_Accumulate1_add_add_temp <= Multiply_Accumulate1_add_add_cast + Multiply_Accumulate1_add_add_cast_1;
  Multiply_Accumulate1_multiplyAdd_out <= Multiply_Accumulate1_add_add_temp(45 DOWNTO 14);

  Multiply_Accumulate1_delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        s_1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        s_1 <= Multiply_Accumulate1_multiplyAdd_out;
      END IF;
    END IF;
  END PROCESS Multiply_Accumulate1_delay_process;


  Constant_out1 <= to_unsigned(16#031#, 10);

  data <= s_1;

  
  Saturation1_out1 <= to_signed(2147467264, 32) WHEN data > to_signed(2147467264, 32) ELSE
      to_signed(0, 32) WHEN data < to_signed(0, 32) ELSE
      data;

  Sum_out1 <= n_perceptron + Constant_out1;

  write_enable <= fromStateMachine_write_enable;

  rd_dout <= Dual_Port_RAM_System2_out1;

END rtl;

