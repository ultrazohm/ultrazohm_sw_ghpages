-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_pmsm_model/uz_pmsm_m_ip_src_nfp_mul_double.vhd
-- Created: 2021-06-17 18:10:50
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_pmsm_m_ip_src_nfp_mul_double
-- Source Path: uz_pmsm_model/uz_pmsm_model/nfp_mul_double
-- Hierarchy Level: 1
-- 
-- {Latency Strategy = "Max", Denormal Handling = "off"}
-- {Mantissa Multiply Strategy = "FullMultiplier"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_pmsm_m_ip_src_uz_pmsm_model_pkg.ALL;

ENTITY uz_pmsm_m_ip_src_nfp_mul_double IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        nfp_in1                           :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        nfp_in2                           :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        nfp_out                           :   OUT   std_logic_vector(63 DOWNTO 0)  -- ufix64
        );
END uz_pmsm_m_ip_src_nfp_mul_double;


ARCHITECTURE rtl OF uz_pmsm_m_ip_src_nfp_mul_double IS

  -- Signals
  SIGNAL nfp_in1_unsigned                 : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL aSign                            : std_logic;  -- ufix1
  SIGNAL aExponent                        : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL aMantissa                        : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Delay4_PS_1_out1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL aExponent_cfType_Exponent_I_out1 : std_logic;  -- ufix1
  SIGNAL nfp_in2_unsigned                 : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL bSign                            : std_logic;  -- ufix1
  SIGNAL bExponent                        : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL bMantissa                        : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Delay1_PS_1_out1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL bExponent_cfType_Exponent_I_out1 : std_logic;  -- ufix1
  SIGNAL alphaaExpInforNaN_bExpInforNa_out1 : std_logic;  -- ufix1
  SIGNAL Delay5_PS_1_out1                 : std_logic;  -- ufix1
  SIGNAL Delay2_PS_1_out1                 : std_logic;  -- ufix1
  SIGNAL tmp_out1                         : std_logic;  -- ufix1
  SIGNAL Compare_To_Zero_out1             : std_logic;  -- ufix1
  SIGNAL Delay_PS_1_out1                  : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Constant_out1                    : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Switch_out1                      : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL bMantissa_0_out1                 : std_logic;  -- ufix1
  SIGNAL if_bMantZero_out1                : std_logic;  -- ufix1
  SIGNAL Compare_To_Zero_out1_1           : std_logic;  -- ufix1
  SIGNAL Delay3_PS_1_out1                 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Constant_out1_1                  : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Switch_out1_1                    : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL aMantissa_0_out1                 : std_logic;  -- ufix1
  SIGNAL if_aMantZero_out1                : std_logic;  -- ufix1
  SIGNAL if_aExpInforNaN_1_out1           : std_logic;  -- ufix1
  SIGNAL if_aExpInforNaN_bExpInforNa_2_out1 : std_logic;  -- ufix1
  SIGNAL Delay6_PS_9_reg                  : std_logic_vector(0 TO 7);  -- ufix1 [8]
  SIGNAL Delay6_PS_9_reg_next             : std_logic_vector(0 TO 7);  -- ufix1 [8]
  SIGNAL Delay6_PS_9_out1                 : std_logic;  -- ufix1
  SIGNAL Delay11_PS_2_8_reg               : std_logic_vector(0 TO 6);  -- ufix1 [7]
  SIGNAL Delay11_PS_2_8_reg_next          : std_logic_vector(0 TO 6);  -- ufix1 [7]
  SIGNAL Delay11_PS_2_8_out1              : std_logic;  -- ufix1
  SIGNAL alphaaExponent_0_aMantZero_out1  : std_logic;  -- ufix1
  SIGNAL alphabExponent_0_bMantZero_out1  : std_logic;  -- ufix1
  SIGNAL alphaaIsZero_bIsZero_out1        : std_logic;  -- ufix1
  SIGNAL Delay10_PS_2_8_reg               : std_logic_vector(0 TO 6);  -- ufix1 [7]
  SIGNAL Delay10_PS_2_8_reg_next          : std_logic_vector(0 TO 6);  -- ufix1 [7]
  SIGNAL Delay10_PS_2_8_out1              : std_logic;  -- ufix1
  SIGNAL alpha1_out1                      : std_logic;  -- ufix1
  SIGNAL alpha0_out1                      : std_logic;  -- ufix1
  SIGNAL if_Exponent_0_cfType_Exp_out1    : std_logic;  -- ufix1
  SIGNAL Bit_Concat_out1                  : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL Delay_PS_3_out1                  : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL alpha1_out1_1                    : std_logic;  -- ufix1
  SIGNAL alpha0_out1_1                    : std_logic;  -- ufix1
  SIGNAL if_Exponent_0_cfType_Exp_out1_1  : std_logic;  -- ufix1
  SIGNAL Bit_Concat_out1_1                : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL Delay1_PS_3_out1                 : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL z2_out1                          : unsigned(105 DOWNTO 0);  -- ufix106
  SIGNAL Delay2_PS_4_7_reg                : vector_of_unsigned106(0 TO 3);  -- ufix106 [4]
  SIGNAL Delay2_PS_4_7_reg_next           : vector_of_unsigned106(0 TO 3);  -- ufix106 [4]
  SIGNAL Delay2_PS_4_7_out1               : unsigned(105 DOWNTO 0);  -- ufix106
  SIGNAL BitSlice1_out1                   : std_logic;  -- ufix1
  SIGNAL Constant_out1_2                  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL C_out1                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_Exponent_0_out1               : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Bit_Concat_out1_2                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL DTC_out1                         : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL Delay4_PS_3_out1                 : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL Constant_out1_3                  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL C_out1_1                         : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_Exponent_0_out1_1             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Bit_Concat_out1_3                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL DTC_out1_1                       : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL Delay5_PS_3_out1                 : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL exp_a_norm_exp_b_norm_out1       : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL Delay1_PS_4_5_reg                : vector_of_signed14(0 TO 1);  -- sfix14 [2]
  SIGNAL Delay1_PS_4_5_reg_next           : vector_of_signed14(0 TO 1);  -- sfix14 [2]
  SIGNAL Delay1_PS_4_5_out1               : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL C2_out1                          : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL exp_sum_cfType_ExponentBias_out1 : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL Delay3_PS_6_out1                 : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL exp_out_cast_cfType_Exponen_out1 : std_logic;  -- ufix1
  SIGNAL Delay1_PS_7_out1                 : std_logic;  -- ufix1
  SIGNAL exp_out_cast_cfType_Exponen_1_out1 : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1           : std_logic;  -- ufix1
  SIGNAL Delay4_PS_7_out1                 : std_logic;  -- ufix1
  SIGNAL if_bitget_mant_ext_mant_ext_Word_2_out1 : std_logic;  -- ufix1
  SIGNAL exp_negative_out1                : std_logic;  -- ufix1
  SIGNAL Delay2_PS_7_out1                 : std_logic;  -- ufix1
  SIGNAL exp_out_cast_cfType_Exponen_2_out1 : std_logic;  -- ufix1
  SIGNAL Logical_Operator4_out1           : std_logic;  -- ufix1
  SIGNAL Delay8_PS_7_out1                 : std_logic;  -- ufix1
  SIGNAL if_bitget_mant_ext_mant_ext_Word_4_out1 : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1            : std_logic;  -- ufix1
  SIGNAL exp_out_is_zero_out1             : std_logic;  -- ufix1
  SIGNAL Logical_Operator3_out1           : std_logic;  -- ufix1
  SIGNAL Delay6_PS_7_out1                 : std_logic;  -- ufix1
  SIGNAL if_bitget_mant_ext_mant_ext_Word_3_out1 : std_logic;  -- ufix1
  SIGNAL Bit_Slice1_out1                  : unsigned(53 DOWNTO 0);  -- ufix54
  SIGNAL Bit_Slice_out1                   : unsigned(53 DOWNTO 0);  -- ufix54
  SIGNAL if_bitget_mant_ext_mant_ext_Word_1_out1 : unsigned(53 DOWNTO 0);  -- ufix54
  SIGNAL BitSlice_out1                    : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL BitSlice2_out1                   : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL const_0_out1                     : std_logic;  -- ufix1
  SIGNAL if_exp_out_cast_cfType_Expone_2_out1 : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL C5_out1                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL C5_out1_dtc                      : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL if_exp_out_cast_cfType_Expone_1_out1 : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL Bit_Concat_out1_4                : unsigned(53 DOWNTO 0);  -- ufix54
  SIGNAL BitSlice_out1_1                  : std_logic;  -- ufix1
  SIGNAL BitSlice1_out1_1                 : std_logic;  -- ufix1
  SIGNAL Delay3_PS_8_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Slice2_out1                  : unsigned(50 DOWNTO 0);  -- ufix51
  SIGNAL Compare_To_Zero_out1_2           : std_logic;  -- ufix1
  SIGNAL BitSlice52ndBitS                 : std_logic;  -- ufix1
  SIGNAL LogicalOperatorAndOutS           : std_logic;  -- ufix1
  SIGNAL LogicalOperatorOrOutS            : std_logic;  -- ufix1
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator2_out1           : std_logic;  -- ufix1
  SIGNAL if_exp_out_cast_cfType_Expone_3_out1 : std_logic;  -- ufix1
  SIGNAL Delay2_PS_8_out1                 : std_logic;  -- ufix1
  SIGNAL Delay2_PS_8_out1_1               : std_logic;  -- ufix1
  SIGNAL alphabitget_Mant_tmp_2_0_out1    : std_logic;  -- ufix1
  SIGNAL alphabitget_Mant_tmp_1_0_out1    : std_logic;  -- ufix1
  SIGNAL Delay4_PS_2N_out1                : std_logic;  -- ufix1
  SIGNAL BitSlice4_out1                   : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL Delay1_PS_8_out1                 : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL Delay2_PS_2N_out1                : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL const_2_out1                     : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL Mant_tmp_Incr_2_out1             : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL Delay3_PS_2N_out1                : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL if_bitget_Mant_tmp_1_0_out1      : unsigned(52 DOWNTO 0);  -- ufix53
  SIGNAL BitSlice2_out1_1                 : std_logic;  -- ufix1
  SIGNAL Delay12_PS_7_out1                : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL C1_out1                          : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Add_add_cast                     : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL Add_add_temp                     : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL Add_out1                         : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL Delay7_PS_7_out1                 : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL if_exp_out_cast_cfType_Expone_4_out1 : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL Bit_Slice4_out1                  : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL C2_out1_1                        : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_exp_out_cfType_MantissaLen_out1 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL C4_out1                          : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_exp_out_cast_cfType_Expone_out1 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay_PS_8_out1                  : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay1_PS_2N_out1                : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL const_1_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Exp_Incr_out1                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay_PS_2N_out1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_bitget_Mant_tmp_Mant_tmp_Wor_out1 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL C_out1_2                         : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_aIsZero_bIsZero_out1          : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL C2_out1_2                        : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL if_aExpInforNaN_bExpInforNa_out1 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay7_PS_9_out1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Compare_To_Zero_out1_3           : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1_1          : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1_2          : std_logic;  -- ufix1
  SIGNAL BitSlice3_out1                   : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL C1_out1_1                        : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL if_aIsZero_bIsZero_1_out1        : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL C1_out1_2                        : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL if_aIsZero_out1                  : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL C_out1_3                         : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL if_bIsZero_out1                  : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL if_aExpInforNaN_out1             : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Delay9_PS_2_8_reg                : vector_of_unsigned52(0 TO 6);  -- ufix52 [7]
  SIGNAL Delay9_PS_2_8_reg_next           : vector_of_unsigned52(0 TO 6);  -- ufix52 [7]
  SIGNAL Delay9_PS_2_8_out1               : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL if_aExpInforNaN_bExpInforNa_1_out1 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Delay8_PS_9_out1                 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL nfp_out_pack                     : unsigned(63 DOWNTO 0);  -- ufix64

