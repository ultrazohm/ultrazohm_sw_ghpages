-- -------------------------------------------------------------
-- 
-- File Name: /home/ts/Documents/integrate_nn_to_uz/ultrazohm_sw/ip_cores/nnAXI_v1_0/hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_MATLAB_Function.vhd
-- Created: 2021-10-22 11:38:40
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_MATLAB_Function
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer/reluLayer_4Parallel/MATLAB Function
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_mlp_three_layer_src_MATLAB_Function IS
  PORT( readAddr                          :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        y                                 :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END uz_mlp_three_layer_src_MATLAB_Function;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_MATLAB_Function IS

  -- Signals
  SIGNAL readAddr_unsigned                : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL y_tmp                            : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  readAddr_unsigned <= unsigned(readAddr);

  MATLAB_Function_output : PROCESS (readAddr_unsigned)
  BEGIN
    --MATLAB Function 'uz_mlp_three_layer/reluLayer_4Parallel/MATLAB Function'
    y_tmp <= to_unsigned(16#00#, 8);
    IF (readAddr_unsigned > to_unsigned(16#010#, 10)) AND (readAddr_unsigned <= to_unsigned(16#020#, 10)) THEN 
      y_tmp <= to_unsigned(16#01#, 8);
    END IF;
    IF (readAddr_unsigned > to_unsigned(16#020#, 10)) AND (readAddr_unsigned <= to_unsigned(16#030#, 10)) THEN 
      y_tmp <= to_unsigned(16#02#, 8);
    END IF;
    IF (readAddr_unsigned > to_unsigned(16#030#, 10)) AND (readAddr_unsigned <= to_unsigned(16#040#, 10)) THEN 
      y_tmp <= to_unsigned(16#03#, 8);
    END IF;
  END PROCESS MATLAB_Function_output;


  y <= std_logic_vector(y_tmp);

END rtl;

