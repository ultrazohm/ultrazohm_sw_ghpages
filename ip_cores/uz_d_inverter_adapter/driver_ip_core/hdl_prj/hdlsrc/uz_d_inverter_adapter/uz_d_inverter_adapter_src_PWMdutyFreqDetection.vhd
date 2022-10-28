-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\uz_d_inverter_adapter\uz_d_inverter_adapter_src_PWMdutyFreqDetection.vhd
-- Created: 2022-05-31 17:55:04
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_d_inverter_adapter_src_PWMdutyFreqDetection
-- Source Path: uz_d_inverter_adapter/uz_d_inverter_adapter/PWMdutyFreqDetection
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_d_inverter_adapter_src_uz_d_inverter_adapter_pkg.ALL;

ENTITY uz_d_inverter_adapter_src_PWMdutyFreqDetection IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        pwm_in                            :   IN    std_logic;  -- ufix1
        AXI_period                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        AXI_hightime                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        AXI_lowtime                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        AXI_dutycyc                       :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32_En31
        );
END uz_d_inverter_adapter_src_PWMdutyFreqDetection;


ARCHITECTURE rtl OF uz_d_inverter_adapter_src_PWMdutyFreqDetection IS

  -- Component Declarations
  COMPONENT uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          U                               :   IN    std_logic;  -- ufix1
          Y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_d_inverter_adapter_src_Detect_Rise_Positive1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          U                               :   IN    std_logic;  -- ufix1
          Y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_d_inverter_adapter_src_Reciprocal
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          din                             :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          dout                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32_En31
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1
    USE ENTITY work.uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1(rtl);

  FOR ALL : uz_d_inverter_adapter_src_Detect_Rise_Positive1
    USE ENTITY work.uz_d_inverter_adapter_src_Detect_Rise_Positive1(rtl);

  FOR ALL : uz_d_inverter_adapter_src_Reciprocal
    USE ENTITY work.uz_d_inverter_adapter_src_Reciprocal(rtl);

  -- Signals
  SIGNAL Delay15_out1                     : std_logic;  -- ufix1
  SIGNAL Detect_Fall_Nonpositive1_out1    : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Detect_Rise_Positive1_out1       : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL HDL_Counter1_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch10_out1                    : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch10_out1_1                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Switch11_out1                    : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch11_out1_1                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Sum1_out1                        : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL delayMatch1_reg                  : vector_of_unsigned32(0 TO 18);  -- ufix32 [19]
  SIGNAL Delay10_out1                     : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL reduced_reg                      : vector_of_unsigned32(0 TO 16);  -- ufix32 [17]
  SIGNAL Switch10_out1_2                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch10_out1_3                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL reduced_reg_1                    : vector_of_unsigned32(0 TO 17);  -- ufix32 [18]
  SIGNAL Switch11_out1_2                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Reciprocal_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Reciprocal_out1_unsigned         : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL Product1_mul_temp                : unsigned(63 DOWNTO 0);  -- ufix64_En31
  SIGNAL Product1_out1                    : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL Delay14_out1                     : unsigned(31 DOWNTO 0);  -- ufix32_En31

BEGIN
  -- turn input of if en_in_AXI is low AND falling edge, turn input on if en_in_AXI is high again
  -- 
  -- update output only after end of pulse (faling edge)
  -- and when reciprocal and product are finished

  u_Detect_Fall_Nonpositive1 : uz_d_inverter_adapter_src_Detect_Fall_Nonpositive1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              U => Delay15_out1,  -- ufix1
              Y => Detect_Fall_Nonpositive1_out1
              );

  u_Detect_Rise_Positive1 : uz_d_inverter_adapter_src_Detect_Rise_Positive1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              U => Delay15_out1,  -- ufix1
              Y => Detect_Rise_Positive1_out1
              );

  u_Reciprocal : uz_d_inverter_adapter_src_Reciprocal
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              din => std_logic_vector(Sum1_out1),  -- uint32
              dout => Reciprocal_out1  -- ufix32_En31
              );

  Delay15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay15_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay15_out1 <= pwm_in;
      END IF;
    END IF;
  END PROCESS Delay15_process;


  
  switch_compare_1 <= '1' WHEN Detect_Fall_Nonpositive1_out1 > '0' ELSE
      '0';

  Logical_Operator3_out1 <= Detect_Rise_Positive1_out1 OR Detect_Fall_Nonpositive1_out1;

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 2500000
  HDL_Counter1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        HDL_Counter1_out1 <= to_unsigned(1, 32);
      ELSIF enb = '1' THEN
        IF Logical_Operator3_out1 = '1' THEN 
          HDL_Counter1_out1 <= to_unsigned(1, 32);
        ELSIF HDL_Counter1_out1 >= to_unsigned(2500000, 32) THEN 
          HDL_Counter1_out1 <= to_unsigned(1, 32);
        ELSE 
          HDL_Counter1_out1 <= HDL_Counter1_out1 + to_unsigned(1, 32);
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Switch10_out1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Switch10_out1_1 <= Switch10_out1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  
  Switch10_out1 <= Switch10_out1_1 WHEN switch_compare_1 = '0' ELSE
      HDL_Counter1_out1;

  
  switch_compare_1_1 <= '1' WHEN Detect_Rise_Positive1_out1 > '0' ELSE
      '0';

  reduced_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Switch11_out1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Switch11_out1_1 <= Switch11_out1;
      END IF;
    END IF;
  END PROCESS reduced_1_process;


  
  Switch11_out1 <= Switch11_out1_1 WHEN switch_compare_1_1 = '0' ELSE
      HDL_Counter1_out1;

  Sum1_out1 <= Switch10_out1 + Switch11_out1;

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delayMatch1_reg <= (OTHERS => to_unsigned(0, 32));
      ELSIF enb = '1' THEN
        delayMatch1_reg(0) <= Sum1_out1;
        delayMatch1_reg(1 TO 18) <= delayMatch1_reg(0 TO 17);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  Delay10_out1 <= delayMatch1_reg(18);

  AXI_period <= std_logic_vector(Delay10_out1);

  reduced_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg <= (OTHERS => to_unsigned(0, 32));
      ELSIF enb = '1' THEN
        reduced_reg(0) <= Switch10_out1_1;
        reduced_reg(1 TO 16) <= reduced_reg(0 TO 15);
      END IF;
    END IF;
  END PROCESS reduced_2_process;

  Switch10_out1_2 <= reduced_reg(16);

  reduced_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Switch10_out1_3 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Switch10_out1_3 <= Switch10_out1_2;
      END IF;
    END IF;
  END PROCESS reduced_3_process;


  AXI_hightime <= std_logic_vector(Switch10_out1_3);

  reduced_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg_1 <= (OTHERS => to_unsigned(0, 32));
      ELSIF enb = '1' THEN
        reduced_reg_1(0) <= Switch11_out1_1;
        reduced_reg_1(1 TO 17) <= reduced_reg_1(0 TO 16);
      END IF;
    END IF;
  END PROCESS reduced_4_process;

  Switch11_out1_2 <= reduced_reg_1(17);

  AXI_lowtime <= std_logic_vector(Switch11_out1_2);

  Reciprocal_out1_unsigned <= unsigned(Reciprocal_out1);

  Product1_mul_temp <= Switch10_out1_2 * Reciprocal_out1_unsigned;
  Product1_out1 <= Product1_mul_temp(31 DOWNTO 0);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay14_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Delay14_out1 <= Product1_out1;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  AXI_dutycyc <= std_logic_vector(Delay14_out1);

END rtl;

