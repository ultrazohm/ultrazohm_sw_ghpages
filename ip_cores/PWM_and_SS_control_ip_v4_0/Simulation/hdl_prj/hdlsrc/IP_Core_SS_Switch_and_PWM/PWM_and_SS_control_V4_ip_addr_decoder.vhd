-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/IP_Core_SS_Switch_and_PWM/PWM_and_SS_control_V4_ip_addr_decoder.vhd
-- Created: 2022-06-02 16:38:24
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V4_ip_addr_decoder
-- Source Path: PWM_and_SS_control_V4_ip/PWM_and_SS_control_V4_ip_axi_lite/PWM_and_SS_control_V4_ip_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_V4_ip_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_PWM_en_rd_AXI                :   IN    std_logic;  -- ufix1
        read_PWM_f_carrier_kHz_rd_AXI     :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
        read_PWM_T_carrier_us_rd_AXI      :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
        read_PWM_min_pulse_width_rd_AXI   :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        read_Mode_rd_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_PWM_en_AXI                  :   OUT   std_logic;  -- ufix1
        write_Mode_AXI                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        write_Scal_f_carrier_AXI          :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
        write_Scal_T_carrier_AXI          :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
        write_PWM_min_pulse_width_AXI     :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        write_m_u1_norm_AXI               :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        write_m_u2_norm_AXI               :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        write_m_u3_norm_AXI               :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        write_TriState_HB1_AXI            :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        write_TriState_HB2_AXI            :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        write_TriState_HB3_AXI            :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        write_triangle_shift              :   OUT   std_logic_vector(17 DOWNTO 0);  -- ufix18_En17
        write_count_src_ext_AXI           :   OUT   std_logic  -- ufix1
        );
