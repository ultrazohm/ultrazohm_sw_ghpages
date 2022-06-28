-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_src_nfp_gain_pow2_double.vhd
-- Created: 2022-05-13 08:57:51
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_src_nfp_gain_pow2_double
-- Source Path: uz_inverter_3phgm/uz_inverter_3ph/nfp_gain_pow2_double
-- Hierarchy Level: 1
-- 
-- {Latency Strategy = "Min", Denormal Handling = "off"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_inverter_3ph_src_nfp_gain_pow2_double IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        nfp_in1                           :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        nfp_in2                           :   IN    std_logic;  -- ufix1
        nfp_in3                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        nfp_out                           :   OUT   std_logic_vector(63 DOWNTO 0)  -- ufix64
        );
END uz_inverter_3ph_src_nfp_gain_pow2_double;


ARCHITECTURE rtl OF uz_inverter_3ph_src_nfp_gain_pow2_double IS

  -- Signals
  SIGNAL nfp_in1_unsigned                 : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL aSign                            : std_logic;  -- ufix1
  SIGNAL aExponent                        : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL aMantissa                        : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Logical_Operator1_out1           : std_logic;  -- ufix1
  SIGNAL Delay3_PS_5_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Reduce_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Reduce1_out1                 : std_logic;  -- ufix1
  SIGNAL Logical_Operator6_out1           : std_logic;  -- ufix1
  SIGNAL Constant_out1                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL nfp_in3_signed                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL Bit_Concat_out1                  : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL Data_Type_Conversion_out1        : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Bit_Concat1_out1                 : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL Data_Type_Conversion1_out1       : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Add_out1                         : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice2_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1            : std_logic;  -- ufix1
  SIGNAL Bit_Slice1_out1                  : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Logical_Operator4_out1           : std_logic;  -- ufix1
  SIGNAL Logical_Operator7_out1           : std_logic;  -- ufix1
  SIGNAL Logical_Operator5_out1           : std_logic;  -- ufix1
  SIGNAL Bit_Concat4_out1                 : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Bit_Concat5_out1                 : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Bit_Concat6_out1                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Bit_Concat1_out1_1               : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Bit_Concat2_out1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Switch1_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay6_PS_5_out1                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Bit_Reduce2_out1                 : std_logic;  -- ufix1
  SIGNAL Bit_Reduce3_out1                 : std_logic;  -- ufix1
  SIGNAL Logical_Operator8_out1           : std_logic;  -- ufix1
  SIGNAL Logical_Operator2_out1           : std_logic;  -- ufix1
  SIGNAL Logical_Operator3_out1           : std_logic;  -- ufix1
  SIGNAL Constant1_out1                   : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Switch_out1                      : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Delay7_PS_5_out1                 : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL nfp_out_pack                     : unsigned(63 DOWNTO 0);  -- ufix64