BEGIN
  nfp_in1_unsigned <= unsigned(nfp_in1);

  -- Split 64 bit word into FP sign, exponent, mantissa
  aSign <= nfp_in1_unsigned(63);
  aExponent <= nfp_in1_unsigned(62 DOWNTO 52);
  aMantissa <= nfp_in1_unsigned(51 DOWNTO 0);

  Delay4_PS_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay4_PS_1_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb = '1' THEN
        Delay4_PS_1_out1 <= aExponent;
      END IF;
    END IF;
  END PROCESS Delay4_PS_1_process;


  
  aExponent_cfType_Exponent_I_out1 <= '1' WHEN Delay4_PS_1_out1 = to_unsigned(16#7FF#, 11) ELSE
      '0';

  nfp_in2_unsigned <= unsigned(nfp_in2);

  -- Split 64 bit word into FP sign, exponent, mantissa
  bSign <= nfp_in2_unsigned(63);
  bExponent <= nfp_in2_unsigned(62 DOWNTO 52);
  bMantissa <= nfp_in2_unsigned(51 DOWNTO 0);

  Delay1_PS_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_PS_1_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb = '1' THEN
        Delay1_PS_1_out1 <= bExponent;
      END IF;
    END IF;
  END PROCESS Delay1_PS_1_process;


  
  bExponent_cfType_Exponent_I_out1 <= '1' WHEN Delay1_PS_1_out1 = to_unsigned(16#7FF#, 11) ELSE
      '0';

  alphaaExpInforNaN_bExpInforNa_out1 <= aExponent_cfType_Exponent_I_out1 OR bExponent_cfType_Exponent_I_out1;

  Delay5_PS_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay5_PS_1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay5_PS_1_out1 <= aSign;
      END IF;
    END IF;
  END PROCESS Delay5_PS_1_process;


  Delay2_PS_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_PS_1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay2_PS_1_out1 <= bSign;
      END IF;
    END IF;
  END PROCESS Delay2_PS_1_process;


  tmp_out1 <= Delay5_PS_1_out1 XOR Delay2_PS_1_out1;

  
  Compare_To_Zero_out1 <= '1' WHEN Delay1_PS_1_out1 = to_unsigned(16#000#, 11) ELSE
      '0';

  Delay_PS_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_PS_1_out1 <= to_unsigned(0, 52);
      ELSIF enb = '1' THEN
        Delay_PS_1_out1 <= bMantissa;
      END IF;
    END IF;
  END PROCESS Delay_PS_1_process;


  Constant_out1 <= to_unsigned(0, 52);

  
  Switch_out1 <= Delay_PS_1_out1 WHEN Compare_To_Zero_out1 = '0' ELSE
      Constant_out1;

  
  bMantissa_0_out1 <= '1' WHEN Switch_out1 = to_unsigned(0, 52) ELSE
      '0';

  
  if_bMantZero_out1 <= Delay2_PS_1_out1 WHEN bMantissa_0_out1 = '0' ELSE
      tmp_out1;

  
  Compare_To_Zero_out1_1 <= '1' WHEN Delay4_PS_1_out1 = to_unsigned(16#000#, 11) ELSE
      '0';

  Delay3_PS_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay3_PS_1_out1 <= to_unsigned(0, 52);
      ELSIF enb = '1' THEN
        Delay3_PS_1_out1 <= aMantissa;
      END IF;
    END IF;
  END PROCESS Delay3_PS_1_process;


  Constant_out1_1 <= to_unsigned(0, 52);

  
  Switch_out1_1 <= Delay3_PS_1_out1 WHEN Compare_To_Zero_out1_1 = '0' ELSE
      Constant_out1_1;

  
  aMantissa_0_out1 <= '1' WHEN Switch_out1_1 = to_unsigned(0, 52) ELSE
      '0';

  
  if_aMantZero_out1 <= Delay5_PS_1_out1 WHEN aMantissa_0_out1 = '0' ELSE
      tmp_out1;

  
  if_aExpInforNaN_1_out1 <= if_bMantZero_out1 WHEN aExponent_cfType_Exponent_I_out1 = '0' ELSE
      if_aMantZero_out1;

  
  if_aExpInforNaN_bExpInforNa_2_out1 <= tmp_out1 WHEN alphaaExpInforNaN_bExpInforNa_out1 = '0' ELSE
      if_aExpInforNaN_1_out1;

  Delay6_PS_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay6_PS_9_reg(0) <= '0';
        Delay6_PS_9_reg(1) <= '0';
        Delay6_PS_9_reg(2) <= '0';
        Delay6_PS_9_reg(3) <= '0';
        Delay6_PS_9_reg(4) <= '0';
        Delay6_PS_9_reg(5) <= '0';
        Delay6_PS_9_reg(6) <= '0';
        Delay6_PS_9_reg(7) <= '0';
      ELSIF enb = '1' THEN
        Delay6_PS_9_reg(0) <= Delay6_PS_9_reg_next(0);
        Delay6_PS_9_reg(1) <= Delay6_PS_9_reg_next(1);
        Delay6_PS_9_reg(2) <= Delay6_PS_9_reg_next(2);
        Delay6_PS_9_reg(3) <= Delay6_PS_9_reg_next(3);
        Delay6_PS_9_reg(4) <= Delay6_PS_9_reg_next(4);
        Delay6_PS_9_reg(5) <= Delay6_PS_9_reg_next(5);
        Delay6_PS_9_reg(6) <= Delay6_PS_9_reg_next(6);
        Delay6_PS_9_reg(7) <= Delay6_PS_9_reg_next(7);
      END IF;
    END IF;
  END PROCESS Delay6_PS_9_process;

  Delay6_PS_9_out1 <= Delay6_PS_9_reg(7);
  Delay6_PS_9_reg_next(0) <= if_aExpInforNaN_bExpInforNa_2_out1;
  Delay6_PS_9_reg_next(1) <= Delay6_PS_9_reg(0);
  Delay6_PS_9_reg_next(2) <= Delay6_PS_9_reg(1);
  Delay6_PS_9_reg_next(3) <= Delay6_PS_9_reg(2);
  Delay6_PS_9_reg_next(4) <= Delay6_PS_9_reg(3);
  Delay6_PS_9_reg_next(5) <= Delay6_PS_9_reg(4);
  Delay6_PS_9_reg_next(6) <= Delay6_PS_9_reg(5);
  Delay6_PS_9_reg_next(7) <= Delay6_PS_9_reg(6);

  Delay11_PS_2_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay11_PS_2_8_reg(0) <= '0';
        Delay11_PS_2_8_reg(1) <= '0';
        Delay11_PS_2_8_reg(2) <= '0';
        Delay11_PS_2_8_reg(3) <= '0';
        Delay11_PS_2_8_reg(4) <= '0';
        Delay11_PS_2_8_reg(5) <= '0';
        Delay11_PS_2_8_reg(6) <= '0';
      ELSIF enb = '1' THEN
        Delay11_PS_2_8_reg(0) <= Delay11_PS_2_8_reg_next(0);
        Delay11_PS_2_8_reg(1) <= Delay11_PS_2_8_reg_next(1);
        Delay11_PS_2_8_reg(2) <= Delay11_PS_2_8_reg_next(2);
        Delay11_PS_2_8_reg(3) <= Delay11_PS_2_8_reg_next(3);
        Delay11_PS_2_8_reg(4) <= Delay11_PS_2_8_reg_next(4);
        Delay11_PS_2_8_reg(5) <= Delay11_PS_2_8_reg_next(5);
        Delay11_PS_2_8_reg(6) <= Delay11_PS_2_8_reg_next(6);
      END IF;
    END IF;
  END PROCESS Delay11_PS_2_8_process;

  Delay11_PS_2_8_out1 <= Delay11_PS_2_8_reg(6);
  Delay11_PS_2_8_reg_next(0) <= alphaaExpInforNaN_bExpInforNa_out1;
  Delay11_PS_2_8_reg_next(1) <= Delay11_PS_2_8_reg(0);
  Delay11_PS_2_8_reg_next(2) <= Delay11_PS_2_8_reg(1);
  Delay11_PS_2_8_reg_next(3) <= Delay11_PS_2_8_reg(2);
  Delay11_PS_2_8_reg_next(4) <= Delay11_PS_2_8_reg(3);
  Delay11_PS_2_8_reg_next(5) <= Delay11_PS_2_8_reg(4);
  Delay11_PS_2_8_reg_next(6) <= Delay11_PS_2_8_reg(5);

  alphaaExponent_0_aMantZero_out1 <= Compare_To_Zero_out1_1 AND aMantissa_0_out1;

  alphabExponent_0_bMantZero_out1 <= Compare_To_Zero_out1 AND bMantissa_0_out1;

  alphaaIsZero_bIsZero_out1 <= alphaaExponent_0_aMantZero_out1 OR alphabExponent_0_bMantZero_out1;

  Delay10_PS_2_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay10_PS_2_8_reg(0) <= '0';
        Delay10_PS_2_8_reg(1) <= '0';
        Delay10_PS_2_8_reg(2) <= '0';
        Delay10_PS_2_8_reg(3) <= '0';
        Delay10_PS_2_8_reg(4) <= '0';
        Delay10_PS_2_8_reg(5) <= '0';
        Delay10_PS_2_8_reg(6) <= '0';
      ELSIF enb = '1' THEN
        Delay10_PS_2_8_reg(0) <= Delay10_PS_2_8_reg_next(0);
        Delay10_PS_2_8_reg(1) <= Delay10_PS_2_8_reg_next(1);
        Delay10_PS_2_8_reg(2) <= Delay10_PS_2_8_reg_next(2);
        Delay10_PS_2_8_reg(3) <= Delay10_PS_2_8_reg_next(3);
        Delay10_PS_2_8_reg(4) <= Delay10_PS_2_8_reg_next(4);
        Delay10_PS_2_8_reg(5) <= Delay10_PS_2_8_reg_next(5);
        Delay10_PS_2_8_reg(6) <= Delay10_PS_2_8_reg_next(6);
      END IF;
    END IF;
  END PROCESS Delay10_PS_2_8_process;

  Delay10_PS_2_8_out1 <= Delay10_PS_2_8_reg(6);
  Delay10_PS_2_8_reg_next(0) <= alphaaIsZero_bIsZero_out1;
  Delay10_PS_2_8_reg_next(1) <= Delay10_PS_2_8_reg(0);
  Delay10_PS_2_8_reg_next(2) <= Delay10_PS_2_8_reg(1);
  Delay10_PS_2_8_reg_next(3) <= Delay10_PS_2_8_reg(2);
  Delay10_PS_2_8_reg_next(4) <= Delay10_PS_2_8_reg(3);
  Delay10_PS_2_8_reg_next(5) <= Delay10_PS_2_8_reg(4);
  Delay10_PS_2_8_reg_next(6) <= Delay10_PS_2_8_reg(5);

  alpha1_out1 <= '1';

  alpha0_out1 <= '0';

  
  if_Exponent_0_cfType_Exp_out1 <= alpha1_out1 WHEN Compare_To_Zero_out1_1 = '0' ELSE
      alpha0_out1;

  Bit_Concat_out1 <= if_Exponent_0_cfType_Exp_out1 & Switch_out1_1;

  Delay_PS_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_PS_3_out1 <= to_unsigned(0, 53);
      ELSIF enb = '1' THEN
        Delay_PS_3_out1 <= Bit_Concat_out1;
      END IF;
    END IF;
  END PROCESS Delay_PS_3_process;


  alpha1_out1_1 <= '1';

  alpha0_out1_1 <= '0';

  
  if_Exponent_0_cfType_Exp_out1_1 <= alpha1_out1_1 WHEN Compare_To_Zero_out1 = '0' ELSE
      alpha0_out1_1;

  Bit_Concat_out1_1 <= if_Exponent_0_cfType_Exp_out1_1 & Switch_out1;

  Delay1_PS_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_PS_3_out1 <= to_unsigned(0, 53);
      ELSIF enb = '1' THEN
        Delay1_PS_3_out1 <= Bit_Concat_out1_1;
      END IF;
    END IF;
  END PROCESS Delay1_PS_3_process;


  z2_out1 <= Delay_PS_3_out1 * Delay1_PS_3_out1;

  Delay2_PS_4_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_PS_4_7_reg(0) <= to_unsigned(0, 106);
        Delay2_PS_4_7_reg(1) <= to_unsigned(0, 106);
        Delay2_PS_4_7_reg(2) <= to_unsigned(0, 106);
        Delay2_PS_4_7_reg(3) <= to_unsigned(0, 106);
      ELSIF enb = '1' THEN
        Delay2_PS_4_7_reg(0) <= Delay2_PS_4_7_reg_next(0);
        Delay2_PS_4_7_reg(1) <= Delay2_PS_4_7_reg_next(1);
        Delay2_PS_4_7_reg(2) <= Delay2_PS_4_7_reg_next(2);
        Delay2_PS_4_7_reg(3) <= Delay2_PS_4_7_reg_next(3);
      END IF;
    END IF;
  END PROCESS Delay2_PS_4_7_process;

  Delay2_PS_4_7_out1 <= Delay2_PS_4_7_reg(3);
  Delay2_PS_4_7_reg_next(0) <= z2_out1;
  Delay2_PS_4_7_reg_next(1) <= Delay2_PS_4_7_reg(0);
  Delay2_PS_4_7_reg_next(2) <= Delay2_PS_4_7_reg(1);
  Delay2_PS_4_7_reg_next(3) <= Delay2_PS_4_7_reg(2);

  BitSlice1_out1 <= Delay2_PS_4_7_out1(105);

  Constant_out1_2 <= to_unsigned(16#0#, 3);

  C_out1 <= to_unsigned(16#001#, 11);

  
  if_Exponent_0_out1 <= Delay4_PS_1_out1 WHEN Compare_To_Zero_out1_1 = '0' ELSE
      C_out1;

  Bit_Concat_out1_2 <= Constant_out1_2 & if_Exponent_0_out1;

  DTC_out1 <= signed(Bit_Concat_out1_2);

  Delay4_PS_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay4_PS_3_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay4_PS_3_out1 <= DTC_out1;
      END IF;
    END IF;
  END PROCESS Delay4_PS_3_process;


  Constant_out1_3 <= to_unsigned(16#0#, 3);

  C_out1_1 <= to_unsigned(16#001#, 11);

  
  if_Exponent_0_out1_1 <= Delay1_PS_1_out1 WHEN Compare_To_Zero_out1 = '0' ELSE
      C_out1_1;

  Bit_Concat_out1_3 <= Constant_out1_3 & if_Exponent_0_out1_1;

  DTC_out1_1 <= signed(Bit_Concat_out1_3);

  Delay5_PS_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay5_PS_3_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay5_PS_3_out1 <= DTC_out1_1;
      END IF;
    END IF;
  END PROCESS Delay5_PS_3_process;


  exp_a_norm_exp_b_norm_out1 <= Delay4_PS_3_out1 + Delay5_PS_3_out1;

  Delay1_PS_4_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_PS_4_5_reg(0) <= to_signed(16#0000#, 14);
        Delay1_PS_4_5_reg(1) <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay1_PS_4_5_reg(0) <= Delay1_PS_4_5_reg_next(0);
        Delay1_PS_4_5_reg(1) <= Delay1_PS_4_5_reg_next(1);
      END IF;
    END IF;
  END PROCESS Delay1_PS_4_5_process;

  Delay1_PS_4_5_out1 <= Delay1_PS_4_5_reg(1);
  Delay1_PS_4_5_reg_next(0) <= exp_a_norm_exp_b_norm_out1;
  Delay1_PS_4_5_reg_next(1) <= Delay1_PS_4_5_reg(0);

  C2_out1 <= to_signed(-16#03FF#, 14);

  exp_sum_cfType_ExponentBias_out1 <= Delay1_PS_4_5_out1 + C2_out1;

  Delay3_PS_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay3_PS_6_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay3_PS_6_out1 <= exp_sum_cfType_ExponentBias_out1;
      END IF;
    END IF;
  END PROCESS Delay3_PS_6_process;


  
  exp_out_cast_cfType_Exponen_out1 <= '1' WHEN Delay3_PS_6_out1 > to_signed(16#07FE#, 14) ELSE
      '0';

  Delay1_PS_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_PS_7_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay1_PS_7_out1 <= exp_out_cast_cfType_Exponen_out1;
      END IF;
    END IF;
  END PROCESS Delay1_PS_7_process;


  
  exp_out_cast_cfType_Exponen_1_out1 <= '1' WHEN Delay3_PS_6_out1 = to_signed(16#07FE#, 14) ELSE
      '0';

  Logical_Operator1_out1 <= exp_out_cast_cfType_Exponen_1_out1 OR exp_out_cast_cfType_Exponen_out1;

  Delay4_PS_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay4_PS_7_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_PS_7_out1 <= Logical_Operator1_out1;
      END IF;
    END IF;
  END PROCESS Delay4_PS_7_process;


  
  if_bitget_mant_ext_mant_ext_Word_2_out1 <= Delay1_PS_7_out1 WHEN BitSlice1_out1 = '0' ELSE
      Delay4_PS_7_out1;

  exp_negative_out1 <= Delay3_PS_6_out1(13);

  Delay2_PS_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_PS_7_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay2_PS_7_out1 <= exp_negative_out1;
      END IF;
    END IF;
  END PROCESS Delay2_PS_7_process;


  
  exp_out_cast_cfType_Exponen_2_out1 <= '1' WHEN Delay3_PS_6_out1 /= to_signed(-16#0001#, 14) ELSE
      '0';

  Logical_Operator4_out1 <= exp_out_cast_cfType_Exponen_2_out1 AND exp_negative_out1;

  Delay8_PS_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay8_PS_7_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay8_PS_7_out1 <= Logical_Operator4_out1;
      END IF;
    END IF;
  END PROCESS Delay8_PS_7_process;


  
  if_bitget_mant_ext_mant_ext_Word_4_out1 <= Delay2_PS_7_out1 WHEN BitSlice1_out1 = '0' ELSE
      Delay8_PS_7_out1;

  Logical_Operator_out1 <= if_bitget_mant_ext_mant_ext_Word_2_out1 OR if_bitget_mant_ext_mant_ext_Word_4_out1;

  
  exp_out_is_zero_out1 <= '1' WHEN Delay3_PS_6_out1 = to_signed(16#0000#, 14) ELSE
      '0';

  Logical_Operator3_out1 <= exp_negative_out1 OR exp_out_is_zero_out1;

  Delay6_PS_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay6_PS_7_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay6_PS_7_out1 <= Logical_Operator3_out1;
      END IF;
    END IF;
  END PROCESS Delay6_PS_7_process;


  
  if_bitget_mant_ext_mant_ext_Word_3_out1 <= Delay6_PS_7_out1 WHEN BitSlice1_out1 = '0' ELSE
      Delay2_PS_7_out1;

  Bit_Slice1_out1 <= Delay2_PS_4_7_out1(104 DOWNTO 51);

  Bit_Slice_out1 <= Delay2_PS_4_7_out1(105 DOWNTO 52);

  
  if_bitget_mant_ext_mant_ext_Word_1_out1 <= Bit_Slice1_out1 WHEN BitSlice1_out1 = '0' ELSE
      Bit_Slice_out1;

  BitSlice_out1 <= if_bitget_mant_ext_mant_ext_Word_1_out1(52 DOWNTO 0);

  BitSlice2_out1 <= if_bitget_mant_ext_mant_ext_Word_1_out1(53 DOWNTO 1);

  const_0_out1 <= '0';

  
  if_exp_out_cast_cfType_Expone_2_out1 <= BitSlice_out1 WHEN if_bitget_mant_ext_mant_ext_Word_3_out1 = '0' ELSE
      BitSlice2_out1;

  C5_out1 <= to_unsigned(16#000000#, 24);

  C5_out1_dtc <= resize(C5_out1, 53);

  
  if_exp_out_cast_cfType_Expone_1_out1 <= if_exp_out_cast_cfType_Expone_2_out1 WHEN Logical_Operator_out1 = '0' ELSE
      C5_out1_dtc;

  Bit_Concat_out1_4 <= const_0_out1 & if_exp_out_cast_cfType_Expone_1_out1;

  BitSlice_out1_1 <= Bit_Concat_out1_4(0);

  BitSlice1_out1_1 <= Bit_Concat_out1_4(1);

  Delay3_PS_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay3_PS_8_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_PS_8_out1 <= BitSlice1_out1_1;
      END IF;
    END IF;
  END PROCESS Delay3_PS_8_process;


  Bit_Slice2_out1 <= Delay2_PS_4_7_out1(50 DOWNTO 0);

  
  Compare_To_Zero_out1_2 <= '1' WHEN Bit_Slice2_out1 /= to_unsigned(0, 51) ELSE
      '0';

  BitSlice52ndBitS <= Delay2_PS_4_7_out1(51);

  LogicalOperatorAndOutS <= BitSlice1_out1 AND BitSlice52ndBitS;

  LogicalOperatorOrOutS <= Compare_To_Zero_out1_2 OR LogicalOperatorAndOutS;

  Bit_Slice3_out1 <= if_bitget_mant_ext_mant_ext_Word_1_out1(0);

  Logical_Operator2_out1 <= LogicalOperatorOrOutS OR Bit_Slice3_out1;

  
  if_exp_out_cast_cfType_Expone_3_out1 <= LogicalOperatorOrOutS WHEN if_bitget_mant_ext_mant_ext_Word_3_out1 = '0' ELSE
      Logical_Operator2_out1;

  Delay2_PS_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_PS_8_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay2_PS_8_out1 <= BitSlice_out1_1;
      END IF;
    END IF;
  END PROCESS Delay2_PS_8_process;


  Delay2_PS_8_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_PS_8_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Delay2_PS_8_out1_1 <= if_exp_out_cast_cfType_Expone_3_out1;
      END IF;
    END IF;
  END PROCESS Delay2_PS_8_1_process;


  alphabitget_Mant_tmp_2_0_out1 <= Delay3_PS_8_out1 OR Delay2_PS_8_out1_1;

  alphabitget_Mant_tmp_1_0_out1 <= Delay2_PS_8_out1 AND alphabitget_Mant_tmp_2_0_out1;

  Delay4_PS_2N_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay4_PS_2N_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_PS_2N_out1 <= alphabitget_Mant_tmp_1_0_out1;
      END IF;
    END IF;
  END PROCESS Delay4_PS_2N_process;


  BitSlice4_out1 <= Bit_Concat_out1_4(53 DOWNTO 1);

  Delay1_PS_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_PS_8_out1 <= to_unsigned(0, 53);
      ELSIF enb = '1' THEN
        Delay1_PS_8_out1 <= BitSlice4_out1;
      END IF;
    END IF;
  END PROCESS Delay1_PS_8_process;


  Delay2_PS_2N_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay2_PS_2N_out1 <= to_unsigned(0, 53);
      ELSIF enb = '1' THEN
        Delay2_PS_2N_out1 <= Delay1_PS_8_out1;
      END IF;
    END IF;
  END PROCESS Delay2_PS_2N_process;


  const_2_out1 <= to_unsigned(1, 53);

  Mant_tmp_Incr_2_out1 <= Delay1_PS_8_out1 + const_2_out1;

  Delay3_PS_2N_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay3_PS_2N_out1 <= to_unsigned(0, 53);
      ELSIF enb = '1' THEN
        Delay3_PS_2N_out1 <= Mant_tmp_Incr_2_out1;
      END IF;
    END IF;
  END PROCESS Delay3_PS_2N_process;


  
  if_bitget_Mant_tmp_1_0_out1 <= Delay2_PS_2N_out1 WHEN Delay4_PS_2N_out1 = '0' ELSE
      Delay3_PS_2N_out1;

  BitSlice2_out1_1 <= if_bitget_Mant_tmp_1_0_out1(52);

  Delay12_PS_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay12_PS_7_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay12_PS_7_out1 <= Delay3_PS_6_out1;
      END IF;
    END IF;
  END PROCESS Delay12_PS_7_process;


  C1_out1 <= to_unsigned(16#001#, 11);

  Add_add_cast <= signed(resize(C1_out1, 15));
  Add_add_temp <= resize(Delay3_PS_6_out1, 15) + Add_add_cast;
  Add_out1 <= Add_add_temp(13 DOWNTO 0);

  Delay7_PS_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay7_PS_7_out1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' THEN
        Delay7_PS_7_out1 <= Add_out1;
      END IF;
    END IF;
  END PROCESS Delay7_PS_7_process;


  
  if_exp_out_cast_cfType_Expone_4_out1 <= Delay12_PS_7_out1 WHEN BitSlice1_out1 = '0' ELSE
      Delay7_PS_7_out1;

  Bit_Slice4_out1 <= unsigned(if_exp_out_cast_cfType_Expone_4_out1(10 DOWNTO 0));

  C2_out1_1 <= to_unsigned(16#000#, 11);

  
  if_exp_out_cfType_MantissaLen_out1 <= Bit_Slice4_out1 WHEN if_bitget_mant_ext_mant_ext_Word_3_out1 = '0' ELSE
      C2_out1_1;

  C4_out1 <= to_unsigned(16#7FF#, 11);

  
  if_exp_out_cast_cfType_Expone_out1 <= if_exp_out_cfType_MantissaLen_out1 WHEN if_bitget_mant_ext_mant_ext_Word_2_out1 = '0' ELSE
      C4_out1;

  Delay_PS_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_PS_8_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb = '1' THEN
        Delay_PS_8_out1 <= if_exp_out_cast_cfType_Expone_out1;
      END IF;
    END IF;
  END PROCESS Delay_PS_8_process;


  Delay1_PS_2N_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay1_PS_2N_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb = '1' THEN
        Delay1_PS_2N_out1 <= Delay_PS_8_out1;
      END IF;
    END IF;
  END PROCESS Delay1_PS_2N_process;


  const_1_out1 <= to_unsigned(16#001#, 11);

  Exp_Incr_out1 <= Delay_PS_8_out1 + const_1_out1;

  Delay_PS_2N_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_PS_2N_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb = '1' THEN
        Delay_PS_2N_out1 <= Exp_Incr_out1;
      END IF;
    END IF;
  END PROCESS Delay_PS_2N_process;


  
  if_bitget_Mant_tmp_Mant_tmp_Wor_out1 <= Delay1_PS_2N_out1 WHEN BitSlice2_out1_1 = '0' ELSE
      Delay_PS_2N_out1;

  C_out1_2 <= to_unsigned(16#000#, 11);

  
  if_aIsZero_bIsZero_out1 <= if_bitget_Mant_tmp_Mant_tmp_Wor_out1 WHEN Delay10_PS_2_8_out1 = '0' ELSE
      C_out1_2;

  C2_out1_2 <= to_unsigned(16#7FF#, 11);

  
  if_aExpInforNaN_bExpInforNa_out1 <= if_aIsZero_bIsZero_out1 WHEN Delay11_PS_2_8_out1 = '0' ELSE
      C2_out1_2;

  Delay7_PS_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay7_PS_9_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb = '1' THEN
        Delay7_PS_9_out1 <= if_aExpInforNaN_bExpInforNa_out1;
      END IF;
    END IF;
  END PROCESS Delay7_PS_9_process;


  
  Compare_To_Zero_out1_3 <= '1' WHEN Delay1_PS_2N_out1 = to_unsigned(16#000#, 11) ELSE
      '0';

  Logical_Operator_out1_1 <= Compare_To_Zero_out1_3 OR BitSlice2_out1_1;

  Logical_Operator_out1_2 <= Delay10_PS_2_8_out1 OR Logical_Operator_out1_1;

  BitSlice3_out1 <= if_bitget_Mant_tmp_1_0_out1(51 DOWNTO 0);

  C1_out1_1 <= to_unsigned(0, 52);

  
  if_aIsZero_bIsZero_1_out1 <= BitSlice3_out1 WHEN Logical_Operator_out1_2 = '0' ELSE
      C1_out1_1;

  C1_out1_2 <= unsigned'(X"8000000000000");

  
  if_aIsZero_out1 <= Switch_out1 WHEN alphaaExponent_0_aMantZero_out1 = '0' ELSE
      C1_out1_2;

  C_out1_3 <= unsigned'(X"8000000000000");

  
  if_bIsZero_out1 <= Switch_out1_1 WHEN alphabExponent_0_bMantZero_out1 = '0' ELSE
      C_out1_3;

  
  if_aExpInforNaN_out1 <= if_aIsZero_out1 WHEN aExponent_cfType_Exponent_I_out1 = '0' ELSE
      if_bIsZero_out1;

  Delay9_PS_2_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay9_PS_2_8_reg(0) <= to_unsigned(0, 52);
        Delay9_PS_2_8_reg(1) <= to_unsigned(0, 52);
        Delay9_PS_2_8_reg(2) <= to_unsigned(0, 52);
        Delay9_PS_2_8_reg(3) <= to_unsigned(0, 52);
        Delay9_PS_2_8_reg(4) <= to_unsigned(0, 52);
        Delay9_PS_2_8_reg(5) <= to_unsigned(0, 52);
        Delay9_PS_2_8_reg(6) <= to_unsigned(0, 52);
      ELSIF enb = '1' THEN
        Delay9_PS_2_8_reg(0) <= Delay9_PS_2_8_reg_next(0);
        Delay9_PS_2_8_reg(1) <= Delay9_PS_2_8_reg_next(1);
        Delay9_PS_2_8_reg(2) <= Delay9_PS_2_8_reg_next(2);
        Delay9_PS_2_8_reg(3) <= Delay9_PS_2_8_reg_next(3);
        Delay9_PS_2_8_reg(4) <= Delay9_PS_2_8_reg_next(4);
        Delay9_PS_2_8_reg(5) <= Delay9_PS_2_8_reg_next(5);
        Delay9_PS_2_8_reg(6) <= Delay9_PS_2_8_reg_next(6);
      END IF;
    END IF;
  END PROCESS Delay9_PS_2_8_process;

  Delay9_PS_2_8_out1 <= Delay9_PS_2_8_reg(6);
  Delay9_PS_2_8_reg_next(0) <= if_aExpInforNaN_out1;
  Delay9_PS_2_8_reg_next(1) <= Delay9_PS_2_8_reg(0);
  Delay9_PS_2_8_reg_next(2) <= Delay9_PS_2_8_reg(1);
  Delay9_PS_2_8_reg_next(3) <= Delay9_PS_2_8_reg(2);
  Delay9_PS_2_8_reg_next(4) <= Delay9_PS_2_8_reg(3);
  Delay9_PS_2_8_reg_next(5) <= Delay9_PS_2_8_reg(4);
  Delay9_PS_2_8_reg_next(6) <= Delay9_PS_2_8_reg(5);

  
  if_aExpInforNaN_bExpInforNa_1_out1 <= if_aIsZero_bIsZero_1_out1 WHEN Delay11_PS_2_8_out1 = '0' ELSE
      Delay9_PS_2_8_out1;

  Delay8_PS_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay8_PS_9_out1 <= to_unsigned(0, 52);
      ELSIF enb = '1' THEN
        Delay8_PS_9_out1 <= if_aExpInforNaN_bExpInforNa_1_out1;
      END IF;
    END IF;
  END PROCESS Delay8_PS_9_process;


  -- Combine FP sign, exponent, mantissa into 64 bit word
  nfp_out_pack <= Delay6_PS_9_out1 & Delay7_PS_9_out1 & Delay8_PS_9_out1;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