END PWM_and_SS_control_V4_ip_addr_decoder;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_ip_timestamp_1_1      : std_logic;  -- ufix1
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_PWM_f_carrier_kHz_rd_AXI_unsigned : unsigned(24 DOWNTO 0);  -- ufix25_En26
  SIGNAL read_PWM_T_carrier_us_rd_AXI_unsigned : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL read_PWM_min_pulse_width_rd_AXI_signed : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL read_Mode_rd_AXI_unsigned        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_Mode_rd_AXI_1_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_min_pulse_width_rd_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_T_carrier_us_rd_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_f_carrier_kHz_rd_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_en_rd_AXI_1_1     : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_en_rd_AXI           : std_logic;  -- ufix1
  SIGNAL data_slice_PWM_en_rd_AXI_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_en_rd_AXI_1_1      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_f_carrier_kHz_rd_AXI : unsigned(24 DOWNTO 0);  -- ufix25_En26
  SIGNAL data_slice_PWM_f_carrier_kHz_rd_AXI_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_f_carrier_kHz_rd_AXI_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_T_carrier_us_rd_AXI : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL data_slice_PWM_T_carrier_us_rd_AXI_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_T_carrier_us_rd_AXI_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PWM_min_pulse_width_rd_AXI : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL data_slice_PWM_min_pulse_width_rd_AXI_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PWM_min_pulse_width_rd_AXI_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_Mode_rd_AXI             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_slice_Mode_rd_AXI_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Mode_rd_AXI_1_1        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_axi_enable_1_1        : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable_1_1           : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL data_reg_axi_enable_1_1          : std_logic;  -- ufix1
  SIGNAL write_concats_axi_enable_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_PWM_en_AXI_1_1        : std_logic;  -- ufix1
  SIGNAL reg_enb_PWM_en_AXI_1_1           : std_logic;  -- ufix1
  SIGNAL data_in_PWM_en_AXI               : std_logic;  -- ufix1
  SIGNAL data_reg_PWM_en_AXI_1_1          : std_logic;  -- ufix1
  SIGNAL write_concats_PWM_en_AXI_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_Mode_AXI_1_1          : std_logic;  -- ufix1
  SIGNAL reg_enb_Mode_AXI_1_1             : std_logic;  -- ufix1
  SIGNAL data_in_Mode_AXI                 : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_reg_Mode_AXI_1_1            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_Scal_f_carrier_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL reg_enb_Scal_f_carrier_AXI_1_1   : std_logic;  -- ufix1
  SIGNAL data_in_Scal_f_carrier_AXI       : unsigned(24 DOWNTO 0);  -- ufix25_En26
  SIGNAL data_reg_Scal_f_carrier_AXI_1_1  : unsigned(24 DOWNTO 0);  -- ufix25_En26
  SIGNAL decode_sel_Scal_T_carrier_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL reg_enb_Scal_T_carrier_AXI_1_1   : std_logic;  -- ufix1
  SIGNAL data_in_Scal_T_carrier_AXI       : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL data_reg_Scal_T_carrier_AXI_1_1  : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL decode_sel_PWM_min_pulse_width_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL reg_enb_PWM_min_pulse_width_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL data_in_PWM_min_pulse_width_AXI  : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL data_reg_PWM_min_pulse_width_AXI_1_1 : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL decode_sel_m_u1_norm_AXI_1_1     : std_logic;  -- ufix1
  SIGNAL reg_enb_m_u1_norm_AXI_1_1        : std_logic;  -- ufix1
  SIGNAL data_in_m_u1_norm_AXI            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL data_reg_m_u1_norm_AXI_1_1       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL decode_sel_m_u2_norm_AXI_1_1     : std_logic;  -- ufix1
  SIGNAL reg_enb_m_u2_norm_AXI_1_1        : std_logic;  -- ufix1
  SIGNAL data_in_m_u2_norm_AXI            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL data_reg_m_u2_norm_AXI_1_1       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL decode_sel_m_u3_norm_AXI_1_1     : std_logic;  -- ufix1
  SIGNAL reg_enb_m_u3_norm_AXI_1_1        : std_logic;  -- ufix1
  SIGNAL data_in_m_u3_norm_AXI            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL data_reg_m_u3_norm_AXI_1_1       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL decode_sel_TriState_HB1_AXI_1_1  : std_logic;  -- ufix1
  SIGNAL reg_enb_TriState_HB1_AXI_1_1     : std_logic;  -- ufix1
  SIGNAL data_in_TriState_HB1_AXI         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_reg_TriState_HB1_AXI_1_1    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_TriState_HB2_AXI_1_1  : std_logic;  -- ufix1
  SIGNAL reg_enb_TriState_HB2_AXI_1_1     : std_logic;  -- ufix1
  SIGNAL data_in_TriState_HB2_AXI         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_reg_TriState_HB2_AXI_1_1    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_TriState_HB3_AXI_1_1  : std_logic;  -- ufix1
  SIGNAL reg_enb_TriState_HB3_AXI_1_1     : std_logic;  -- ufix1
  SIGNAL data_in_TriState_HB3_AXI         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_reg_TriState_HB3_AXI_1_1    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_triangle_shift_1_1    : std_logic;  -- ufix1
  SIGNAL reg_enb_triangle_shift_1_1       : std_logic;  -- ufix1
  SIGNAL data_in_triangle_shift           : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL data_reg_triangle_shift_1_1      : unsigned(17 DOWNTO 0);  -- ufix18_En17
  SIGNAL decode_sel_count_src_ext_AXI_1_1 : std_logic;  -- ufix1
  SIGNAL reg_enb_count_src_ext_AXI_1_1    : std_logic;  -- ufix1
  SIGNAL data_in_count_src_ext_AXI        : std_logic;  -- ufix1
  SIGNAL data_reg_count_src_ext_AXI_1_1   : std_logic;  -- ufix1
  SIGNAL write_concats_count_src_ext_AXI_1 : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_ip_timestamp_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  const_1 <= '1';

  enb <= const_1;

  read_PWM_f_carrier_kHz_rd_AXI_unsigned <= unsigned(read_PWM_f_carrier_kHz_rd_AXI);

  read_PWM_T_carrier_us_rd_AXI_unsigned <= unsigned(read_PWM_T_carrier_us_rd_AXI);

  read_PWM_min_pulse_width_rd_AXI_signed <= signed(read_PWM_min_pulse_width_rd_AXI);

  read_Mode_rd_AXI_unsigned <= unsigned(read_Mode_rd_AXI);

  
  decode_sel_Mode_rd_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0051#, 14) ELSE
      '0';

  
  decode_sel_PWM_min_pulse_width_rd_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0050#, 14) ELSE
      '0';

  
  decode_sel_PWM_T_carrier_us_rd_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004F#, 14) ELSE
      '0';

  
  decode_sel_PWM_f_carrier_kHz_rd_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004E#, 14) ELSE
      '0';

  
  decode_sel_PWM_en_rd_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004D#, 14) ELSE
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


  
  decode_rd_ip_timestamp_1_1 <= const_0 WHEN decode_sel_ip_timestamp_1_1 = '0' ELSE
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


  data_slice_PWM_en_rd_AXI_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_PWM_en_rd_AXI;

  
  decode_rd_PWM_en_rd_AXI_1_1 <= decode_rd_ip_timestamp_1_1 WHEN decode_sel_PWM_en_rd_AXI_1_1 = '0' ELSE
      data_slice_PWM_en_rd_AXI_1;

  reg_PWM_f_carrier_kHz_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_PWM_f_carrier_kHz_rd_AXI <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' THEN
        read_reg_PWM_f_carrier_kHz_rd_AXI <= read_PWM_f_carrier_kHz_rd_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS reg_PWM_f_carrier_kHz_rd_AXI_process;


  data_slice_PWM_f_carrier_kHz_rd_AXI_1 <= resize(read_reg_PWM_f_carrier_kHz_rd_AXI, 32);

  
  decode_rd_PWM_f_carrier_kHz_rd_AXI_1_1 <= decode_rd_PWM_en_rd_AXI_1_1 WHEN decode_sel_PWM_f_carrier_kHz_rd_AXI_1_1 = '0' ELSE
      data_slice_PWM_f_carrier_kHz_rd_AXI_1;

  reg_PWM_T_carrier_us_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_PWM_T_carrier_us_rd_AXI <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' THEN
        read_reg_PWM_T_carrier_us_rd_AXI <= read_PWM_T_carrier_us_rd_AXI_unsigned;
      END IF;
    END IF;
  END PROCESS reg_PWM_T_carrier_us_rd_AXI_process;


  data_slice_PWM_T_carrier_us_rd_AXI_1 <= resize(read_reg_PWM_T_carrier_us_rd_AXI, 32);

  
  decode_rd_PWM_T_carrier_us_rd_AXI_1_1 <= decode_rd_PWM_f_carrier_kHz_rd_AXI_1_1 WHEN decode_sel_PWM_T_carrier_us_rd_AXI_1_1 = '0' ELSE
      data_slice_PWM_T_carrier_us_rd_AXI_1;

  reg_PWM_min_pulse_width_rd_AXI_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_PWM_min_pulse_width_rd_AXI <= to_signed(16#00000#, 18);
      ELSIF enb = '1' THEN
        read_reg_PWM_min_pulse_width_rd_AXI <= read_PWM_min_pulse_width_rd_AXI_signed;
      END IF;
    END IF;
  END PROCESS reg_PWM_min_pulse_width_rd_AXI_process;


  data_slice_PWM_min_pulse_width_rd_AXI_1 <= unsigned(resize(read_reg_PWM_min_pulse_width_rd_AXI, 32));

  
  decode_rd_PWM_min_pulse_width_rd_AXI_1_1 <= decode_rd_PWM_T_carrier_us_rd_AXI_1_1 WHEN decode_sel_PWM_min_pulse_width_rd_AXI_1_1 = '0' ELSE
      data_slice_PWM_min_pulse_width_rd_AXI_1;

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


  data_slice_Mode_rd_AXI_1 <= resize(read_reg_Mode_rd_AXI, 32);

  
  decode_rd_Mode_rd_AXI_1_1 <= decode_rd_PWM_min_pulse_width_rd_AXI_1_1 WHEN decode_sel_Mode_rd_AXI_1_1 = '0' ELSE
      data_slice_Mode_rd_AXI_1;

  data_read <= std_logic_vector(decode_rd_Mode_rd_AXI_1_1);

  
  decode_sel_axi_enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  reg_enb_axi_enable_1_1 <= decode_sel_axi_enable_1_1 AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  reg_axi_enable_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_axi_enable_1_1 <= '1';
      ELSIF enb = '1' AND reg_enb_axi_enable_1_1 = '1' THEN
        data_reg_axi_enable_1_1 <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_1_1_process;


  write_concats_axi_enable_1 <= data_reg_axi_enable_1_1;

  write_axi_enable <= write_concats_axi_enable_1;

  
  decode_sel_PWM_en_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_PWM_en_AXI_1_1 <= decode_sel_PWM_en_AXI_1_1 AND wr_enb;

  data_in_PWM_en_AXI <= data_write_unsigned(0);

  reg_PWM_en_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_PWM_en_AXI_1_1 <= '0';
      ELSIF enb = '1' AND reg_enb_PWM_en_AXI_1_1 = '1' THEN
        data_reg_PWM_en_AXI_1_1 <= data_in_PWM_en_AXI;
      END IF;
    END IF;
  END PROCESS reg_PWM_en_AXI_1_1_process;


  write_concats_PWM_en_AXI_1 <= data_reg_PWM_en_AXI_1_1;

  write_PWM_en_AXI <= write_concats_PWM_en_AXI_1;

  
  decode_sel_Mode_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  reg_enb_Mode_AXI_1_1 <= decode_sel_Mode_AXI_1_1 AND wr_enb;

  data_in_Mode_AXI <= data_write_unsigned(1 DOWNTO 0);

  reg_Mode_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_Mode_AXI_1_1 <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' AND reg_enb_Mode_AXI_1_1 = '1' THEN
        data_reg_Mode_AXI_1_1 <= data_in_Mode_AXI;
      END IF;
    END IF;
  END PROCESS reg_Mode_AXI_1_1_process;


  write_Mode_AXI <= std_logic_vector(data_reg_Mode_AXI_1_1);

  
  decode_sel_Scal_f_carrier_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  reg_enb_Scal_f_carrier_AXI_1_1 <= decode_sel_Scal_f_carrier_AXI_1_1 AND wr_enb;

  data_in_Scal_f_carrier_AXI <= data_write_unsigned(24 DOWNTO 0);

  reg_Scal_f_carrier_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_Scal_f_carrier_AXI_1_1 <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' AND reg_enb_Scal_f_carrier_AXI_1_1 = '1' THEN
        data_reg_Scal_f_carrier_AXI_1_1 <= data_in_Scal_f_carrier_AXI;
      END IF;
    END IF;
  END PROCESS reg_Scal_f_carrier_AXI_1_1_process;


  write_Scal_f_carrier_AXI <= std_logic_vector(data_reg_Scal_f_carrier_AXI_1_1);

  
  decode_sel_Scal_T_carrier_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  reg_enb_Scal_T_carrier_AXI_1_1 <= decode_sel_Scal_T_carrier_AXI_1_1 AND wr_enb;

  data_in_Scal_T_carrier_AXI <= data_write_unsigned(24 DOWNTO 0);

  reg_Scal_T_carrier_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_Scal_T_carrier_AXI_1_1 <= to_unsigned(16#0000000#, 25);
      ELSIF enb = '1' AND reg_enb_Scal_T_carrier_AXI_1_1 = '1' THEN
        data_reg_Scal_T_carrier_AXI_1_1 <= data_in_Scal_T_carrier_AXI;
      END IF;
    END IF;
  END PROCESS reg_Scal_T_carrier_AXI_1_1_process;


  write_Scal_T_carrier_AXI <= std_logic_vector(data_reg_Scal_T_carrier_AXI_1_1);

  
  decode_sel_PWM_min_pulse_width_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  reg_enb_PWM_min_pulse_width_AXI_1_1 <= decode_sel_PWM_min_pulse_width_AXI_1_1 AND wr_enb;

  data_in_PWM_min_pulse_width_AXI <= signed(data_write_unsigned(17 DOWNTO 0));

  reg_PWM_min_pulse_width_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_PWM_min_pulse_width_AXI_1_1 <= to_signed(16#00000#, 18);
      ELSIF enb = '1' AND reg_enb_PWM_min_pulse_width_AXI_1_1 = '1' THEN
        data_reg_PWM_min_pulse_width_AXI_1_1 <= data_in_PWM_min_pulse_width_AXI;
      END IF;
    END IF;
  END PROCESS reg_PWM_min_pulse_width_AXI_1_1_process;


  write_PWM_min_pulse_width_AXI <= std_logic_vector(data_reg_PWM_min_pulse_width_AXI_1_1);

  
  decode_sel_m_u1_norm_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0045#, 14) ELSE
      '0';

  reg_enb_m_u1_norm_AXI_1_1 <= decode_sel_m_u1_norm_AXI_1_1 AND wr_enb;

  data_in_m_u1_norm_AXI <= signed(data_write_unsigned(13 DOWNTO 0));

  reg_m_u1_norm_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_m_u1_norm_AXI_1_1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' AND reg_enb_m_u1_norm_AXI_1_1 = '1' THEN
        data_reg_m_u1_norm_AXI_1_1 <= data_in_m_u1_norm_AXI;
      END IF;
    END IF;
  END PROCESS reg_m_u1_norm_AXI_1_1_process;


  write_m_u1_norm_AXI <= std_logic_vector(data_reg_m_u1_norm_AXI_1_1);

  
  decode_sel_m_u2_norm_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0046#, 14) ELSE
      '0';

  reg_enb_m_u2_norm_AXI_1_1 <= decode_sel_m_u2_norm_AXI_1_1 AND wr_enb;

  data_in_m_u2_norm_AXI <= signed(data_write_unsigned(13 DOWNTO 0));

  reg_m_u2_norm_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_m_u2_norm_AXI_1_1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' AND reg_enb_m_u2_norm_AXI_1_1 = '1' THEN
        data_reg_m_u2_norm_AXI_1_1 <= data_in_m_u2_norm_AXI;
      END IF;
    END IF;
  END PROCESS reg_m_u2_norm_AXI_1_1_process;


  write_m_u2_norm_AXI <= std_logic_vector(data_reg_m_u2_norm_AXI_1_1);

  
  decode_sel_m_u3_norm_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0047#, 14) ELSE
      '0';

  reg_enb_m_u3_norm_AXI_1_1 <= decode_sel_m_u3_norm_AXI_1_1 AND wr_enb;

  data_in_m_u3_norm_AXI <= signed(data_write_unsigned(13 DOWNTO 0));

  reg_m_u3_norm_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_m_u3_norm_AXI_1_1 <= to_signed(16#0000#, 14);
      ELSIF enb = '1' AND reg_enb_m_u3_norm_AXI_1_1 = '1' THEN
        data_reg_m_u3_norm_AXI_1_1 <= data_in_m_u3_norm_AXI;
      END IF;
    END IF;
  END PROCESS reg_m_u3_norm_AXI_1_1_process;


  write_m_u3_norm_AXI <= std_logic_vector(data_reg_m_u3_norm_AXI_1_1);

  
  decode_sel_TriState_HB1_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0048#, 14) ELSE
      '0';

  reg_enb_TriState_HB1_AXI_1_1 <= decode_sel_TriState_HB1_AXI_1_1 AND wr_enb;

  data_in_TriState_HB1_AXI <= data_write_unsigned(1 DOWNTO 0);

  reg_TriState_HB1_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_TriState_HB1_AXI_1_1 <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' AND reg_enb_TriState_HB1_AXI_1_1 = '1' THEN
        data_reg_TriState_HB1_AXI_1_1 <= data_in_TriState_HB1_AXI;
      END IF;
    END IF;
  END PROCESS reg_TriState_HB1_AXI_1_1_process;


  write_TriState_HB1_AXI <= std_logic_vector(data_reg_TriState_HB1_AXI_1_1);

  
  decode_sel_TriState_HB2_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0049#, 14) ELSE
      '0';

  reg_enb_TriState_HB2_AXI_1_1 <= decode_sel_TriState_HB2_AXI_1_1 AND wr_enb;

  data_in_TriState_HB2_AXI <= data_write_unsigned(1 DOWNTO 0);

  reg_TriState_HB2_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_TriState_HB2_AXI_1_1 <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' AND reg_enb_TriState_HB2_AXI_1_1 = '1' THEN
        data_reg_TriState_HB2_AXI_1_1 <= data_in_TriState_HB2_AXI;
      END IF;
    END IF;
  END PROCESS reg_TriState_HB2_AXI_1_1_process;


  write_TriState_HB2_AXI <= std_logic_vector(data_reg_TriState_HB2_AXI_1_1);

  
  decode_sel_TriState_HB3_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004A#, 14) ELSE
      '0';

  reg_enb_TriState_HB3_AXI_1_1 <= decode_sel_TriState_HB3_AXI_1_1 AND wr_enb;

  data_in_TriState_HB3_AXI <= data_write_unsigned(1 DOWNTO 0);

  reg_TriState_HB3_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_TriState_HB3_AXI_1_1 <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' AND reg_enb_TriState_HB3_AXI_1_1 = '1' THEN
        data_reg_TriState_HB3_AXI_1_1 <= data_in_TriState_HB3_AXI;
      END IF;
    END IF;
  END PROCESS reg_TriState_HB3_AXI_1_1_process;


  write_TriState_HB3_AXI <= std_logic_vector(data_reg_TriState_HB3_AXI_1_1);

  
  decode_sel_triangle_shift_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004B#, 14) ELSE
      '0';

  reg_enb_triangle_shift_1_1 <= decode_sel_triangle_shift_1_1 AND wr_enb;

  data_in_triangle_shift <= data_write_unsigned(17 DOWNTO 0);

  reg_triangle_shift_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_triangle_shift_1_1 <= to_unsigned(16#00000#, 18);
      ELSIF enb = '1' AND reg_enb_triangle_shift_1_1 = '1' THEN
        data_reg_triangle_shift_1_1 <= data_in_triangle_shift;
      END IF;
    END IF;
  END PROCESS reg_triangle_shift_1_1_process;


  write_triangle_shift <= std_logic_vector(data_reg_triangle_shift_1_1);

  
  decode_sel_count_src_ext_AXI_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004C#, 14) ELSE
      '0';

  reg_enb_count_src_ext_AXI_1_1 <= decode_sel_count_src_ext_AXI_1_1 AND wr_enb;

  data_in_count_src_ext_AXI <= data_write_unsigned(0);

  reg_count_src_ext_AXI_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_count_src_ext_AXI_1_1 <= '0';
      ELSIF enb = '1' AND reg_enb_count_src_ext_AXI_1_1 = '1' THEN
        data_reg_count_src_ext_AXI_1_1 <= data_in_count_src_ext_AXI;
      END IF;
    END IF;
  END PROCESS reg_count_src_ext_AXI_1_1_process;


  write_concats_count_src_ext_AXI_1 <= data_reg_count_src_ext_AXI_1_1;

  write_count_src_ext_AXI <= write_concats_count_src_ext_AXI_1;

END rtl;

