-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_ip_addr_decoder.vhd
-- Created: 2018-11-23 21:50:32
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_ip_addr_decoder
-- Source Path: PWM_and_SS_control_ip/PWM_and_SS_control_ip_axi_lite/PWM_and_SS_control_ip_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_ip_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_PWM_en_rd_AXI                :   IN    std_logic;  -- ufix1
        read_PWM_f_carrier_kHz_rd_AXI     :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        read_PWM_T_carrier_us_rd_AXI      :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        read_PWM_min_pulse_width_rd_AXI   :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        read_Mode_rd_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_PWM_en_AXI                  :   OUT   std_logic;  -- ufix1
        write_Mode_AXI                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        write_PWM_f_carrier_kHz_AXI       :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        write_PWM_T_carrier_us_AXI        :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        write_PWM_min_pulse_wiidth_AXI    :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        write_m_u1_norm_AXI               :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        write_m_u2_norm_AXI               :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        write_m_u3_norm_AXI               :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En12
        );
END PWM_and_SS_control_ip_addr_decoder;


ARCHITECTURE rtl OF PWM_and_SS_control_ip_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_ip_timestamp          : std_logic;  -- ufix1
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_PWM_f_carrier_kHz_rd_AXI_unsigned : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL read_PWM_T_carrier_us_rd_AXI_unsigned : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL read_PWM_min_pulse_width_rd_AXI_unsigned : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL read_Mode_rd_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_Mode_rd_AXI           : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_min_pulse_width_rd_AXI : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_T_carrier_us_rd_AXI : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_f_carrier_kHz_rd_AXI : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_en_rd_AXI         : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_en_rd_AXI           : std_logic;  -- ufix1
  SIGNAL data_in_PWM_en_rd_AXI            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_en_rd_AXI          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_f_carrier_kHz_rd_AXI : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL data_in_PWM_f_carrier_kHz_rd_AXI : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_f_carrier_kHz_rd_AXI : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_T_carrier_us_rd_AXI : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL data_in_PWM_T_carrier_us_rd_AXI  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_T_carrier_us_rd_AXI : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_min_pulse_width_rd_AXI : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL data_in_PWM_min_pulse_width_rd_AXI : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_min_pulse_width_rd_AXI : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_Mode_rd_AXI             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_in_Mode_rd_AXI              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Mode_rd_AXI            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_axi_enable            : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable               : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL write_reg_axi_enable             : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_en_AXI            : std_logic;  -- ufix1
  SIGNAL reg_enb_PWM_en_AXI               : std_logic;  -- ufix1
  SIGNAL data_in_PWM_en_AXI               : std_logic;  -- ufix1
  SIGNAL write_reg_PWM_en_AXI             : std_logic;  -- ufix1
  SIGNAL decode_sel_Mode_AXI              : std_logic;  -- ufix1
  SIGNAL reg_enb_Mode_AXI                 : std_logic;  -- ufix1
  SIGNAL data_in_Mode_AXI                 : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL write_reg_Mode_AXI               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_PWM_f_carrier_kHz_AXI : std_logic;  -- ufix1
  SIGNAL reg_enb_PWM_f_carrier_kHz_AXI    : std_logic;  -- ufix1
  SIGNAL data_in_PWM_f_carrier_kHz_AXI    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL write_reg_PWM_f_carrier_kHz_AXI  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL decode_sel_PWM_T_carrier_us_AXI  : std_logic;  -- ufix1
  SIGNAL reg_enb_PWM_T_carrier_us_AXI     : std_logic;  -- ufix1
  SIGNAL data_in_PWM_T_carrier_us_AXI     : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL write_reg_PWM_T_carrier_us_AXI   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL decode_sel_PWM_min_pulse_wiidth_AXI : std_logic;  -- ufix1
  SIGNAL reg_enb_PWM_min_pulse_wiidth_AXI : std_logic;  -- ufix1
  SIGNAL data_in_PWM_min_pulse_wiidth_AXI : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL write_reg_PWM_min_pulse_wiidth_AXI : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL decode_sel_m_u1_norm_AXI         : std_logic;  -- ufix1
  SIGNAL reg_enb_m_u1_norm_AXI            : std_logic;  -- ufix1
  SIGNAL data_in_m_u1_norm_AXI            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL write_reg_m_u1_norm_AXI          : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL decode_sel_m_u2_norm_AXI         : std_logic;  -- ufix1
  SIGNAL reg_enb_m_u2_norm_AXI            : std_logic;  -- ufix1
  SIGNAL data_in_m_u2_norm_AXI            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL write_reg_m_u2_norm_AXI          : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL decode_sel_m_u3_norm_AXI         : std_logic;  -- ufix1
  SIGNAL reg_enb_m_u3_norm_AXI            : std_logic;  -- ufix1
  SIGNAL data_in_m_u3_norm_AXI            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL write_reg_m_u3_norm_AXI          : signed(13 DOWNTO 0);  -- sfix14_En12

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_ip_timestamp <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  const_1 <= '1';

  enb <= const_1;

  read_PWM_f_carrier_kHz_rd_AXI_unsigned <= unsigned(read_PWM_f_carrier_kHz_rd_AXI);

  read_PWM_T_carrier_us_rd_AXI_unsigned <= unsigned(read_PWM_T_carrier_us_rd_AXI);

  read_PWM_min_pulse_width_rd_AXI_unsigned <= unsigned(read_PWM_min_pulse_width_rd_AXI);

  read_Mode_rd_AXI_unsigned <= unsigned(read_Mode_rd_AXI);

  
  decode_sel_Mode_rd_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004C#, 14) ELSE
      '0';

  
  decode_sel_PWM_min_pulse_width_rd_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004B#, 14) ELSE
      '0';

  
  decode_sel_PWM_T_carrier_us_rd_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004A#, 14) ELSE
      '0';

  
  decode_sel_PWM_f_carrier_kHz_rd_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0049#, 14) ELSE
      '0';

  
  decode_sel_PWM_en_rd_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0048#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_ip_timestamp_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_ip_timestamp <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp <= const_0 WHEN decode_sel_ip_timestamp = '0' ELSE
      read_reg_ip_timestamp;

  reg_PWM_en_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_PWM_en_rd_AXI <= '0';
      ELSIF enb = '1' THEN
        read_reg_PWM_en_rd_AXI <= read_PWM_en_rd_AXI;
      END IF;
    END IF;
  END PROCESS reg_PWM_en_rd_AXI_process;


  data_in_PWM_en_rd_AXI <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_PWM_en_rd_AXI;

  
  decode_rd_PWM_en_rd_AXI <= decode_rd_ip_timestamp WHEN decode_sel_PWM_en_rd_AXI = '0' ELSE
      data_in_PWM_en_rd_AXI;

  reg_PWM_f_carrier_kHz_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_PWM_f_carrier_kHz_rd_AXI <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        read_reg_PWM_f_carrier_kHz_rd_AXI <= read_PWM_f_carrier_kHz_rd_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS reg_PWM_f_carrier_kHz_rd_AXI_process;


  data_in_PWM_f_carrier_kHz_rd_AXI <= resize(read_reg_PWM_f_carrier_kHz_rd_AXI, 32);

  
  decode_rd_PWM_f_carrier_kHz_rd_AXI <= decode_rd_PWM_en_rd_AXI WHEN decode_sel_PWM_f_carrier_kHz_rd_AXI = '0' ELSE
      data_in_PWM_f_carrier_kHz_rd_AXI;

  reg_PWM_T_carrier_us_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_PWM_T_carrier_us_rd_AXI <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        read_reg_PWM_T_carrier_us_rd_AXI <= read_PWM_T_carrier_us_rd_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS reg_PWM_T_carrier_us_rd_AXI_process;


  data_in_PWM_T_carrier_us_rd_AXI <= resize(read_reg_PWM_T_carrier_us_rd_AXI, 32);

  
  decode_rd_PWM_T_carrier_us_rd_AXI <= decode_rd_PWM_f_carrier_kHz_rd_AXI WHEN decode_sel_PWM_T_carrier_us_rd_AXI = '0' ELSE
      data_in_PWM_T_carrier_us_rd_AXI;

  reg_PWM_min_pulse_width_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_PWM_min_pulse_width_rd_AXI <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        read_reg_PWM_min_pulse_width_rd_AXI <= read_PWM_min_pulse_width_rd_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS reg_PWM_min_pulse_width_rd_AXI_process;


  data_in_PWM_min_pulse_width_rd_AXI <= resize(read_reg_PWM_min_pulse_width_rd_AXI, 32);

  
  decode_rd_PWM_min_pulse_width_rd_AXI <= decode_rd_PWM_T_carrier_us_rd_AXI WHEN decode_sel_PWM_min_pulse_width_rd_AXI = '0' ELSE
      data_in_PWM_min_pulse_width_rd_AXI;

  reg_Mode_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_Mode_rd_AXI <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' THEN
        read_reg_Mode_rd_AXI <= read_Mode_rd_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Mode_rd_AXI_process;


  data_in_Mode_rd_AXI <= resize(read_reg_Mode_rd_AXI, 32);

  
  decode_rd_Mode_rd_AXI <= decode_rd_PWM_min_pulse_width_rd_AXI WHEN decode_sel_Mode_rd_AXI = '0' ELSE
      data_in_Mode_rd_AXI;

  data_read <= std_logic_vector(decode_rd_Mode_rd_AXI);

  
  decode_sel_axi_enable <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  reg_enb_axi_enable <= decode_sel_axi_enable AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  reg_axi_enable_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_axi_enable <= '1';
      ELSIF enb = '1' AND reg_enb_axi_enable = '1' THEN
        write_reg_axi_enable <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_process;


  write_axi_enable <= write_reg_axi_enable;

  
  decode_sel_PWM_en_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_PWM_en_AXI <= decode_sel_PWM_en_AXI AND wr_enb;

  data_in_PWM_en_AXI <= data_write_unsigned(0);

  reg_PWM_en_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_PWM_en_AXI <= '0';
      ELSIF enb = '1' AND reg_enb_PWM_en_AXI = '1' THEN
        write_reg_PWM_en_AXI <= data_in_PWM_en_AXI;
      END IF;
    END IF;
  END PROCESS reg_PWM_en_AXI_process;


  write_PWM_en_AXI <= write_reg_PWM_en_AXI;

  
  decode_sel_Mode_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  reg_enb_Mode_AXI <= decode_sel_Mode_AXI AND wr_enb;

  data_in_Mode_AXI <= data_write_unsigned(1 DOWNTO 0);

  reg_Mode_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_Mode_AXI <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' AND reg_enb_Mode_AXI = '1' THEN
        write_reg_Mode_AXI <= data_in_Mode_AXI;
      END IF;
    END IF;
  END PROCESS reg_Mode_AXI_process;


  write_Mode_AXI <= std_logic_vector(write_reg_Mode_AXI);

  
  decode_sel_PWM_f_carrier_kHz_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  reg_enb_PWM_f_carrier_kHz_AXI <= decode_sel_PWM_f_carrier_kHz_AXI AND wr_enb;

  data_in_PWM_f_carrier_kHz_AXI <= data_write_unsigned(7 DOWNTO 0);

  reg_PWM_f_carrier_kHz_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_PWM_f_carrier_kHz_AXI <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' AND reg_enb_PWM_f_carrier_kHz_AXI = '1' THEN
        write_reg_PWM_f_carrier_kHz_AXI <= data_in_PWM_f_carrier_kHz_AXI;
      END IF;
    END IF;
  END PROCESS reg_PWM_f_carrier_kHz_AXI_process;


  write_PWM_f_carrier_kHz_AXI <= std_logic_vector(write_reg_PWM_f_carrier_kHz_AXI);

  
  decode_sel_PWM_T_carrier_us_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  reg_enb_PWM_T_carrier_us_AXI <= decode_sel_PWM_T_carrier_us_AXI AND wr_enb;

  data_in_PWM_T_carrier_us_AXI <= data_write_unsigned(7 DOWNTO 0);

  reg_PWM_T_carrier_us_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_PWM_T_carrier_us_AXI <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' AND reg_enb_PWM_T_carrier_us_AXI = '1' THEN
        write_reg_PWM_T_carrier_us_AXI <= data_in_PWM_T_carrier_us_AXI;
      END IF;
    END IF;
  END PROCESS reg_PWM_T_carrier_us_AXI_process;


  write_PWM_T_carrier_us_AXI <= std_logic_vector(write_reg_PWM_T_carrier_us_AXI);

  
  decode_sel_PWM_min_pulse_wiidth_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  reg_enb_PWM_min_pulse_wiidth_AXI <= decode_sel_PWM_min_pulse_wiidth_AXI AND wr_enb;

  data_in_PWM_min_pulse_wiidth_AXI <= data_write_unsigned(7 DOWNTO 0);

  reg_PWM_min_pulse_wiidth_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_PWM_min_pulse_wiidth_AXI <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' AND reg_enb_PWM_min_pulse_wiidth_AXI = '1' THEN
        write_reg_PWM_min_pulse_wiidth_AXI <= data_in_PWM_min_pulse_wiidth_AXI;
      END IF;
    END IF;
  END PROCESS reg_PWM_min_pulse_wiidth_AXI_process;


  write_PWM_min_pulse_wiidth_AXI <= std_logic_vector(write_reg_PWM_min_pulse_wiidth_AXI);

  
  decode_sel_m_u1_norm_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0045#, 14) ELSE
      '0';

  reg_enb_m_u1_norm_AXI <= decode_sel_m_u1_norm_AXI AND wr_enb;

  data_in_m_u1_norm_AXI <= signed(data_write_unsigned(13 DOWNTO 0));

  reg_m_u1_norm_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_m_u1_norm_AXI <= to_signed(16#0000#, 14);
      ELSIF enb = '1' AND reg_enb_m_u1_norm_AXI = '1' THEN
        write_reg_m_u1_norm_AXI <= data_in_m_u1_norm_AXI;
      END IF;
    END IF;
  END PROCESS reg_m_u1_norm_AXI_process;


  write_m_u1_norm_AXI <= std_logic_vector(write_reg_m_u1_norm_AXI);

  
  decode_sel_m_u2_norm_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0046#, 14) ELSE
      '0';

  reg_enb_m_u2_norm_AXI <= decode_sel_m_u2_norm_AXI AND wr_enb;

  data_in_m_u2_norm_AXI <= signed(data_write_unsigned(13 DOWNTO 0));

  reg_m_u2_norm_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_m_u2_norm_AXI <= to_signed(16#0000#, 14);
      ELSIF enb = '1' AND reg_enb_m_u2_norm_AXI = '1' THEN
        write_reg_m_u2_norm_AXI <= data_in_m_u2_norm_AXI;
      END IF;
    END IF;
  END PROCESS reg_m_u2_norm_AXI_process;


  write_m_u2_norm_AXI <= std_logic_vector(write_reg_m_u2_norm_AXI);

  
  decode_sel_m_u3_norm_AXI <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0047#, 14) ELSE
      '0';

  reg_enb_m_u3_norm_AXI <= decode_sel_m_u3_norm_AXI AND wr_enb;

  data_in_m_u3_norm_AXI <= signed(data_write_unsigned(13 DOWNTO 0));

  reg_m_u3_norm_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_m_u3_norm_AXI <= to_signed(16#0000#, 14);
      ELSIF enb = '1' AND reg_enb_m_u3_norm_AXI = '1' THEN
        write_reg_m_u3_norm_AXI <= data_in_m_u3_norm_AXI;
      END IF;
    END IF;
  END PROCESS reg_m_u3_norm_AXI_process;


  write_m_u3_norm_AXI <= std_logic_vector(write_reg_m_u3_norm_AXI);

END rtl;

