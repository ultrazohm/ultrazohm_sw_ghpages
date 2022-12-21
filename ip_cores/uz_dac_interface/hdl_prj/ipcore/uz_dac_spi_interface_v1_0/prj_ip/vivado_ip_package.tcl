create_project prj_ip {} -part xazu11eg-ffvf1517-1-i -force
set_property ip_repo_paths {../../} [current_fileset]

# Add HDL source files to project
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Detect_Rise_Positive.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem1.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem2.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem3.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem4.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem5.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem6.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_Subsystem7.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface_tc.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_reset_sync.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_dut.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_addr_decoder.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_generic.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_rdfifo_data.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_singlebit.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_rdfifo_last.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_rdfifo_rid.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_axi4_module.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface_axi4.vhd}
add_files -norecurse {../hdl/vhdl/uz_dac_spi_interface.vhd}
set_property top uz_dac_spi_interface [get_filesets sources_1]
set_property top uz_dac_spi_interface [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Package IP from project
ipx::package_project -root_dir {../} -force

# Set IP properties
set_property name uz_dac_spi_interface [ipx::current_core]
set_property display_name uz_dac_spi_interface [ipx::current_core]
set_property version {1.0} [ipx::current_core]
set_property library {ip} [ipx::current_core]
set Families [split [lsort -uniq [get_property C_FAMILY [get_parts]]]]
set IPSupportedFamily {}
foreach family $Families {append IPSupportedFamily "{$family} {Production} "}
set_property supported_families $IPSupportedFamily [ipx::current_core]
set_property taxonomy {{/HDL Coder Generated IP}} [ipx::current_core]
set_property description {HDL Coder generated IP} [ipx::current_core]
set_property core_revision 2112508800 [ipx::current_core]

# Add HDL source files to IP
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Detect_Rise_Positive.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Detect_Rise_Positive.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Detect_Rise_Positive.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Detect_Rise_Positive.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_Subsystem7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_Subsystem7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface_tc.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface_tc.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_src_uz_dac_spi_interface.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_dut.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_dut.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_rdfifo_data.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_rdfifo_data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_rdfifo_data.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_rdfifo_data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_rdfifo_last.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_rdfifo_last.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_rdfifo_last.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_rdfifo_last.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_rdfifo_rid.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_rdfifo_rid.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_rdfifo_rid.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_rdfifo_rid.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_axi4_module.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_axi4_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_axi4_module.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_axi4_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_axi4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_axi4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface_axi4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface_axi4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/uz_dac_spi_interface.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/uz_dac_spi_interface.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]

# Add bus interfaces
ipx::remove_all_bus_interface [ipx::current_core]
ipx::remove_all_memory_map [ipx::current_core]
ipx::remove_all_address_space [ipx::current_core]
# AXI4 Slave
ipx::add_bus_interface {AXI4} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:aximm_rtl:1.0} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:aximm:1.0} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
ipx::add_port_map {AWID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWID} [ipx::get_port_maps AWID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWADDR} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWADDR} [ipx::get_port_maps AWADDR -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWLEN} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWLEN} [ipx::get_port_maps AWLEN -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWSIZE} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWSIZE} [ipx::get_port_maps AWSIZE -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWBURST} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWBURST} [ipx::get_port_maps AWBURST -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWLOCK} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWLOCK} [ipx::get_port_maps AWLOCK -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWCACHE} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWCACHE} [ipx::get_port_maps AWCACHE -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWPROT} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWPROT} [ipx::get_port_maps AWPROT -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWVALID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWVALID} [ipx::get_port_maps AWVALID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {WDATA} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_WDATA} [ipx::get_port_maps WDATA -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {WSTRB} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_WSTRB} [ipx::get_port_maps WSTRB -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {WLAST} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_WLAST} [ipx::get_port_maps WLAST -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {WVALID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_WVALID} [ipx::get_port_maps WVALID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {BREADY} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_BREADY} [ipx::get_port_maps BREADY -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARID} [ipx::get_port_maps ARID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARADDR} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARADDR} [ipx::get_port_maps ARADDR -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARLEN} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARLEN} [ipx::get_port_maps ARLEN -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARSIZE} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARSIZE} [ipx::get_port_maps ARSIZE -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARBURST} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARBURST} [ipx::get_port_maps ARBURST -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARLOCK} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARLOCK} [ipx::get_port_maps ARLOCK -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARCACHE} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARCACHE} [ipx::get_port_maps ARCACHE -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARPROT} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARPROT} [ipx::get_port_maps ARPROT -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARVALID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARVALID} [ipx::get_port_maps ARVALID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {RREADY} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_RREADY} [ipx::get_port_maps RREADY -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {AWREADY} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_AWREADY} [ipx::get_port_maps AWREADY -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {WREADY} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_WREADY} [ipx::get_port_maps WREADY -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {BID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_BID} [ipx::get_port_maps BID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {BRESP} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_BRESP} [ipx::get_port_maps BRESP -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {BVALID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_BVALID} [ipx::get_port_maps BVALID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {ARREADY} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARREADY} [ipx::get_port_maps ARREADY -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {RID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_RID} [ipx::get_port_maps RID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {RDATA} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_RDATA} [ipx::get_port_maps RDATA -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {RRESP} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_RRESP} [ipx::get_port_maps RRESP -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {RLAST} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_RLAST} [ipx::get_port_maps RLAST -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_port_map {RVALID} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
set_property physical_name {AXI4_RVALID} [ipx::get_port_maps RVALID -of_objects [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_signal_clock} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ACLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_signal_reset} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces AXI4_signal_reset -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces AXI4_signal_reset -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces AXI4_signal_reset -of_objects [ipx::current_core]]
set_property physical_name {AXI4_ARESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces AXI4_signal_reset -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_BUSIF} [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4} [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4_ARESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces AXI4_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces AXI4_signal_reset -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces AXI4_signal_reset -of_objects [ipx::current_core]]]
ipx::add_memory_map {AXI4} [ipx::current_core]
set_property slave_memory_map_ref {AXI4} [ipx::get_bus_interfaces AXI4 -of_objects [ipx::current_core]]
ipx::add_address_block {reg0} [ipx::get_memory_maps AXI4 -of_objects [ipx::current_core]]
set_property range {65536} [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps AXI4 -of_objects [ipx::current_core]]]


# Add IP clock and reset definition
ipx::add_bus_interface {IPCORE_CLK} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_CLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_interface {IPCORE_RESETN} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_RESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property value {IPCORE_RESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]


# Add report files
ipx::add_file_group -type {product_guide} {} [ipx::current_core]
ipx::add_file {doc/doc_arch_axi4.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/doc_arch_axi4.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/free_running.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/free_running.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/uz_dac_spi_interface_ip_core_report.html} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{html}} [ipx::get_files {doc/uz_dac_spi_interface_ip_core_report.html} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]

# Add C files
ipx::add_file_group -type {misc} {} [ipx::current_core]
ipx::add_file {include/uz_dac_spi_interface_addr.h} [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]
set_property type {{cSource}} [ipx::get_files {include/uz_dac_spi_interface_addr.h} -of_objects [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]]
ipx::create_xgui_files [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::save_core [ipx::current_core]

# Package IP
ipx::archive_core {../uz_dac_spi_interface_v1_0.zip} [ipx::current_core]
close_project
exit