BEGIN
  nfp_in1_unsigned <= unsigned(nfp_in1);

  -- Split 64 bit word into FP sign, exponent, mantissa
  aSign <= nfp_in1_unsigned(63);
  aExponent <= nfp_in1_unsigned(62 DOWNTO 52);
  aMantissa <= nfp_in1_unsigned(51 DOWNTO 0);

  Logical_Operator1_out1 <= aSign XOR nfp_in2;

  Delay3_PS_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_PS_5_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay3_PS_5_out1 <= Logical_Operator1_out1;
      END IF;
    END IF;
  END PROCESS Delay3_PS_5_process;


  Bit_Reduce_out1 <= (aExponent(10) AND aExponent(9) AND aExponent(8) AND aExponent(7) AND aExponent(6) AND aExponent(5) AND aExponent(4) AND aExponent(3) AND aExponent(2) AND aExponent(1) AND aExponent(0));

  Bit_Reduce1_out1 <= (aExponent(10) OR aExponent(9) OR aExponent(8) OR aExponent(7) OR aExponent(6) OR aExponent(5) OR aExponent(4) OR aExponent(3) OR aExponent(2) OR aExponent(1) OR aExponent(0));

  Logical_Operator6_out1 <=  NOT Bit_Reduce1_out1;

  Constant_out1 <= to_unsigned(16#0#, 2);

  nfp_in3_signed <= signed(nfp_in3);

  Bit_Slice_out1 <= nfp_in3_signed(11);

  Bit_Concat_out1 <= Constant_out1 & aExponent;

  Data_Type_Conversion_out1 <= signed(Bit_Concat_out1);

  Bit_Concat1_out1 <= Bit_Slice_out1 & unsigned(nfp_in3_signed);

  Data_Type_Conversion1_out1 <= signed(Bit_Concat1_out1);

  Add_out1 <= Data_Type_Conversion_out1 + Data_Type_Conversion1_out1;

  Bit_Slice3_out1 <= Add_out1(12);

  Bit_Slice2_out1 <= Add_out1(11);

  Logical_Operator_out1 <= Bit_Slice2_out1 OR (Bit_Slice3_out1 OR (Bit_Reduce_out1 OR Logical_Operator6_out1));

  Bit_Slice1_out1 <= unsigned(Add_out1(10 DOWNTO 0));

  Logical_Operator4_out1 <=  NOT Bit_Slice3_out1;

  Logical_Operator7_out1 <= Bit_Reduce1_out1 AND Logical_Operator4_out1;

  Logical_Operator5_out1 <= Bit_Reduce_out1 OR Logical_Operator7_out1;

  Bit_Concat4_out1 <= unsigned'(Logical_Operator5_out1 & Logical_Operator5_out1);

  Bit_Concat5_out1 <= Bit_Concat4_out1 & Bit_Concat4_out1;

  Bit_Concat6_out1 <= Bit_Concat5_out1 & Bit_Concat5_out1;

  Bit_Concat1_out1_1 <= Bit_Concat6_out1 & Bit_Concat4_out1;

  Bit_Concat2_out1 <= Bit_Concat1_out1_1 & Logical_Operator5_out1;

  
  Switch1_out1 <= Bit_Slice1_out1 WHEN Logical_Operator_out1 = '0' ELSE
      Bit_Concat2_out1;

  Delay6_PS_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay6_PS_5_out1 <= to_unsigned(16#000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay6_PS_5_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Delay6_PS_5_process;


  Bit_Reduce2_out1 <= (Bit_Slice1_out1(10) AND Bit_Slice1_out1(9) AND Bit_Slice1_out1(8) AND Bit_Slice1_out1(7) AND Bit_Slice1_out1(6) AND Bit_Slice1_out1(5) AND Bit_Slice1_out1(4) AND Bit_Slice1_out1(3) AND Bit_Slice1_out1(2) AND Bit_Slice1_out1(1) AND Bit_Slice1_out1(0));

  Bit_Reduce3_out1 <= (Bit_Slice1_out1(10) OR Bit_Slice1_out1(9) OR Bit_Slice1_out1(8) OR Bit_Slice1_out1(7) OR Bit_Slice1_out1(6) OR Bit_Slice1_out1(5) OR Bit_Slice1_out1(4) OR Bit_Slice1_out1(3) OR Bit_Slice1_out1(2) OR Bit_Slice1_out1(1) OR Bit_Slice1_out1(0));

  Logical_Operator8_out1 <=  NOT Bit_Reduce3_out1;

  Logical_Operator2_out1 <=  NOT (Logical_Operator8_out1 OR (Logical_Operator6_out1 OR (Bit_Reduce2_out1 OR (Bit_Slice3_out1 OR Bit_Slice2_out1))));

  Logical_Operator3_out1 <= Bit_Reduce_out1 OR Logical_Operator2_out1;

  Constant1_out1 <= to_unsigned(0, 52);

  
  Switch_out1 <= Constant1_out1 WHEN Logical_Operator3_out1 = '0' ELSE
      aMantissa;

  Delay7_PS_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay7_PS_5_out1 <= to_unsigned(0, 52);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay7_PS_5_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay7_PS_5_process;


  -- Combine FP sign, exponent, mantissa into 64 bit word
  nfp_out_pack <= Delay3_PS_5_out1 & Delay6_PS_5_out1 & Delay7_PS_5_out1;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

