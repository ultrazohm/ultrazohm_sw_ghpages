-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_src_nfp_convert_sfix_25_En12_to_double.vhd
-- Created: 2022-05-18 14:41:25
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_src_nfp_convert_sfix_25_En12_to_double
-- Source Path: uz_inverter_3phgm/uz_inverter_3ph/nfp_convert_sfix_25_En12_to_double
-- Hierarchy Level: 1
-- 
-- {Latency Strategy = "Min"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_inverter_3ph_src_nfp_convert_sfix_25_En12_to_double IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        nfp_in                            :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En12
        nfp_out                           :   OUT   std_logic_vector(63 DOWNTO 0)  -- ufix64
        );
END uz_inverter_3ph_src_nfp_convert_sfix_25_En12_to_double;


ARCHITECTURE rtl OF uz_inverter_3ph_src_nfp_convert_sfix_25_En12_to_double IS

  -- Signals
  SIGNAL Delay1_ctrl_const_out            : std_logic;  -- ufix1
  SIGNAL Delay1_ctrl_delay_out            : std_logic;  -- ufix1
  SIGNAL Delay1_Initial_Val_out           : std_logic;  -- ufix1
  SIGNAL Constant8_out1                   : std_logic;  -- ufix1
  SIGNAL Delay4_ctrl_const_out            : std_logic;  -- ufix1
  SIGNAL Delay4_ctrl_delay_out            : std_logic;  -- ufix1
  SIGNAL Delay4_Initial_Val_out           : std_logic;  -- ufix1
  SIGNAL Constant7_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Relational_Operator_out1         : std_logic;  -- ufix1
  SIGNAL Delay4_out1                      : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1            : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1        : std_logic;  -- ufix1
  SIGNAL Add_out1                         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Delay3_out1                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Add_add_cast                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL Delay1_out1                      : std_logic;  -- ufix1
  SIGNAL nfp_in_signed                    : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL CompareToZero1_out1              : std_logic;  -- ufix1
  SIGNAL Delay5_PS_2_5_reg                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay5_PS_2_5_reg_next           : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay5_PS_2_5_out1               : std_logic;  -- ufix1
  SIGNAL Constant3_out1                   : std_logic;  -- ufix1
  SIGNAL Compare_To_Zero_out1             : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1_1          : std_logic;  -- ufix1
  SIGNAL Delay4_PS_2_5_reg                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay4_PS_2_5_reg_next           : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay4_PS_2_5_out1               : std_logic;  -- ufix1
  SIGNAL Constant2_out1                   : std_logic;  -- ufix1
  SIGNAL Switch3_out1                     : std_logic;  -- ufix1
  SIGNAL Constant4_out1                   : std_logic;  -- ufix1
  SIGNAL Switch4_out1                     : std_logic;  -- ufix1
  SIGNAL Delay2_PS_6_out1                 : std_logic;  -- ufix1
  SIGNAL Delay_PS_1_out1_dtc              : unsigned(24 DOWNTO 0);  -- ufix25_En12
  SIGNAL Unary_Minus_cast                 : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL Unary_Minus_cast_1               : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL Unary_Minus_out1                 : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL Unary_Minus_out1_dtc             : unsigned(24 DOWNTO 0);  -- ufix25_En12
  SIGNAL Switch_out1                      : unsigned(24 DOWNTO 0);  -- ufix25_En12
  SIGNAL Data_Type_Conversion2_out1       : unsigned(31 DOWNTO 0);  -- ufix32_En12
  SIGNAL Data_Type_Conversion2_out1_1     : unsigned(31 DOWNTO 0);  -- ufix32_En12
  SIGNAL Bit_Slice7_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Bit_Slice16_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice15_out1                 : std_logic;  -- ufix1
  SIGNAL Logical_Operator5_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Slice14_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice13_out1                 : std_logic;  -- ufix1
  SIGNAL Logical_Operator7_out1           : std_logic;  -- ufix1
  SIGNAL Logical_Operator6_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Slice12_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice11_out1                 : std_logic;  -- ufix1
  SIGNAL Logical_Operator4_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Slice10_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice9_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator14_out1          : std_logic;  -- ufix1
  SIGNAL Logical_Operator13_out1          : std_logic;  -- ufix1
  SIGNAL Logical_Operator12_out1          : std_logic;  -- ufix1
  SIGNAL Bit_Slice6_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Bit_Slice16_out1_1               : std_logic;  -- ufix1
  SIGNAL Bit_Slice15_out1_1               : std_logic;  -- ufix1
  SIGNAL Logical_Operator5_out1_1         : std_logic;  -- ufix1
  SIGNAL Bit_Slice14_out1_1               : std_logic;  -- ufix1
  SIGNAL Bit_Slice13_out1_1               : std_logic;  -- ufix1
  SIGNAL Logical_Operator7_out1_1         : std_logic;  -- ufix1
  SIGNAL Logical_Operator6_out1_1         : std_logic;  -- ufix1
  SIGNAL Bit_Slice12_out1_1               : std_logic;  -- ufix1
  SIGNAL Bit_Slice11_out1_1               : std_logic;  -- ufix1
  SIGNAL Logical_Operator4_out1_1         : std_logic;  -- ufix1
  SIGNAL Bit_Slice10_out1_1               : std_logic;  -- ufix1
  SIGNAL Bit_Slice9_out1_1                : std_logic;  -- ufix1
  SIGNAL Logical_Operator14_out1_1        : std_logic;  -- ufix1
  SIGNAL Logical_Operator13_out1_1        : std_logic;  -- ufix1
  SIGNAL Logical_Operator12_out1_1        : std_logic;  -- ufix1
  SIGNAL Bit_Slice1_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Bit_Slice16_out1_2               : std_logic;  -- ufix1
  SIGNAL Bit_Slice15_out1_2               : std_logic;  -- ufix1
  SIGNAL Logical_Operator5_out1_2         : std_logic;  -- ufix1
  SIGNAL Bit_Slice14_out1_2               : std_logic;  -- ufix1
  SIGNAL Bit_Slice13_out1_2               : std_logic;  -- ufix1
  SIGNAL Logical_Operator7_out1_2         : std_logic;  -- ufix1
  SIGNAL Logical_Operator6_out1_2         : std_logic;  -- ufix1
  SIGNAL Bit_Slice12_out1_2               : std_logic;  -- ufix1
  SIGNAL Bit_Slice11_out1_2               : std_logic;  -- ufix1
  SIGNAL Logical_Operator4_out1_2         : std_logic;  -- ufix1
  SIGNAL Bit_Slice10_out1_2               : std_logic;  -- ufix1
  SIGNAL Bit_Slice9_out1_2                : std_logic;  -- ufix1
  SIGNAL Logical_Operator14_out1_2        : std_logic;  -- ufix1
  SIGNAL Logical_Operator13_out1_2        : std_logic;  -- ufix1
  SIGNAL Bit_Slice4_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Bit_Slice8_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice7_out1_1                : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Slice6_out1_1                : std_logic;  -- ufix1
  SIGNAL Bit_Slice5_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator3_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice2_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice4_out1_1                : std_logic;  -- ufix1
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Bit_Slice1_out1_1                : std_logic;  -- ufix1
  SIGNAL Constant1_out1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch2_out1                     : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Logical_Operator_out1_2          : std_logic;  -- ufix1
  SIGNAL Constant2_out1_1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch1_out1                     : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant3_out1_1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant4_out1_1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Logical_Operator2_out1           : std_logic;  -- ufix1
  SIGNAL Switch3_out1_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch4_out1_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant5_out1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant6_out1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch6_out1                     : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant7_out1_1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant8_out1_1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch8_out1                     : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Logical_Operator12_out1_2        : std_logic;  -- ufix1
  SIGNAL Switch9_out1                     : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch10_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant9_out1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant10_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch12_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant11_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant12_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch15_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch16_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant13_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant14_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch18_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant15_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant16_out1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch20_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch21_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Logical_Operator_out1_3          : std_logic;  -- ufix1
  SIGNAL Switch13_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch_out1_1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant9_out1_1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant10_out1_1                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch12_out1_1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant11_out1_1                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant12_out1_1                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch15_out1_1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch16_out1_1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant13_out1_1                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant14_out1_1                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch18_out1_1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant15_out1_1                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant16_out1_1                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch20_out1_1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch21_out1_1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch13_out1_1                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant9_out1_2                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant10_out1_2                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch12_out1_2                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant11_out1_2                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant12_out1_2                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch15_out1_2                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch16_out1_2                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant13_out1_2                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant14_out1_2                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch18_out1_2                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant15_out1_2                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant16_out1_2                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch20_out1_2                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch21_out1_2                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch13_out1_2                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch2_out1_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch1_out1_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Delay1_PS_4_out1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant_out1_1                  : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Subtract_add_temp                : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Subtract_out1                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Data_Type_Conversion_out1_1      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Constant_out1_2                  : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Switch1_out1_2                   : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Constant5_out1_1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Switch5_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay1_PS_6_out1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Constant_out1_3                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Subtract_sub_cast                : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL Subtract_sub_cast_1              : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL Subtract_out1_1                  : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL Delay1_PS_4_out1_1               : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL shift_arithmetic_zerosig         : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL shift_arithmetic_selsig          : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL Data_Type_Conversion2_out1_2     : unsigned(31 DOWNTO 0);  -- ufix32_En12
  SIGNAL shift_arithmetic_zerosig_1       : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL shift_arithmetic_selsig_1        : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL shift_arithmetic_cast            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Shift_Arithmetic_out1            : unsigned(31 DOWNTO 0);  -- ufix32_En12
  SIGNAL Bit_Slice1_out1_2                : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL Constant_out1_4                  : unsigned(20 DOWNTO 0);  -- ufix21
  SIGNAL Bit_Concat_out1                  : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Constant1_out1_1                 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Switch2_out1_2                   : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Constant6_out1_1                 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Switch6_out1_1                   : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Delay3_PS_6_out1                 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL nfp_out_pack                     : unsigned(63 DOWNTO 0);  -- ufix64

