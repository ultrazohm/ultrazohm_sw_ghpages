-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq_V24\IncreEncoder_V24_ip_src_Count.vhd
-- Created: 2020-06-13 11:16:18
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V24_ip_src_Count
-- Source Path: Encoder_Zynq_V24/IncreEncoder_V24/omega_by_measure_time/Count
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V24_ip_src_Count IS
  PORT( AllowCheckOverSampl               :   IN    std_logic;
        ReadBack_Omega                    :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        OverSamplOmega                    :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        state                             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        InternalOmega                     :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        state_Out                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        InternalOmega_Out                 :   OUT   std_logic_vector(23 DOWNTO 0)  -- sfix24_En11
        );
END IncreEncoder_V24_ip_src_Count;


ARCHITECTURE rtl OF IncreEncoder_V24_ip_src_Count IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL ReadBack_Omega_signed            : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL OverSamplOmega_signed            : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL state_unsigned                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL InternalOmega_signed             : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL state_Out_tmp                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL InternalOmega_Out_tmp            : signed(23 DOWNTO 0);  -- sfix24_En11

BEGIN
  ReadBack_Omega_signed <= signed(ReadBack_Omega);

  OverSamplOmega_signed <= signed(OverSamplOmega);

  state_unsigned <= unsigned(state);

  InternalOmega_signed <= signed(InternalOmega);

  Count_output : PROCESS (AllowCheckOverSampl, ReadBack_Omega_signed, OverSamplOmega_signed,
       state_unsigned, InternalOmega_signed)
    VARIABLE cast : signed(24 DOWNTO 0);
    VARIABLE add_cast : signed(24 DOWNTO 0);
    VARIABLE add_cast_0 : signed(24 DOWNTO 0);
    VARIABLE add_temp : signed(24 DOWNTO 0);
    VARIABLE cast_0 : signed(24 DOWNTO 0);
    VARIABLE sub_cast : signed(24 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(24 DOWNTO 0);
    VARIABLE sub_temp : signed(24 DOWNTO 0);
  BEGIN
    --MATLAB Function 'IncreEncoder_V24/omega_by_measure_time/Count'
    --  Fq04    = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Wrap','ProductMode', 'FullPrecision', 'ProductWordLength', 4,'ProductFractionLength',0,'SumMode','SpecifyPrecision','SumWordLength',4,'SumFractionLength',0);
    --Counter for one measuring interval in order to trigger the ADC
    --Counter State
    -- Count Up
    cast := resize(ReadBack_Omega_signed, 25);
    add_cast := resize(InternalOmega_signed, 25);
    add_cast_0 := resize(OverSamplOmega_signed, 25);
    add_temp := add_cast + add_cast_0;
    IF (hdlcoder_to_stdlogic(cast > add_temp) AND AllowCheckOverSampl) = '1' THEN 
      state_Out_tmp <= state_unsigned + to_unsigned(16#0001#, 16);
      --Count up the measure-state 
      InternalOmega_Out_tmp <= InternalOmega_signed + OverSamplOmega_signed;
    ELSE 
      cast_0 := resize(ReadBack_Omega_signed, 25);
      sub_cast := resize(InternalOmega_signed, 25);
      sub_cast_0 := resize(OverSamplOmega_signed, 25);
      sub_temp := sub_cast - sub_cast_0;
      IF (hdlcoder_to_stdlogic(cast_0 < sub_temp) AND AllowCheckOverSampl) = '1' THEN 
        state_Out_tmp <= state_unsigned - to_unsigned(16#0001#, 16);
        --Count up the measure-state 
        InternalOmega_Out_tmp <= InternalOmega_signed - OverSamplOmega_signed;
      ELSE 
        state_Out_tmp <= state_unsigned;
        InternalOmega_Out_tmp <= InternalOmega_signed;
      END IF;
    END IF;
    -- Output the variables 
  END PROCESS Count_output;


  state_Out <= std_logic_vector(state_Out_tmp);

  InternalOmega_Out <= std_logic_vector(InternalOmega_Out_tmp);

END rtl;
