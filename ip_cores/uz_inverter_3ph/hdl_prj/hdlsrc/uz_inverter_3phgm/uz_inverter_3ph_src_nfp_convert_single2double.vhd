-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_src_nfp_convert_single2double.vhd
-- Created: 2022-05-18 14:41:25
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_src_nfp_convert_single2double
-- Source Path: uz_inverter_3phgm/uz_inverter_3ph/nfp_convert_single2double
-- Hierarchy Level: 1
-- 
-- {Latency Strategy = "Min"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_inverter_3ph_src_nfp_convert_single2double IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        nfp_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_out                           :   OUT   std_logic_vector(63 DOWNTO 0)  -- ufix64
        );
END uz_inverter_3ph_src_nfp_convert_single2double;


ARCHITECTURE rtl OF uz_inverter_3ph_src_nfp_convert_single2double IS

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
  SIGNAL nfp_in_unsigned                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL inSign                           : std_logic;  -- ufix1
  SIGNAL inExponent                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL inMantissa                       : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Delay12_PS_2_4_reg               : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL Delay12_PS_2_4_reg_next          : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL Delay12_PS_2_4_out1              : std_logic;  -- ufix1
  SIGNAL Constant1_out1                   : std_logic;  -- ufix1
  SIGNAL Switch1_out1                     : std_logic;  -- ufix1
  SIGNAL Delay1_PS_1_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL inExponent_inType_Exponent_out1  : std_logic;  -- ufix1
  SIGNAL Delay13_PS_2_4_reg               : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay13_PS_2_4_reg_next          : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay13_PS_2_4_out1              : std_logic;  -- ufix1
  SIGNAL inExponent_0_out1                : std_logic;  -- ufix1
  SIGNAL Delay2_PS_1_out1                 : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL inMantissa_0_out1                : std_logic;  -- ufix1
  SIGNAL alphainExponent_0_inMantis_out1  : std_logic;  -- ufix1
  SIGNAL Delay14_PS_2_4_reg               : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay14_PS_2_4_reg_next          : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay14_PS_2_4_out1              : std_logic;  -- ufix1
  SIGNAL Exponent_0_out1                  : std_logic;  -- ufix1
  SIGNAL C_out1                           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL if_Exponent_0_out1               : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay8_PS_2_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL inType_ExponentBias_out1         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL int32_storedInteger_ExpCorrect_sub_cast : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL int32_storedInteger_ExpCorrect_sub_cast_1 : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL int32_storedInteger_ExpCorrect_out1 : signed(10 DOWNTO 0);  -- sfix11
  SIGNAL Delay18_PS_3_out1                : signed(10 DOWNTO 0);  -- sfix11
  SIGNAL cfType_ExponentBias_out1         : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL int32_storedInteger_ExpCorrect_add_cast : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL int32_storedInteger_ExpCorrect_add_temp : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL int32_storedInteger_ExpCorrect_out1_1 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL uint8_MantAppended_x_WordLengt_out1 : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Exponent_0_out1_1                : std_logic;  -- ufix1
  SIGNAL cfType_Exponent_Inf_or_NaN_out1  : std_logic;  -- ufix1
  SIGNAL alphaExponent_0_cfType_Exp_out1  : std_logic;  -- ufix1
  SIGNAL alpha1_out1                      : std_logic;  -- ufix1
  SIGNAL Bit_Concat1_out1                 : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL alpha0_out1                      : std_logic;  -- ufix1
  SIGNAL Bit_Concat_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL if_Exponent_0_cfType_Exp_out1    : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay7_PS_2_out1                 : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Slice6_out1                  : unsigned(7 DOWNTO 0);  -- uint8
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
  SIGNAL Bit_Slice1_out1                  : unsigned(7 DOWNTO 0);  -- uint8
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
  SIGNAL Bit_Slice4_out1                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Bit_Slice8_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice7_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Slice6_out1_1                : std_logic;  -- ufix1
  SIGNAL Bit_Slice5_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator3_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice2_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice4_out1_1                : std_logic;  -- ufix1
  SIGNAL Constant_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Bit_Slice1_out1_1                : std_logic;  -- ufix1
  SIGNAL Constant1_out1_1                 : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch2_out1                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Logical_Operator_out1_1          : std_logic;  -- ufix1
  SIGNAL Constant2_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch1_out1_1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant3_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant4_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Logical_Operator2_out1           : std_logic;  -- ufix1
  SIGNAL Switch3_out1                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch4_out1                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant5_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant6_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch6_out1                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant7_out1_1                 : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant8_out1_1                 : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch8_out1                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Logical_Operator12_out1          : std_logic;  -- ufix1
  SIGNAL Switch9_out1                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch10_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant9_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant10_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch12_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant11_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant12_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch15_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch16_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant13_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant14_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch18_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant15_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant16_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch20_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch21_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Logical_Operator12_out1_1        : std_logic;  -- ufix1
  SIGNAL Switch13_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch_out1                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant9_out1_1                 : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant10_out1_1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch12_out1_1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant11_out1_1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant12_out1_1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch15_out1_1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch16_out1_1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant13_out1_1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant14_out1_1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch18_out1_1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant15_out1_1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant16_out1_1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch20_out1_1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch21_out1_1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch13_out1_1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Switch1_out1_2                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Delay17_PS_3_out1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL uint8_MantAppended_x_WordLengt_sub_cast : signed(6 DOWNTO 0);  -- sfix7
  SIGNAL uint8_MantAppended_x_WordLengt_sub_cast_1 : signed(6 DOWNTO 0);  -- sfix7
  SIGNAL uint8_MantAppended_x_WordLengt_sub_temp : signed(6 DOWNTO 0);  -- sfix7
  SIGNAL uint8_MantAppended_x_WordLengt_out1_1 : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL DTC2_out1                        : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL e_int32_shift_length_sub_cast    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL e_int32_shift_length_sub_cast_1  : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL e_int32_shift_length_sub_temp    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL e_int32_shift_length_out1        : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL C11_out1                         : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_inExponent_0_inMantis_Exponent_out1 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL C12_out1                         : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_inExponent_inType_Exponent_Exponent_out1 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Constant2_out1_1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Switch5_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay16_PS_3_out1                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL bitsll_MantAppended_x_shift_l_out1 : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL alpha0_out1_1                    : unsigned(29 DOWNTO 0);  -- ufix30
  SIGNAL Bit_Concat_out1_1                : unsigned(53 DOWNTO 0);  -- ufix54
  SIGNAL Bit_Slice_out1                   : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL C13_out1                         : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL if_inExponent_0_inMantis_Mantissa_out1 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Constant_out1_1                  : unsigned(28 DOWNTO 0);  -- ufix29
  SIGNAL Delay6_PS_2_out1                 : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Bit_Concat1_out1_1               : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Delay15_PS_3_out1                : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL if_inExponent_inType_Exponent_Mantissa_out1 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Constant3_out1_1                 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Switch6_out1_1                   : unsigned(51 DOWNTO 0);  -- ufix52
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

  Constant7_out1 <= to_unsigned(16#02#, 6);

  
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

  nfp_in_unsigned <= unsigned(nfp_in);

  -- Split 32 bit word into FP sign, exponent, mantissa
  inSign <= nfp_in_unsigned(31);
  inExponent <= nfp_in_unsigned(30 DOWNTO 23);
  inMantissa <= nfp_in_unsigned(22 DOWNTO 0);

  Delay12_PS_2_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay12_PS_2_4_reg(0) <= '0';
      Delay12_PS_2_4_reg(1) <= '0';
      Delay12_PS_2_4_reg(2) <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay12_PS_2_4_reg(0) <= Delay12_PS_2_4_reg_next(0);
        Delay12_PS_2_4_reg(1) <= Delay12_PS_2_4_reg_next(1);
        Delay12_PS_2_4_reg(2) <= Delay12_PS_2_4_reg_next(2);
      END IF;
    END IF;
  END PROCESS Delay12_PS_2_4_process;

  Delay12_PS_2_4_out1 <= Delay12_PS_2_4_reg(2);
  Delay12_PS_2_4_reg_next(0) <= inSign;
  Delay12_PS_2_4_reg_next(1) <= Delay12_PS_2_4_reg(0);
  Delay12_PS_2_4_reg_next(2) <= Delay12_PS_2_4_reg(1);

  Constant1_out1 <= '0';

  
  Switch1_out1 <= Delay12_PS_2_4_out1 WHEN Delay1_out1 = '0' ELSE
      Constant1_out1;

  Delay1_PS_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_PS_1_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_PS_1_out1 <= inExponent;
      END IF;
    END IF;
  END PROCESS Delay1_PS_1_process;


  
  inExponent_inType_Exponent_out1 <= '1' WHEN Delay1_PS_1_out1 = to_unsigned(16#FF#, 8) ELSE
      '0';

  Delay13_PS_2_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay13_PS_2_4_reg(0) <= '0';
      Delay13_PS_2_4_reg(1) <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay13_PS_2_4_reg(0) <= Delay13_PS_2_4_reg_next(0);
        Delay13_PS_2_4_reg(1) <= Delay13_PS_2_4_reg_next(1);
      END IF;
    END IF;
  END PROCESS Delay13_PS_2_4_process;

  Delay13_PS_2_4_out1 <= Delay13_PS_2_4_reg(1);
  Delay13_PS_2_4_reg_next(0) <= inExponent_inType_Exponent_out1;
  Delay13_PS_2_4_reg_next(1) <= Delay13_PS_2_4_reg(0);

  
  inExponent_0_out1 <= '1' WHEN Delay1_PS_1_out1 = to_unsigned(16#00#, 8) ELSE
      '0';

  Delay2_PS_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_PS_1_out1 <= to_unsigned(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay2_PS_1_out1 <= inMantissa;
      END IF;
    END IF;
  END PROCESS Delay2_PS_1_process;


  
  inMantissa_0_out1 <= '1' WHEN Delay2_PS_1_out1 = to_unsigned(16#000000#, 23) ELSE
      '0';

  alphainExponent_0_inMantis_out1 <= inExponent_0_out1 AND inMantissa_0_out1;

  Delay14_PS_2_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay14_PS_2_4_reg(0) <= '0';
      Delay14_PS_2_4_reg(1) <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay14_PS_2_4_reg(0) <= Delay14_PS_2_4_reg_next(0);
        Delay14_PS_2_4_reg(1) <= Delay14_PS_2_4_reg_next(1);
      END IF;
    END IF;
  END PROCESS Delay14_PS_2_4_process;

  Delay14_PS_2_4_out1 <= Delay14_PS_2_4_reg(1);
  Delay14_PS_2_4_reg_next(0) <= alphainExponent_0_inMantis_out1;
  Delay14_PS_2_4_reg_next(1) <= Delay14_PS_2_4_reg(0);

  
  Exponent_0_out1 <= '1' WHEN Delay1_PS_1_out1 = to_unsigned(16#00#, 8) ELSE
      '0';

  C_out1 <= to_unsigned(16#01#, 8);

  
  if_Exponent_0_out1 <= Delay1_PS_1_out1 WHEN Exponent_0_out1 = '0' ELSE
      C_out1;

  Delay8_PS_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay8_PS_2_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay8_PS_2_out1 <= if_Exponent_0_out1;
      END IF;
    END IF;
  END PROCESS Delay8_PS_2_process;


  inType_ExponentBias_out1 <= to_unsigned(16#7F#, 8);

  int32_storedInteger_ExpCorrect_sub_cast <= signed(resize(Delay8_PS_2_out1, 9));
  int32_storedInteger_ExpCorrect_sub_cast_1 <= signed(resize(inType_ExponentBias_out1, 9));
  int32_storedInteger_ExpCorrect_out1 <= resize(int32_storedInteger_ExpCorrect_sub_cast - int32_storedInteger_ExpCorrect_sub_cast_1, 11);

  Delay18_PS_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay18_PS_3_out1 <= to_signed(16#000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay18_PS_3_out1 <= int32_storedInteger_ExpCorrect_out1;
      END IF;
    END IF;
  END PROCESS Delay18_PS_3_process;


  cfType_ExponentBias_out1 <= to_unsigned(16#3FF#, 11);

  int32_storedInteger_ExpCorrect_add_cast <= signed(resize(cfType_ExponentBias_out1, 13));
  int32_storedInteger_ExpCorrect_add_temp <= resize(Delay18_PS_3_out1, 13) + int32_storedInteger_ExpCorrect_add_cast;
  int32_storedInteger_ExpCorrect_out1_1 <= unsigned(int32_storedInteger_ExpCorrect_add_temp(10 DOWNTO 0));

  uint8_MantAppended_x_WordLengt_out1 <= to_unsigned(16#18#, 6);

  
  Exponent_0_out1_1 <= '1' WHEN Delay1_PS_1_out1 = to_unsigned(16#00#, 8) ELSE
      '0';

  
  cfType_Exponent_Inf_or_NaN_out1 <= '1' WHEN Delay1_PS_1_out1 = to_unsigned(16#FF#, 8) ELSE
      '0';

  alphaExponent_0_cfType_Exp_out1 <= Exponent_0_out1_1 OR cfType_Exponent_Inf_or_NaN_out1;

  alpha1_out1 <= '1';

  Bit_Concat1_out1 <= alpha1_out1 & Delay2_PS_1_out1;

  alpha0_out1 <= '0';

  Bit_Concat_out1 <= alpha0_out1 & Delay2_PS_1_out1;

  
  if_Exponent_0_cfType_Exp_out1 <= Bit_Concat1_out1 WHEN alphaExponent_0_cfType_Exp_out1 = '0' ELSE
      Bit_Concat_out1;

  Delay7_PS_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay7_PS_2_out1 <= to_unsigned(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay7_PS_2_out1 <= if_Exponent_0_cfType_Exp_out1;
      END IF;
    END IF;
  END PROCESS Delay7_PS_2_process;


  Bit_Slice6_out1 <= Delay7_PS_2_out1(23 DOWNTO 16);

  Bit_Slice16_out1 <= Bit_Slice6_out1(7);

  Bit_Slice15_out1 <= Bit_Slice6_out1(6);

  Logical_Operator5_out1 <= Bit_Slice16_out1 OR Bit_Slice15_out1;

  Bit_Slice14_out1 <= Bit_Slice6_out1(5);

  Bit_Slice13_out1 <= Bit_Slice6_out1(4);

  Logical_Operator7_out1 <= Bit_Slice14_out1 OR Bit_Slice13_out1;

  Logical_Operator6_out1 <= Logical_Operator5_out1 OR Logical_Operator7_out1;

  Bit_Slice12_out1 <= Bit_Slice6_out1(3);

  Bit_Slice11_out1 <= Bit_Slice6_out1(2);

  Logical_Operator4_out1 <= Bit_Slice12_out1 OR Bit_Slice11_out1;

  Bit_Slice10_out1 <= Bit_Slice6_out1(1);

  Bit_Slice9_out1 <= Bit_Slice6_out1(0);

  Logical_Operator14_out1 <= Bit_Slice10_out1 OR Bit_Slice9_out1;

  Logical_Operator13_out1 <= Logical_Operator4_out1 OR Logical_Operator14_out1;

  Bit_Slice1_out1 <= Delay7_PS_2_out1(15 DOWNTO 8);

  Bit_Slice16_out1_1 <= Bit_Slice1_out1(7);

  Bit_Slice15_out1_1 <= Bit_Slice1_out1(6);

  Logical_Operator5_out1_1 <= Bit_Slice16_out1_1 OR Bit_Slice15_out1_1;

  Bit_Slice14_out1_1 <= Bit_Slice1_out1(5);

  Bit_Slice13_out1_1 <= Bit_Slice1_out1(4);

  Logical_Operator7_out1_1 <= Bit_Slice14_out1_1 OR Bit_Slice13_out1_1;

  Logical_Operator6_out1_1 <= Logical_Operator5_out1_1 OR Logical_Operator7_out1_1;

  Bit_Slice12_out1_1 <= Bit_Slice1_out1(3);

  Bit_Slice11_out1_1 <= Bit_Slice1_out1(2);

  Logical_Operator4_out1_1 <= Bit_Slice12_out1_1 OR Bit_Slice11_out1_1;

  Bit_Slice10_out1_1 <= Bit_Slice1_out1(1);

  Bit_Slice9_out1_1 <= Bit_Slice1_out1(0);

  Logical_Operator14_out1_1 <= Bit_Slice10_out1_1 OR Bit_Slice9_out1_1;

  Logical_Operator13_out1_1 <= Logical_Operator4_out1_1 OR Logical_Operator14_out1_1;

  Bit_Slice4_out1 <= Delay7_PS_2_out1(7 DOWNTO 0);

  Bit_Slice8_out1 <= Bit_Slice4_out1(7);

  Bit_Slice7_out1 <= Bit_Slice4_out1(6);

  Logical_Operator1_out1 <= Bit_Slice8_out1 OR Bit_Slice7_out1;

  Bit_Slice6_out1_1 <= Bit_Slice4_out1(5);

  Bit_Slice5_out1 <= Bit_Slice4_out1(4);

  Logical_Operator3_out1 <= Bit_Slice6_out1_1 OR Bit_Slice5_out1;

  Bit_Slice3_out1 <= Bit_Slice4_out1(3);

  Bit_Slice2_out1 <= Bit_Slice4_out1(2);

  Bit_Slice4_out1_1 <= Bit_Slice4_out1(0);

  Constant_out1 <= to_unsigned(16#00#, 6);

  Bit_Slice1_out1_1 <= Bit_Slice4_out1(1);

  Constant1_out1_1 <= to_unsigned(16#01#, 6);

  
  Switch2_out1 <= Constant_out1 WHEN Bit_Slice4_out1_1 = '0' ELSE
      Constant1_out1_1;

  Logical_Operator_out1_1 <= Bit_Slice3_out1 OR Bit_Slice2_out1;

  Constant2_out1 <= to_unsigned(16#02#, 6);

  
  Switch1_out1_1 <= Switch2_out1 WHEN Bit_Slice1_out1_1 = '0' ELSE
      Constant2_out1;

  Constant3_out1 <= to_unsigned(16#03#, 6);

  Constant4_out1 <= to_unsigned(16#04#, 6);

  Logical_Operator2_out1 <= Logical_Operator1_out1 OR Logical_Operator3_out1;

  
  Switch3_out1 <= Constant3_out1 WHEN Bit_Slice3_out1 = '0' ELSE
      Constant4_out1;

  
  Switch4_out1 <= Switch1_out1_1 WHEN Logical_Operator_out1_1 = '0' ELSE
      Switch3_out1;

  Constant5_out1 <= to_unsigned(16#05#, 6);

  Constant6_out1 <= to_unsigned(16#06#, 6);

  
  Switch6_out1 <= Constant5_out1 WHEN Bit_Slice6_out1_1 = '0' ELSE
      Constant6_out1;

  Constant7_out1_1 <= to_unsigned(16#07#, 6);

  Constant8_out1_1 <= to_unsigned(16#08#, 6);

  
  Switch8_out1 <= Constant7_out1_1 WHEN Bit_Slice8_out1 = '0' ELSE
      Constant8_out1_1;

  Logical_Operator12_out1 <= Logical_Operator6_out1_1 OR Logical_Operator13_out1_1;

  
  Switch9_out1 <= Switch6_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      Switch8_out1;

  
  Switch10_out1 <= Switch4_out1 WHEN Logical_Operator2_out1 = '0' ELSE
      Switch9_out1;

  Constant9_out1 <= to_unsigned(16#09#, 6);

  Constant10_out1 <= to_unsigned(16#0A#, 6);

  
  Switch12_out1 <= Constant9_out1 WHEN Bit_Slice10_out1_1 = '0' ELSE
      Constant10_out1;

  Constant11_out1 <= to_unsigned(16#0B#, 6);

  Constant12_out1 <= to_unsigned(16#0C#, 6);

  
  Switch15_out1 <= Constant11_out1 WHEN Bit_Slice12_out1_1 = '0' ELSE
      Constant12_out1;

  
  Switch16_out1 <= Switch12_out1 WHEN Logical_Operator4_out1_1 = '0' ELSE
      Switch15_out1;

  Constant13_out1 <= to_unsigned(16#0D#, 6);

  Constant14_out1 <= to_unsigned(16#0E#, 6);

  
  Switch18_out1 <= Constant13_out1 WHEN Bit_Slice14_out1_1 = '0' ELSE
      Constant14_out1;

  Constant15_out1 <= to_unsigned(16#0F#, 6);

  Constant16_out1 <= to_unsigned(16#10#, 6);

  
  Switch20_out1 <= Constant15_out1 WHEN Bit_Slice16_out1_1 = '0' ELSE
      Constant16_out1;

  
  Switch21_out1 <= Switch18_out1 WHEN Logical_Operator5_out1_1 = '0' ELSE
      Switch20_out1;

  Logical_Operator12_out1_1 <= Logical_Operator6_out1 OR Logical_Operator13_out1;

  
  Switch13_out1 <= Switch16_out1 WHEN Logical_Operator6_out1_1 = '0' ELSE
      Switch21_out1;

  
  Switch_out1 <= Switch10_out1 WHEN Logical_Operator12_out1 = '0' ELSE
      Switch13_out1;

  Constant9_out1_1 <= to_unsigned(16#11#, 6);

  Constant10_out1_1 <= to_unsigned(16#12#, 6);

  
  Switch12_out1_1 <= Constant9_out1_1 WHEN Bit_Slice10_out1 = '0' ELSE
      Constant10_out1_1;

  Constant11_out1_1 <= to_unsigned(16#13#, 6);

  Constant12_out1_1 <= to_unsigned(16#14#, 6);

  
  Switch15_out1_1 <= Constant11_out1_1 WHEN Bit_Slice12_out1 = '0' ELSE
      Constant12_out1_1;

  
  Switch16_out1_1 <= Switch12_out1_1 WHEN Logical_Operator4_out1 = '0' ELSE
      Switch15_out1_1;

  Constant13_out1_1 <= to_unsigned(16#15#, 6);

  Constant14_out1_1 <= to_unsigned(16#16#, 6);

  
  Switch18_out1_1 <= Constant13_out1_1 WHEN Bit_Slice14_out1 = '0' ELSE
      Constant14_out1_1;

  Constant15_out1_1 <= to_unsigned(16#17#, 6);

  Constant16_out1_1 <= to_unsigned(16#18#, 6);

  
  Switch20_out1_1 <= Constant15_out1_1 WHEN Bit_Slice16_out1 = '0' ELSE
      Constant16_out1_1;

  
  Switch21_out1_1 <= Switch18_out1_1 WHEN Logical_Operator5_out1 = '0' ELSE
      Switch20_out1_1;

  
  Switch13_out1_1 <= Switch16_out1_1 WHEN Logical_Operator6_out1 = '0' ELSE
      Switch21_out1_1;

  
  Switch1_out1_2 <= Switch_out1 WHEN Logical_Operator12_out1_1 = '0' ELSE
      Switch13_out1_1;

  Delay17_PS_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay17_PS_3_out1 <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay17_PS_3_out1 <= Switch1_out1_2;
      END IF;
    END IF;
  END PROCESS Delay17_PS_3_process;


  uint8_MantAppended_x_WordLengt_sub_cast <= signed(resize(uint8_MantAppended_x_WordLengt_out1, 7));
  uint8_MantAppended_x_WordLengt_sub_cast_1 <= signed(resize(Delay17_PS_3_out1, 7));
  uint8_MantAppended_x_WordLengt_sub_temp <= uint8_MantAppended_x_WordLengt_sub_cast - uint8_MantAppended_x_WordLengt_sub_cast_1;
  uint8_MantAppended_x_WordLengt_out1_1 <= unsigned(uint8_MantAppended_x_WordLengt_sub_temp(5 DOWNTO 0));

  DTC2_out1 <= resize(uint8_MantAppended_x_WordLengt_out1_1, 11);

  e_int32_shift_length_sub_cast <= signed(resize(int32_storedInteger_ExpCorrect_out1_1, 12));
  e_int32_shift_length_sub_cast_1 <= signed(resize(DTC2_out1, 12));
  e_int32_shift_length_sub_temp <= e_int32_shift_length_sub_cast - e_int32_shift_length_sub_cast_1;
  e_int32_shift_length_out1 <= unsigned(e_int32_shift_length_sub_temp(10 DOWNTO 0));

  C11_out1 <= to_unsigned(16#000#, 11);

  
  if_inExponent_0_inMantis_Exponent_out1 <= e_int32_shift_length_out1 WHEN Delay14_PS_2_4_out1 = '0' ELSE
      C11_out1;

  C12_out1 <= to_unsigned(16#7FF#, 11);

  
  if_inExponent_inType_Exponent_Exponent_out1 <= if_inExponent_0_inMantis_Exponent_out1 WHEN Delay13_PS_2_4_out1 = '0' ELSE
      C12_out1;

  Constant2_out1_1 <= to_unsigned(16#000#, 11);

  
  Switch5_out1 <= if_inExponent_inType_Exponent_Exponent_out1 WHEN Delay1_out1 = '0' ELSE
      Constant2_out1_1;

  Delay16_PS_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay16_PS_3_out1 <= to_unsigned(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay16_PS_3_out1 <= Delay7_PS_2_out1;
      END IF;
    END IF;
  END PROCESS Delay16_PS_3_process;


  bitsll_MantAppended_x_shift_l_out1 <= Delay16_PS_3_out1 sll to_integer(uint8_MantAppended_x_WordLengt_out1_1);

  alpha0_out1_1 <= to_unsigned(16#00000000#, 30);

  Bit_Concat_out1_1 <= bitsll_MantAppended_x_shift_l_out1 & alpha0_out1_1;

  Bit_Slice_out1 <= Bit_Concat_out1_1(52 DOWNTO 1);

  C13_out1 <= to_unsigned(0, 52);

  
  if_inExponent_0_inMantis_Mantissa_out1 <= Bit_Slice_out1 WHEN Delay14_PS_2_4_out1 = '0' ELSE
      C13_out1;

  Constant_out1_1 <= to_unsigned(16#00000000#, 29);

  Delay6_PS_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay6_PS_2_out1 <= to_unsigned(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay6_PS_2_out1 <= Delay2_PS_1_out1;
      END IF;
    END IF;
  END PROCESS Delay6_PS_2_process;


  Bit_Concat1_out1_1 <= Constant_out1_1 & Delay6_PS_2_out1;

  Delay15_PS_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay15_PS_3_out1 <= to_unsigned(0, 52);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay15_PS_3_out1 <= Bit_Concat1_out1_1;
      END IF;
    END IF;
  END PROCESS Delay15_PS_3_process;


  
  if_inExponent_inType_Exponent_Mantissa_out1 <= if_inExponent_0_inMantis_Mantissa_out1 WHEN Delay13_PS_2_4_out1 = '0' ELSE
      Delay15_PS_3_out1;

  Constant3_out1_1 <= to_unsigned(0, 52);

  
  Switch6_out1_1 <= if_inExponent_inType_Exponent_Mantissa_out1 WHEN Delay1_out1 = '0' ELSE
      Constant3_out1_1;

  -- Combine FP sign, exponent, mantissa into 64 bit word
  nfp_out_pack <= Switch1_out1 & Switch5_out1 & Switch6_out1_1;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

