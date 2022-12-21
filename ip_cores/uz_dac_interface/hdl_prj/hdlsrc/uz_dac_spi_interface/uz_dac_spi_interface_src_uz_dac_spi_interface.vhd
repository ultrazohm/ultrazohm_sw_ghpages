-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_dac_spi_interface/uz_dac_spi_interface_src_uz_dac_spi_interface.vhd
-- Created: 2022-05-17 10:00:47
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1e-08
-- Target subsystem base rate: 1e-08
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- spi_clk_out                   ce_out        1e-08
-- cs_out                        ce_out        1e-08
-- data_out_1                    ce_out        1e-08
-- data_out_2                    ce_out        1e-08
-- data_out_3                    ce_out        1e-08
-- data_out_4                    ce_out        1e-08
-- data_out_5                    ce_out        1e-08
-- data_out_6                    ce_out        1e-08
-- data_out_7                    ce_out        1e-08
-- data_out_8                    ce_out        1e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_dac_spi_interface_src_uz_dac_spi_interface
-- Source Path: uz_dac_spi_interface/uz_dac_spi_interface
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_dac_spi_interface_src_uz_dac_spi_interface IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        trigger_write                     :   IN    std_logic;
        dac_data_1                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dac_data_2                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dac_data_3                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dac_data_4                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dac_data_5                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dac_data_6                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dac_data_7                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dac_data_8                        :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        ce_out                            :   OUT   std_logic;
        spi_clk_out                       :   OUT   std_logic;
        cs_out                            :   OUT   std_logic;
        data_out_1                        :   OUT   std_logic;
        data_out_2                        :   OUT   std_logic;
        data_out_3                        :   OUT   std_logic;
        data_out_4                        :   OUT   std_logic;
        data_out_5                        :   OUT   std_logic;
        data_out_6                        :   OUT   std_logic;
        data_out_7                        :   OUT   std_logic;
        data_out_8                        :   OUT   std_logic
        );
END uz_dac_spi_interface_src_uz_dac_spi_interface;


