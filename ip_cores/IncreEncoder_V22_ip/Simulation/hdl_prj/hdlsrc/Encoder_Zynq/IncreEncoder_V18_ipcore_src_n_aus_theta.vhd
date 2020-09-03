-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq\IncreEncoder_V18_ipcore_src_n_aus_theta.vhd
-- Created: 2017-07-30 17:53:19
-- 
-- Generated by MATLAB 9.0 and HDL Coder 3.8
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V18_ipcore_src_n_aus_theta
-- Source Path: Encoder_Zynq/IncreEncoder_V18/n_aus_theta
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V18_ipcore_src_n_aus_theta IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        count                             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        IncsPerTurn                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        T                                 :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        rps                               :   OUT   std_logic_vector(29 DOWNTO 0)  -- ufix30_En24
        );
END IncreEncoder_V18_ipcore_src_n_aus_theta;


ARCHITECTURE rtl OF IncreEncoder_V18_ipcore_src_n_aus_theta IS

  -- Signals
  SIGNAL count_unsigned                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Add_out1                         : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL count_old_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_old_switch_out1            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Add_sub_cast                     : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Add_sub_cast_1                   : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL T_unsigned                       : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL T_1                              : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Constant1_out1                   : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Constant_out1                    : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL T_count_switch_out1              : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL ProtectOverflow_T_count_out1     : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL T_count_out1                     : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Add1_out1                        : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL IncsPerTurn_unsigned             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Gain_mul_temp                    : unsigned(31 DOWNTO 0);  -- ufix32_En25
  SIGNAL Gain_out1                        : unsigned(17 DOWNTO 0);  -- ufix18_En11
  SIGNAL Gain_out1_1                      : unsigned(17 DOWNTO 0);  -- ufix18_En11
  SIGNAL Product_mul_temp                 : unsigned(47 DOWNTO 0);  -- ufix48_En35
  SIGNAL Product_out1                     : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL speed_old_switch_out1            : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL speed_old_out1                   : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Constant2_out1                   : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL ProtectOverflow_rps_out1         : unsigned(29 DOWNTO 0);  -- ufix30_En24

BEGIN
  count_unsigned <= unsigned(count);

  -- <S14>/count_old_switch
  
  count_old_switch_out1 <= count_old_out1 WHEN Add_out1 = to_signed(16#00000#, 17) ELSE
      count_unsigned;

  -- <S14>/count_old
  count_old_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        count_old_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        count_old_out1 <= count_old_switch_out1;
      END IF;
    END IF;
  END PROCESS count_old_process;


  -- <S14>/Add
  Add_sub_cast <= signed(resize(count_unsigned, 17));
  Add_sub_cast_1 <= signed(resize(count_old_out1, 17));
  Add_out1 <= Add_sub_cast - Add_sub_cast_1;

  T_unsigned <= unsigned(T);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        T_1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb_1_2_0 = '1' THEN
        T_1 <= T_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  -- <S14>/Constant1
  Constant1_out1 <= to_unsigned(16#00000000#, 30);

  -- <S14>/Constant
  Constant_out1 <= to_unsigned(16#00000000#, 30);

  
  switch_compare_1 <= '1' WHEN T_count_switch_out1 >= to_unsigned(16#32000000#, 30) ELSE
      '0';

  -- <S14>/ProtectOverflow_T_count
  
  ProtectOverflow_T_count_out1 <= T_count_switch_out1 WHEN switch_compare_1 = '0' ELSE
      Constant1_out1;

  -- <S14>/T_count
  T_count_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        T_count_out1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb_1_2_0 = '1' THEN
        T_count_out1 <= ProtectOverflow_T_count_out1;
      END IF;
    END IF;
  END PROCESS T_count_process;


  -- <S14>/Add1
  Add1_out1 <= T_1 + T_count_out1;

  -- <S14>/T_count_switch
  
  T_count_switch_out1 <= Add1_out1 WHEN Add_out1 = to_signed(16#00000#, 17) ELSE
      Constant_out1;

  
  switch_compare_1_1 <= '1' WHEN T_count_switch_out1 >= to_unsigned(16#32000000#, 30) ELSE
      '0';

  IncsPerTurn_unsigned <= unsigned(IncsPerTurn);

  -- <S14>/Gain
  Gain_mul_temp <= to_unsigned(16#8312#, 16) * IncsPerTurn_unsigned;
  Gain_out1 <= Gain_mul_temp(31 DOWNTO 14);

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Gain_out1_1 <= to_unsigned(16#00000#, 18);
      ELSIF enb_1_2_0 = '1' THEN
        Gain_out1_1 <= Gain_out1;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  -- <S14>/Product
  Product_mul_temp <= Add1_out1 * Gain_out1_1;
  Product_out1 <= Product_mul_temp(40 DOWNTO 11);

  -- <S14>/speed_old
  speed_old_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        speed_old_out1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb_1_2_0 = '1' THEN
        speed_old_out1 <= speed_old_switch_out1;
      END IF;
    END IF;
  END PROCESS speed_old_process;


  -- <S14>/speed_old_switch
  
  speed_old_switch_out1 <= speed_old_out1 WHEN Add_out1 = to_signed(16#00000#, 17) ELSE
      Product_out1;

  -- <S14>/Constant2
  Constant2_out1 <= to_unsigned(16#00000000#, 30);

  -- <S14>/ProtectOverflow_rps
  
  ProtectOverflow_rps_out1 <= speed_old_switch_out1 WHEN switch_compare_1_1 = '0' ELSE
      Constant2_out1;

  rps <= std_logic_vector(ProtectOverflow_rps_out1);

END rtl;