BEGIN
  Delay1_ctrl_const_out <= '1';

  Delay1_ctrl_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_ctrl_delay_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_ctrl_delay_out <= Delay1_ctrl_const_out;
      END IF;
    END IF;
  END PROCESS Delay1_ctrl_delay_process;


  Delay1_Initial_Val_out <= '1';

  Constant8_out1 <= '1';

  Delay4_ctrl_const_out <= '1';

  Delay4_ctrl_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_ctrl_delay_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay4_ctrl_delay_out <= Delay4_ctrl_const_out;
      END IF;
    END IF;
  END PROCESS Delay4_ctrl_delay_process;


  Delay4_Initial_Val_out <= '1';

  Constant7_out1 <= to_unsigned(16#01#, 6);

  
  Delay4_out1 <= Delay4_Initial_Val_out WHEN Delay4_ctrl_delay_out = '0' ELSE
      Relational_Operator_out1;

  Logical_Operator_out1 <= Constant8_out1 AND Delay4_out1;

  Data_Type_Conversion_out1 <= Logical_Operator_out1;

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1 <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay3_out1 <= Add_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Add_add_cast <= '0' & '0' & '0' & '0' & '0' & Data_Type_Conversion_out1;
  Add_out1 <= Delay3_out1 + Add_add_cast;

  
  Relational_Operator_relop1 <= '1' WHEN Add_out1 <= Constant7_out1 ELSE
      '0';

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Relational_Operator_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Relational_Operator_out1 <= Relational_Operator_relop1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  
  Delay1_out1 <= Delay1_Initial_Val_out WHEN Delay1_ctrl_delay_out = '0' ELSE
      Relational_Operator_out1;

  nfp_in_signed <= signed(nfp_in);

  
  CompareToZero1_out1 <= '1' WHEN nfp_in_signed = to_signed(16#0000000#, 25) ELSE
      '0';

  Delay5_PS_2_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay5_PS_2_5_reg(0) <= '0';
      Delay5_PS_2_5_reg(1) <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay5_PS_2_5_reg(0) <= Delay5_PS_2_5_reg_next(0);
        Delay5_PS_2_5_reg(1) <= Delay5_PS_2_5_reg_next(1);
      END IF;
    END IF;
  END PROCESS Delay5_PS_2_5_process;

  Delay5_PS_2_5_out1 <= Delay5_PS_2_5_reg(1);
  Delay5_PS_2_5_reg_next(0) <= CompareToZero1_out1;
  Delay5_PS_2_5_reg_next(1) <= Delay5_PS_2_5_reg(0);

  Constant3_out1 <= '1';

  
  Compare_To_Zero_out1 <= '1' WHEN nfp_in_signed < to_signed(16#0000000#, 25) ELSE
      '0';

  Logical_Operator_out1_1 <= Constant3_out1 AND Compare_To_Zero_out1;

  Delay4_PS_2_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_PS_2_5_reg(0) <= '0';
      Delay4_PS_2_5_reg(1) <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay4_PS_2_5_reg(0) <= Delay4_PS_2_5_reg_next(0);
        Delay4_PS_2_5_reg(1) <= Delay4_PS_2_5_reg_next(1);
      END IF;
    END IF;
  END PROCESS Delay4_PS_2_5_process;

  Delay4_PS_2_5_out1 <= Delay4_PS_2_5_reg(1);
  Delay4_PS_2_5_reg_next(0) <= Logical_Operator_out1_1;
  Delay4_PS_2_5_reg_next(1) <= Delay4_PS_2_5_reg(0);

  Constant2_out1 <= '0';

  
  Switch3_out1 <= Delay4_PS_2_5_out1 WHEN Delay5_PS_2_5_out1 = '0' ELSE
      Constant2_out1;

  Constant4_out1 <= '0';

  
  Switch4_out1 <= Switch3_out1 WHEN Delay1_out1 = '0' ELSE
      Constant4_out1;

  Delay2_PS_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_PS_6_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay2_PS_6_out1 <= Switch4_out1;
      END IF;
    END IF;
  END PROCESS Delay2_PS_6_process;


  Delay_PS_1_out1_dtc <= unsigned(nfp_in_signed);

  Unary_Minus_cast <= resize(nfp_in_signed, 26);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(24 DOWNTO 0);

  Unary_Minus_out1_dtc <= unsigned(Unary_Minus_out1);

  
  Switch_out1 <= Delay_PS_1_out1_dtc WHEN Logical_Operator_out1_1 = '0' ELSE
      Unary_Minus_out1_dtc;

  Data_Type_Conversion2_out1 <= resize(Switch_out1, 32);

  reduced_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Data_Type_Conversion2_out1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Data_Type_Conversion2_out1_1 <= Data_Type_Conversion2_out1;
      END IF;
    END IF;
  END PROCESS reduced_1_process;


  Bit_Slice7_out1 <= Data_Type_Conversion2_out1_1(31 DOWNTO 24);

  Bit_Slice16_out1 <= Bit_Slice7_out1(7);

  Bit_Slice15_out1 <= Bit_Slice7_out1(6);

  Logical_Operator5_out1 <= Bit_Slice16_out1 OR Bit_Slice15_out1;

  Bit_Slice14_out1 <= Bit_Slice7_out1(5);

  Bit_Slice13_out1 <= Bit_Slice7_out1(4);

  Logical_Operator7_out1 <= Bit_Slice14_out1 OR Bit_Slice13_out1;

  Logical_Operator6_out1 <= Logical_Operator5_out1 OR Logical_Operator7_out1;

  Bit_Slice12_out1 <= Bit_Slice7_out1(3);

  Bit_Slice11_out1 <= Bit_Slice7_out1(2);

  Logical_Operator4_out1 <= Bit_Slice12_out1 OR Bit_Slice11_out1;

  Bit_Slice10_out1 <= Bit_Slice7_out1(1);

  Bit_Slice9_out1 <= Bit_Slice7_out1(0);

  Logical_Operator14_out1 <= Bit_Slice10_out1 OR Bit_Slice9_out1;

  Logical_Operator13_out1 <= Logical_Operator4_out1 OR Logical_Operator14_out1;

  Logical_Operator12_out1 <= Logical_Operator6_out1 OR Logical_Operator13_out1;

  Bit_Slice6_out1 <= Data_Type_Conversion2_out1_1(23 DOWNTO 16);

  Bit_Slice16_out1_1 <= Bit_Slice6_out1(7);

  Bit_Slice15_out1_1 <= Bit_Slice6_out1(6);

  Logical_Operator5_out1_1 <= Bit_Slice16_out1_1 OR Bit_Slice15_out1_1;

  Bit_Slice14_out1_1 <= Bit_Slice6_out1(5);

  Bit_Slice13_out1_1 <= Bit_Slice6_out1(4);

  Logical_Operator7_out1_1 <= Bit_Slice14_out1_1 OR Bit_Slice13_out1_1;

  Logical_Operator6_out1_1 <= Logical_Operator5_out1_1 OR Logical_Operator7_out1_1;

  Bit_Slice12_out1_1 <= Bit_Slice6_out1(3);

  Bit_Slice11_out1_1 <= Bit_Slice6_out1(2);

  Logical_Operator4_out1_1 <= Bit_Slice12_out1_1 OR Bit_Slice11_out1_1;

  Bit_Slice10_out1_1 <= Bit_Slice6_out1(1);

  Bit_Slice9_out1_1 <= Bit_Slice6_out1(0);

  Logical_Operator14_out1_1 <= Bit_Slice10_out1_1 OR Bit_Slice9_out1_1;

  Logical_Operator13_out1_1 <= Logical_Operator4_out1_1 OR Logical_Operator14_out1_1;

  Logical_Operator12_out1_1 <= Logical_Operator6_out1_1 OR Logical_Operator13_out1_1;

  Bit_Slice1_out1 <= Data_Type_Conversion2_out1_1(15 DOWNTO 8);

  Bit_Slice16_out1_2 <= Bit_Slice1_out1(7);

  Bit_Slice15_out1_2 <= Bit_Slice1_out1(6);

  Logical_Operator5_out1_2 <= Bit_Slice16_out1_2 OR Bit_Slice15_out1_2;

  Bit_Slice14_out1_2 <= Bit_Slice1_out1(5);

  Bit_Slice13_out1_2 <= Bit_Slice1_out1(4);

  Logical_Operator7_out1_2 <= Bit_Slice14_out1_2 OR Bit_Slice13_out1_2;

  Logical_Operator6_out1_2 <= Logical_Operator5_out1_2 OR Logical_Operator7_out1_2;

  Bit_Slice12_out1_2 <= Bit_Slice1_out1(3);

  Bit_Slice11_out1_2 <= Bit_Slice1_out1(2);

  Logical_Operator4_out1_2 <= Bit_Slice12_out1_2 OR Bit_Slice11_out1_2;

  Bit_Slice10_out1_2 <= Bit_Slice1_out1(1);

  Bit_Slice9_out1_2 <= Bit_Slice1_out1(0);

  Logical_Operator14_out1_2 <= Bit_Slice10_out1_2 OR Bit_Slice9_out1_2;

  Logical_Operator13_out1_2 <= Logical_Operator4_out1_2 OR Logical_Operator14_out1_2;

  Bit_Slice4_out1 <= Data_Type_Conversion2_out1_1(7 DOWNTO 0);

  Bit_Slice8_out1 <= Bit_Slice4_out1(7);

  Bit_Slice7_out1_1 <= Bit_Slice4_out1(6);

  Logical_Operator1_out1 <= Bit_Slice8_out1 OR Bit_Slice7_out1_1;

  Bit_Slice6_out1_1 <= Bit_Slice4_out1(5);

  Bit_Slice5_out1 <= Bit_Slice4_out1(4);

  Logical_Operator3_out1 <= Bit_Slice6_out1_1 OR Bit_Slice5_out1;

  Bit_Slice3_out1 <= Bit_Slice4_out1(3);

  Bit_Slice2_out1 <= Bit_Slice4_out1(2);

  Bit_Slice4_out1_1 <= Bit_Slice4_out1(0);

  Constant_out1 <= to_unsigned(16#00#, 8);

  Bit_Slice1_out1_1 <= Bit_Slice4_out1(1);

  Constant1_out1 <= to_unsigned(16#01#, 8);

  
  Switch2_out1 <= Constant_out1 WHEN Bit_Slice4_out1_1 = '0' ELSE
      Constant1_out1;

  Logical_Operator_out1_2 <= Bit_Slice3_out1 OR Bit_Slice2_out1;

  Constant2_out1_1 <= to_unsigned(16#02#, 8);

  
  Switch1_out1 <= Switch2_out1 WHEN Bit_Slice1_out1_1 = '0' ELSE
      Constant2_out1_1;

  Constant3_out1_1 <= to_unsigned(16#03#, 8);

  Constant4_out1_1 <= to_unsigned(16#04#, 8);

  Logical_Operator2_out1 <= Logical_Operator1_out1 OR Logical_Operator3_out1;

  
  Switch3_out1_1 <= Constant3_out1_1 WHEN Bit_Slice3_out1 = '0' ELSE
      Constant4_out1_1;

  
  Switch4_out1_1 <= Switch1_out1 WHEN Logical_Operator_out1_2 = '0' ELSE
      Switch3_out1_1;

  Constant5_out1 <= to_unsigned(16#05#, 8);

  Constant6_out1 <= to_unsigned(16#06#, 8);

  
  Switch6_out1 <= Constant5_out1 WHEN Bit_Slice6_out1_1 = '0' ELSE
      Constant6_out1;

  Constant7_out1_1 <= to_unsigned(16#07#, 8);

  Constant8_out1_1 <= to_unsigned(16#08#, 8);

  
  Switch8_out1 <= Constant7_out1_1 WHEN Bit_Slice8_out1 = '0' ELSE
      Constant8_out1_1;

  Logical_Operator12_out1_2 <= Logical_Operator6_out1_2 OR Logical_Operator13_out1_2;

  
  Switch9_out1 <= Switch6_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      Switch8_out1;

  
  Switch10_out1 <= Switch4_out1_1 WHEN Logical_Operator2_out1 = '0' ELSE
      Switch9_out1;

  Constant9_out1 <= to_unsigned(16#09#, 8);

  Constant10_out1 <= to_unsigned(16#0A#, 8);

  
  Switch12_out1 <= Constant9_out1 WHEN Bit_Slice10_out1_2 = '0' ELSE
      Constant10_out1;

  Constant11_out1 <= to_unsigned(16#0B#, 8);

  Constant12_out1 <= to_unsigned(16#0C#, 8);

  
  Switch15_out1 <= Constant11_out1 WHEN Bit_Slice12_out1_2 = '0' ELSE
      Constant12_out1;

  
  Switch16_out1 <= Switch12_out1 WHEN Logical_Operator4_out1_2 = '0' ELSE
      Switch15_out1;

  Constant13_out1 <= to_unsigned(16#0D#, 8);

  Constant14_out1 <= to_unsigned(16#0E#, 8);

  
  Switch18_out1 <= Constant13_out1 WHEN Bit_Slice14_out1_2 = '0' ELSE
      Constant14_out1;

  Constant15_out1 <= to_unsigned(16#0F#, 8);

  Constant16_out1 <= to_unsigned(16#10#, 8);

  
  Switch20_out1 <= Constant15_out1 WHEN Bit_Slice16_out1_2 = '0' ELSE
      Constant16_out1;

  
  Switch21_out1 <= Switch18_out1 WHEN Logical_Operator5_out1_2 = '0' ELSE
      Switch20_out1;

  Logical_Operator_out1_3 <= Logical_Operator12_out1 OR Logical_Operator12_out1_1;

  
  Switch13_out1 <= Switch16_out1 WHEN Logical_Operator6_out1_2 = '0' ELSE
      Switch21_out1;

  
  Switch_out1_1 <= Switch10_out1 WHEN Logical_Operator12_out1_2 = '0' ELSE
      Switch13_out1;

  Constant9_out1_1 <= to_unsigned(16#11#, 8);

  Constant10_out1_1 <= to_unsigned(16#12#, 8);

  
  Switch12_out1_1 <= Constant9_out1_1 WHEN Bit_Slice10_out1_1 = '0' ELSE
      Constant10_out1_1;

  Constant11_out1_1 <= to_unsigned(16#13#, 8);

  Constant12_out1_1 <= to_unsigned(16#14#, 8);

  
  Switch15_out1_1 <= Constant11_out1_1 WHEN Bit_Slice12_out1_1 = '0' ELSE
      Constant12_out1_1;

  
  Switch16_out1_1 <= Switch12_out1_1 WHEN Logical_Operator4_out1_1 = '0' ELSE
      Switch15_out1_1;

  Constant13_out1_1 <= to_unsigned(16#15#, 8);

  Constant14_out1_1 <= to_unsigned(16#16#, 8);

  
  Switch18_out1_1 <= Constant13_out1_1 WHEN Bit_Slice14_out1_1 = '0' ELSE
      Constant14_out1_1;

  Constant15_out1_1 <= to_unsigned(16#17#, 8);

  Constant16_out1_1 <= to_unsigned(16#18#, 8);

  
  Switch20_out1_1 <= Constant15_out1_1 WHEN Bit_Slice16_out1_1 = '0' ELSE
      Constant16_out1_1;

  
  Switch21_out1_1 <= Switch18_out1_1 WHEN Logical_Operator5_out1_1 = '0' ELSE
      Switch20_out1_1;

  
  Switch13_out1_1 <= Switch16_out1_1 WHEN Logical_Operator6_out1_1 = '0' ELSE
      Switch21_out1_1;

  Constant9_out1_2 <= to_unsigned(16#19#, 8);

  Constant10_out1_2 <= to_unsigned(16#1A#, 8);

  
  Switch12_out1_2 <= Constant9_out1_2 WHEN Bit_Slice10_out1 = '0' ELSE
      Constant10_out1_2;

  Constant11_out1_2 <= to_unsigned(16#1B#, 8);

  Constant12_out1_2 <= to_unsigned(16#1C#, 8);

  
  Switch15_out1_2 <= Constant11_out1_2 WHEN Bit_Slice12_out1 = '0' ELSE
      Constant12_out1_2;

  
  Switch16_out1_2 <= Switch12_out1_2 WHEN Logical_Operator4_out1 = '0' ELSE
      Switch15_out1_2;

  Constant13_out1_2 <= to_unsigned(16#1D#, 8);

  Constant14_out1_2 <= to_unsigned(16#1E#, 8);

  
  Switch18_out1_2 <= Constant13_out1_2 WHEN Bit_Slice14_out1 = '0' ELSE
      Constant14_out1_2;

  Constant15_out1_2 <= to_unsigned(16#1F#, 8);

  Constant16_out1_2 <= to_unsigned(16#20#, 8);

  
  Switch20_out1_2 <= Constant15_out1_2 WHEN Bit_Slice16_out1 = '0' ELSE
      Constant16_out1_2;

  
  Switch21_out1_2 <= Switch18_out1_2 WHEN Logical_Operator5_out1 = '0' ELSE
      Switch20_out1_2;

  
  Switch13_out1_2 <= Switch16_out1_2 WHEN Logical_Operator6_out1 = '0' ELSE
      Switch21_out1_2;

  
  Switch2_out1_1 <= Switch13_out1_1 WHEN Logical_Operator12_out1 = '0' ELSE
      Switch13_out1_2;

  
  Switch1_out1_1 <= Switch_out1_1 WHEN Logical_Operator_out1_3 = '0' ELSE
      Switch2_out1_1;

  Delay1_PS_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_PS_4_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_PS_4_out1 <= Switch1_out1_1;
      END IF;
    END IF;
  END PROCESS Delay1_PS_4_process;


  Constant_out1_1 <= to_unsigned(16#3F2#, 11);

  Subtract_add_temp <= resize(Delay1_PS_4_out1, 12) + resize(Constant_out1_1, 12);
  Subtract_out1 <= signed(Subtract_add_temp);

  Data_Type_Conversion_out1_1 <= unsigned(Subtract_out1(10 DOWNTO 0));

  Constant_out1_2 <= to_unsigned(16#000#, 11);

  
  Switch1_out1_2 <= Data_Type_Conversion_out1_1 WHEN Delay5_PS_2_5_out1 = '0' ELSE
      Constant_out1_2;

  Constant5_out1_1 <= to_unsigned(16#000#, 11);

  
  Switch5_out1 <= Switch1_out1_2 WHEN Delay1_out1 = '0' ELSE
      Constant5_out1_1;

  Delay1_PS_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_PS_6_out1 <= to_unsigned(16#000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_PS_6_out1 <= Switch5_out1;
      END IF;
    END IF;
  END PROCESS Delay1_PS_6_process;


  Constant_out1_3 <= to_unsigned(16#20#, 8);

  Subtract_sub_cast <= signed(resize(Constant_out1_3, 9));
  Subtract_sub_cast_1 <= signed(resize(Switch1_out1_1, 9));
  Subtract_out1_1 <= Subtract_sub_cast - Subtract_sub_cast_1;

  Delay1_PS_4_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_PS_4_out1_1 <= to_signed(16#000#, 9);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_PS_4_out1_1 <= Subtract_out1_1;
      END IF;
    END IF;
  END PROCESS Delay1_PS_4_1_process;


  shift_arithmetic_zerosig <= to_signed(16#000#, 9);

  
  shift_arithmetic_selsig <= Delay1_PS_4_out1_1 WHEN Delay1_PS_4_out1_1 >= shift_arithmetic_zerosig ELSE
      shift_arithmetic_zerosig;

  reduced_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Data_Type_Conversion2_out1_2 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Data_Type_Conversion2_out1_2 <= Data_Type_Conversion2_out1_1;
      END IF;
    END IF;
  END PROCESS reduced_2_process;


  shift_arithmetic_zerosig_1 <= to_signed(16#000#, 9);

  
  shift_arithmetic_selsig_1 <= shift_arithmetic_selsig WHEN shift_arithmetic_selsig >= shift_arithmetic_zerosig_1 ELSE
      shift_arithmetic_zerosig_1;

  shift_arithmetic_cast <= resize(shift_arithmetic_selsig_1, 16);
  Shift_Arithmetic_out1 <= Data_Type_Conversion2_out1_2 sll to_integer(shift_arithmetic_cast);

  Bit_Slice1_out1_2 <= Shift_Arithmetic_out1(30 DOWNTO 0);

  Constant_out1_4 <= to_unsigned(16#000000#, 21);

  Bit_Concat_out1 <= Bit_Slice1_out1_2 & Constant_out1_4;

  Constant1_out1_1 <= to_unsigned(0, 52);

  
  Switch2_out1_2 <= Bit_Concat_out1 WHEN Delay5_PS_2_5_out1 = '0' ELSE
      Constant1_out1_1;

  Constant6_out1_1 <= to_unsigned(0, 52);

  
  Switch6_out1_1 <= Switch2_out1_2 WHEN Delay1_out1 = '0' ELSE
      Constant6_out1_1;

  Delay3_PS_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_PS_6_out1 <= to_unsigned(0, 52);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay3_PS_6_out1 <= Switch6_out1_1;
      END IF;
    END IF;
  END PROCESS Delay3_PS_6_process;


  -- Combine FP sign, exponent, mantissa into 64 bit word
  nfp_out_pack <= Delay2_PS_6_out1 & Delay1_PS_6_out1 & Delay3_PS_6_out1;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