ARCHITECTURE rtl OF uz_dac_spi_interface_src_uz_dac_spi_interface IS

  -- Component Declarations
  COMPONENT uz_dac_spi_interface_src_uz_dac_spi_interface_tc
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_1_1                       :   OUT   std_logic;
          enb_1_32_0                      :   OUT   std_logic;
          enb_1_32_1                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Detect_Rise_Positive
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          U                               :   IN    std_logic;
          Y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem1
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem2
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem3
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem4
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem5
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem6
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  COMPONENT uz_dac_spi_interface_src_Subsystem7
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          Out1                            :   OUT   std_logic_vector(0 TO 31)  -- ufix1 [32]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_dac_spi_interface_src_uz_dac_spi_interface_tc
    USE ENTITY work.uz_dac_spi_interface_src_uz_dac_spi_interface_tc(rtl);

  FOR ALL : uz_dac_spi_interface_src_Detect_Rise_Positive
    USE ENTITY work.uz_dac_spi_interface_src_Detect_Rise_Positive(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem1
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem1(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem2
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem2(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem3
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem3(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem4
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem4(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem5
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem5(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem6
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem6(rtl);

  FOR ALL : uz_dac_spi_interface_src_Subsystem7
    USE ENTITY work.uz_dac_spi_interface_src_Subsystem7(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_32_1                       : std_logic;
  SIGNAL enb_1_32_0                       : std_logic;
  SIGNAL enb_1_1_1                        : std_logic;
  SIGNAL Rate_Transition2_bypass_reg      : std_logic;  -- ufix1
  SIGNAL Rate_Transition2_out1            : std_logic;
  SIGNAL Detect_Rise_Positive_out1        : std_logic;
  SIGNAL control_in_2                     : std_logic;
  SIGNAL Serializer1D_contl_cnt           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D_invldSignal         : std_logic;
  SIGNAL Serializer1D_out2                : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL AND2_out1                        : std_logic;
  SIGNAL Delay_switch_delay               : std_logic;  -- ufix1
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL dac_data_1_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition1_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition1_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem_out1                   : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1                      : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D_data                : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D_data_next           : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed         : std_logic;  -- ufix1
  SIGNAL AND_out1                         : std_logic;
  SIGNAL control_in_2_1                   : std_logic;
  SIGNAL Serializer1D1_contl_cnt          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D1_invldSignal        : std_logic;
  SIGNAL Serializer1D1_out2               : std_logic;
  SIGNAL dac_data_2_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition3_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition3_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem1_out1                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1_1                    : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D1_data               : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D1_data_next          : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed_1       : std_logic;  -- ufix1
  SIGNAL AND3_out1                        : std_logic;
  SIGNAL control_in_2_2                   : std_logic;
  SIGNAL Serializer1D2_contl_cnt          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D2_invldSignal        : std_logic;
  SIGNAL Serializer1D2_out2               : std_logic;
  SIGNAL dac_data_3_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition4_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition4_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem2_out1                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1_2                    : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D2_data               : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D2_data_next          : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed_2       : std_logic;  -- ufix1
  SIGNAL AND4_out1                        : std_logic;
  SIGNAL control_in_2_3                   : std_logic;
  SIGNAL Serializer1D3_contl_cnt          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D3_invldSignal        : std_logic;
  SIGNAL Serializer1D3_out2               : std_logic;
  SIGNAL dac_data_4_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition5_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition5_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem3_out1                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1_3                    : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D3_data               : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D3_data_next          : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed_3       : std_logic;  -- ufix1
  SIGNAL AND5_out1                        : std_logic;
  SIGNAL control_in_2_4                   : std_logic;
  SIGNAL Serializer1D4_contl_cnt          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D4_invldSignal        : std_logic;
  SIGNAL Serializer1D4_out2               : std_logic;
  SIGNAL dac_data_5_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition6_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition6_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem4_out1                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1_4                    : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D4_data               : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D4_data_next          : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed_4       : std_logic;  -- ufix1
  SIGNAL AND6_out1                        : std_logic;
  SIGNAL control_in_2_5                   : std_logic;
  SIGNAL Serializer1D5_contl_cnt          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D5_invldSignal        : std_logic;
  SIGNAL Serializer1D5_out2               : std_logic;
  SIGNAL dac_data_6_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition7_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition7_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem5_out1                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1_5                    : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D5_data               : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D5_data_next          : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed_5       : std_logic;  -- ufix1
  SIGNAL AND7_out1                        : std_logic;
  SIGNAL control_in_2_6                   : std_logic;
  SIGNAL Serializer1D6_contl_cnt          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D6_invldSignal        : std_logic;
  SIGNAL Serializer1D6_out2               : std_logic;
  SIGNAL dac_data_7_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition8_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition8_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem6_out1                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1_6                    : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D6_data               : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D6_data_next          : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed_6       : std_logic;  -- ufix1
  SIGNAL AND8_out1                        : std_logic;
  SIGNAL control_in_2_7                   : std_logic;
  SIGNAL Serializer1D7_contl_cnt          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Serializer1D7_invldSignal        : std_logic;
  SIGNAL Serializer1D7_out2               : std_logic;
  SIGNAL dac_data_8_signed                : signed(15 DOWNTO 0);  -- int16
  SIGNAL Rate_Transition9_bypass_reg      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Rate_Transition9_out1            : signed(15 DOWNTO 0);  -- int16
  SIGNAL Subsystem7_out1                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL serial_in_1_7                    : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL Serializer1D7_data               : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL Serializer1D7_data_next          : std_logic_vector(0 TO 30);  -- ufix1 [31]
  SIGNAL serializer_PostProcessed_7       : std_logic;  -- ufix1
  SIGNAL AND9_out1                        : std_logic;

BEGIN
  u_uz_dac_spi_interface_tc : uz_dac_spi_interface_src_uz_dac_spi_interface_tc
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_1_1 => enb_1_1_1,
              enb_1_32_0 => enb_1_32_0,
              enb_1_32_1 => enb_1_32_1
              );

  u_Detect_Rise_Positive : uz_dac_spi_interface_src_Detect_Rise_Positive
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              U => Rate_Transition2_out1,
              Y => Detect_Rise_Positive_out1
              );

  -- This subsystem takes the 16 bit input, slices each bit out of the variable and builds a parallel vector with all 
  -- of the bits
  -- To match the clock requirements (100 MHz FPGA clk, 50 MHz SPI output clock), each bit is present twice in the output 
  -- vector, e.g.
  -- 010101 gets:
  -- 001100110011
  -- That way, the bit is present for two 100 MHz clk cycles after the serializer
  u_Subsystem : uz_dac_spi_interface_src_Subsystem
    PORT MAP( u => std_logic_vector(Rate_Transition1_out1),  -- int16
              Out1 => Subsystem_out1  -- ufix1 [32]
              );

  u_Subsystem1 : uz_dac_spi_interface_src_Subsystem1
    PORT MAP( u => std_logic_vector(Rate_Transition3_out1),  -- int16
              Out1 => Subsystem1_out1  -- ufix1 [32]
              );

  u_Subsystem2 : uz_dac_spi_interface_src_Subsystem2
    PORT MAP( u => std_logic_vector(Rate_Transition4_out1),  -- int16
              Out1 => Subsystem2_out1  -- ufix1 [32]
              );

  u_Subsystem3 : uz_dac_spi_interface_src_Subsystem3
    PORT MAP( u => std_logic_vector(Rate_Transition5_out1),  -- int16
              Out1 => Subsystem3_out1  -- ufix1 [32]
              );

  u_Subsystem4 : uz_dac_spi_interface_src_Subsystem4
    PORT MAP( u => std_logic_vector(Rate_Transition6_out1),  -- int16
              Out1 => Subsystem4_out1  -- ufix1 [32]
              );

  u_Subsystem5 : uz_dac_spi_interface_src_Subsystem5
    PORT MAP( u => std_logic_vector(Rate_Transition7_out1),  -- int16
              Out1 => Subsystem5_out1  -- ufix1 [32]
              );

  u_Subsystem6 : uz_dac_spi_interface_src_Subsystem6
    PORT MAP( u => std_logic_vector(Rate_Transition8_out1),  -- int16
              Out1 => Subsystem6_out1  -- ufix1 [32]
              );

  u_Subsystem7 : uz_dac_spi_interface_src_Subsystem7
    PORT MAP( u => std_logic_vector(Rate_Transition9_out1),  -- int16
              Out1 => Subsystem7_out1  -- ufix1 [32]
              );

  Rate_Transition2_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition2_bypass_reg <= '0';
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition2_bypass_reg <= trigger_write;
      END IF;
    END IF;
  END PROCESS Rate_Transition2_bypass_process;

  
  Rate_Transition2_out1 <= trigger_write WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition2_bypass_reg;

  control_in_2 <= Detect_Rise_Positive_out1;

  Serializer1D_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D_contl_cnt <= Serializer1D_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D_contl_process;

  Serializer1D_out2 <= control_in_2;
  
  Serializer1D_invldSignal <= '1' WHEN Serializer1D_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  AND1_out1 <=  NOT Serializer1D_out2;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_switch_delay <= '1';
      ELSIF enb = '1' THEN
        IF AND1_out1 = '1' THEN
          Delay_switch_delay <= '1';
        ELSE 
          Delay_switch_delay <= AND2_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Delay_process;

  
  Delay_out1 <= '1' WHEN AND1_out1 = '1' ELSE
      Delay_switch_delay;

  AND2_out1 <=  NOT Delay_out1;

  dac_data_1_signed <= signed(dac_data_1);

  Rate_Transition1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition1_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition1_bypass_reg <= dac_data_1_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition1_bypass_process;

  
  Rate_Transition1_out1 <= dac_data_1_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition1_bypass_reg;

  serial_in_1 <= Subsystem_out1;

  Serializer1D_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D_data <= Serializer1D_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D_process;

  Serializer1D_output : PROCESS (Serializer1D_data, Serializer1D_invldSignal, serial_in_1)
  BEGIN
    Serializer1D_data_next <= Serializer1D_data;
    IF Serializer1D_invldSignal /= '0' THEN 
      serializer_PostProcessed <= serial_in_1(0);
    ELSE 
      serializer_PostProcessed <= Serializer1D_data(0);
    END IF;
    IF Serializer1D_invldSignal /= '0' THEN 
      Serializer1D_data_next(0 TO 30) <= serial_in_1(1 TO 31);
    ELSE 
      Serializer1D_data_next(0 TO 29) <= Serializer1D_data(1 TO 30);
      Serializer1D_data_next(30) <= serial_in_1(31);
    END IF;
  END PROCESS Serializer1D_output;


  AND_out1 <= serializer_PostProcessed AND Serializer1D_out2;

  control_in_2_1 <= Detect_Rise_Positive_out1;

  Serializer1D1_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D1_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D1_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D1_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D1_contl_cnt <= Serializer1D1_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D1_contl_process;

  Serializer1D1_out2 <= control_in_2_1;
  
  Serializer1D1_invldSignal <= '1' WHEN Serializer1D1_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  dac_data_2_signed <= signed(dac_data_2);

  Rate_Transition3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition3_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition3_bypass_reg <= dac_data_2_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition3_bypass_process;

  
  Rate_Transition3_out1 <= dac_data_2_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition3_bypass_reg;

  serial_in_1_1 <= Subsystem1_out1;

  Serializer1D1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D1_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D1_data <= Serializer1D1_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D1_process;

  Serializer1D1_output : PROCESS (Serializer1D1_data, Serializer1D1_invldSignal, serial_in_1_1)
  BEGIN
    Serializer1D1_data_next <= Serializer1D1_data;
    IF Serializer1D1_invldSignal /= '0' THEN 
      serializer_PostProcessed_1 <= serial_in_1_1(0);
    ELSE 
      serializer_PostProcessed_1 <= Serializer1D1_data(0);
    END IF;
    IF Serializer1D1_invldSignal /= '0' THEN 
      Serializer1D1_data_next(0 TO 30) <= serial_in_1_1(1 TO 31);
    ELSE 
      Serializer1D1_data_next(0 TO 29) <= Serializer1D1_data(1 TO 30);
      Serializer1D1_data_next(30) <= serial_in_1_1(31);
    END IF;
  END PROCESS Serializer1D1_output;


  AND3_out1 <= serializer_PostProcessed_1 AND Serializer1D1_out2;

  control_in_2_2 <= Detect_Rise_Positive_out1;

  Serializer1D2_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D2_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D2_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D2_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D2_contl_cnt <= Serializer1D2_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D2_contl_process;

  Serializer1D2_out2 <= control_in_2_2;
  
  Serializer1D2_invldSignal <= '1' WHEN Serializer1D2_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  dac_data_3_signed <= signed(dac_data_3);

  Rate_Transition4_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition4_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition4_bypass_reg <= dac_data_3_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition4_bypass_process;

  
  Rate_Transition4_out1 <= dac_data_3_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition4_bypass_reg;

  serial_in_1_2 <= Subsystem2_out1;

  Serializer1D2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D2_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D2_data <= Serializer1D2_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D2_process;

  Serializer1D2_output : PROCESS (Serializer1D2_data, Serializer1D2_invldSignal, serial_in_1_2)
  BEGIN
    Serializer1D2_data_next <= Serializer1D2_data;
    IF Serializer1D2_invldSignal /= '0' THEN 
      serializer_PostProcessed_2 <= serial_in_1_2(0);
    ELSE 
      serializer_PostProcessed_2 <= Serializer1D2_data(0);
    END IF;
    IF Serializer1D2_invldSignal /= '0' THEN 
      Serializer1D2_data_next(0 TO 30) <= serial_in_1_2(1 TO 31);
    ELSE 
      Serializer1D2_data_next(0 TO 29) <= Serializer1D2_data(1 TO 30);
      Serializer1D2_data_next(30) <= serial_in_1_2(31);
    END IF;
  END PROCESS Serializer1D2_output;


  AND4_out1 <= serializer_PostProcessed_2 AND Serializer1D2_out2;

  control_in_2_3 <= Detect_Rise_Positive_out1;

  Serializer1D3_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D3_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D3_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D3_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D3_contl_cnt <= Serializer1D3_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D3_contl_process;

  Serializer1D3_out2 <= control_in_2_3;
  
  Serializer1D3_invldSignal <= '1' WHEN Serializer1D3_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  dac_data_4_signed <= signed(dac_data_4);

  Rate_Transition5_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition5_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition5_bypass_reg <= dac_data_4_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition5_bypass_process;

  
  Rate_Transition5_out1 <= dac_data_4_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition5_bypass_reg;

  serial_in_1_3 <= Subsystem3_out1;

  Serializer1D3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D3_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D3_data <= Serializer1D3_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D3_process;

  Serializer1D3_output : PROCESS (Serializer1D3_data, Serializer1D3_invldSignal, serial_in_1_3)
  BEGIN
    Serializer1D3_data_next <= Serializer1D3_data;
    IF Serializer1D3_invldSignal /= '0' THEN 
      serializer_PostProcessed_3 <= serial_in_1_3(0);
    ELSE 
      serializer_PostProcessed_3 <= Serializer1D3_data(0);
    END IF;
    IF Serializer1D3_invldSignal /= '0' THEN 
      Serializer1D3_data_next(0 TO 30) <= serial_in_1_3(1 TO 31);
    ELSE 
      Serializer1D3_data_next(0 TO 29) <= Serializer1D3_data(1 TO 30);
      Serializer1D3_data_next(30) <= serial_in_1_3(31);
    END IF;
  END PROCESS Serializer1D3_output;


  AND5_out1 <= serializer_PostProcessed_3 AND Serializer1D3_out2;

  control_in_2_4 <= Detect_Rise_Positive_out1;

  Serializer1D4_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D4_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D4_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D4_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D4_contl_cnt <= Serializer1D4_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D4_contl_process;

  Serializer1D4_out2 <= control_in_2_4;
  
  Serializer1D4_invldSignal <= '1' WHEN Serializer1D4_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  dac_data_5_signed <= signed(dac_data_5);

  Rate_Transition6_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition6_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition6_bypass_reg <= dac_data_5_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition6_bypass_process;

  
  Rate_Transition6_out1 <= dac_data_5_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition6_bypass_reg;

  serial_in_1_4 <= Subsystem4_out1;

  Serializer1D4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D4_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D4_data <= Serializer1D4_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D4_process;

  Serializer1D4_output : PROCESS (Serializer1D4_data, Serializer1D4_invldSignal, serial_in_1_4)
  BEGIN
    Serializer1D4_data_next <= Serializer1D4_data;
    IF Serializer1D4_invldSignal /= '0' THEN 
      serializer_PostProcessed_4 <= serial_in_1_4(0);
    ELSE 
      serializer_PostProcessed_4 <= Serializer1D4_data(0);
    END IF;
    IF Serializer1D4_invldSignal /= '0' THEN 
      Serializer1D4_data_next(0 TO 30) <= serial_in_1_4(1 TO 31);
    ELSE 
      Serializer1D4_data_next(0 TO 29) <= Serializer1D4_data(1 TO 30);
      Serializer1D4_data_next(30) <= serial_in_1_4(31);
    END IF;
  END PROCESS Serializer1D4_output;


  AND6_out1 <= serializer_PostProcessed_4 AND Serializer1D4_out2;

  control_in_2_5 <= Detect_Rise_Positive_out1;

  Serializer1D5_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D5_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D5_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D5_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D5_contl_cnt <= Serializer1D5_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D5_contl_process;

  Serializer1D5_out2 <= control_in_2_5;
  
  Serializer1D5_invldSignal <= '1' WHEN Serializer1D5_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  dac_data_6_signed <= signed(dac_data_6);

  Rate_Transition7_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition7_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition7_bypass_reg <= dac_data_6_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition7_bypass_process;

  
  Rate_Transition7_out1 <= dac_data_6_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition7_bypass_reg;

  serial_in_1_5 <= Subsystem5_out1;

  Serializer1D5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D5_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D5_data <= Serializer1D5_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D5_process;

  Serializer1D5_output : PROCESS (Serializer1D5_data, Serializer1D5_invldSignal, serial_in_1_5)
  BEGIN
    Serializer1D5_data_next <= Serializer1D5_data;
    IF Serializer1D5_invldSignal /= '0' THEN 
      serializer_PostProcessed_5 <= serial_in_1_5(0);
    ELSE 
      serializer_PostProcessed_5 <= Serializer1D5_data(0);
    END IF;
    IF Serializer1D5_invldSignal /= '0' THEN 
      Serializer1D5_data_next(0 TO 30) <= serial_in_1_5(1 TO 31);
    ELSE 
      Serializer1D5_data_next(0 TO 29) <= Serializer1D5_data(1 TO 30);
      Serializer1D5_data_next(30) <= serial_in_1_5(31);
    END IF;
  END PROCESS Serializer1D5_output;


  AND7_out1 <= serializer_PostProcessed_5 AND Serializer1D5_out2;

  control_in_2_6 <= Detect_Rise_Positive_out1;

  Serializer1D6_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D6_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D6_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D6_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D6_contl_cnt <= Serializer1D6_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D6_contl_process;

  Serializer1D6_out2 <= control_in_2_6;
  
  Serializer1D6_invldSignal <= '1' WHEN Serializer1D6_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  dac_data_7_signed <= signed(dac_data_7);

  Rate_Transition8_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition8_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition8_bypass_reg <= dac_data_7_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition8_bypass_process;

  
  Rate_Transition8_out1 <= dac_data_7_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition8_bypass_reg;

  serial_in_1_6 <= Subsystem6_out1;

  Serializer1D6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D6_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D6_data <= Serializer1D6_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D6_process;

  Serializer1D6_output : PROCESS (Serializer1D6_data, Serializer1D6_invldSignal, serial_in_1_6)
  BEGIN
    Serializer1D6_data_next <= Serializer1D6_data;
    IF Serializer1D6_invldSignal /= '0' THEN 
      serializer_PostProcessed_6 <= serial_in_1_6(0);
    ELSE 
      serializer_PostProcessed_6 <= Serializer1D6_data(0);
    END IF;
    IF Serializer1D6_invldSignal /= '0' THEN 
      Serializer1D6_data_next(0 TO 30) <= serial_in_1_6(1 TO 31);
    ELSE 
      Serializer1D6_data_next(0 TO 29) <= Serializer1D6_data(1 TO 30);
      Serializer1D6_data_next(30) <= serial_in_1_6(31);
    END IF;
  END PROCESS Serializer1D6_output;


  AND8_out1 <= serializer_PostProcessed_6 AND Serializer1D6_out2;

  control_in_2_7 <= Detect_Rise_Positive_out1;

  Serializer1D7_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D7_contl_cnt <= to_unsigned(16#00#, 5);
      ELSIF enb = '1' THEN
        IF Serializer1D7_contl_cnt = to_unsigned(16#1F#, 5) THEN 
          Serializer1D7_contl_cnt <= to_unsigned(16#00#, 5);
        ELSE 
          Serializer1D7_contl_cnt <= Serializer1D7_contl_cnt + to_unsigned(16#01#, 5);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D7_contl_process;

  Serializer1D7_out2 <= control_in_2_7;
  
  Serializer1D7_invldSignal <= '1' WHEN Serializer1D7_contl_cnt = to_unsigned(16#00#, 5) ELSE
      '0';

  dac_data_8_signed <= signed(dac_data_8);

  Rate_Transition9_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Rate_Transition9_bypass_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        Rate_Transition9_bypass_reg <= dac_data_8_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition9_bypass_process;

  
  Rate_Transition9_out1 <= dac_data_8_signed WHEN enb_1_32_1 = '1' ELSE
      Rate_Transition9_bypass_reg;

  serial_in_1_7 <= Subsystem7_out1;

  Serializer1D7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Serializer1D7_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D7_data <= Serializer1D7_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D7_process;

  Serializer1D7_output : PROCESS (Serializer1D7_data, Serializer1D7_invldSignal, serial_in_1_7)
  BEGIN
    Serializer1D7_data_next <= Serializer1D7_data;
    IF Serializer1D7_invldSignal /= '0' THEN 
      serializer_PostProcessed_7 <= serial_in_1_7(0);
    ELSE 
      serializer_PostProcessed_7 <= Serializer1D7_data(0);
    END IF;
    IF Serializer1D7_invldSignal /= '0' THEN 
      Serializer1D7_data_next(0 TO 30) <= serial_in_1_7(1 TO 31);
    ELSE 
      Serializer1D7_data_next(0 TO 29) <= Serializer1D7_data(1 TO 30);
      Serializer1D7_data_next(30) <= serial_in_1_7(31);
    END IF;
  END PROCESS Serializer1D7_output;


  AND9_out1 <= serializer_PostProcessed_7 AND Serializer1D7_out2;

  ce_out <= enb_1_1_1;

  spi_clk_out <= AND2_out1;

  cs_out <= AND1_out1;

  data_out_1 <= AND_out1;

  data_out_2 <= AND3_out1;

  data_out_3 <= AND4_out1;

  data_out_4 <= AND5_out1;

  data_out_5 <= AND6_out1;

  data_out_6 <= AND7_out1;

  data_out_7 <= AND8_out1;

  data_out_8 <= AND9_out1;

END rtl;

