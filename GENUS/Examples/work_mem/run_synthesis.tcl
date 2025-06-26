set DATE [clock format [clock seconds] -format "%b%d-%T"]
read_lib "../TECHFILES/NangateOpenCellLibrary_slow_conditional_ccs.lib ../TECHFILES/memories/rf_2p_136d_74w_1m_4b.lib ../TECHFILES/memories/rf_2p_256d_76w_1m_4b.lib ../TECHFILES/memories/rf_2p_512d_76w_2m_4b.lib ../TECHFILES/memories/sram_sp_16384d_36w_16m_8b.lib ../TECHFILES/memories/sram_sp_32768d_33w_16m_8b.lib ../TECHFILES/memories/sram_sp_512d_32w_4m_2b.lib"
read_hdl ../RTL/mem_block.v
elaborate
set_top_module
check_design -unresolved
create_clock -name clk -period 5 [get_ports clk]
if {[llength [all_registers]] > 0} { 
  define_cost_group -name I2C -design memory_system_with_lib
  define_cost_group -name C2O -design memory_system_with_lib
  define_cost_group -name C2C -design memory_system_with_lib
  path_group -from [all_registers] -to [all_registers] -group C2C -name C2C
  path_group -from [all_registers] -to [all_outputs] -group C2O -name C2O
  path_group -from [all_inputs]  -to [all_registers] -group I2C -name I2C
}
define_cost_group -name I2O -design memory_system_with_lib
path_group -from [all_inputs]  -to [all_outputs] -group I2O -name I2O
foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> ./OUTPUTS_${DATE}/REPORTS_${DATE}/memory_system_with_lib_pretim.rpt
}
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/generic/memory_system_with_lib_datapath.rpt
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag generic
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
syn_map
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag map
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/map/memory_system_with_lib_datapath.rpt
syn_opt
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag opt
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/opt/memory_system_with_lib_datapath.rpt
foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> ./OUTPUTS_${DATE}/REPORTS_${DATE}/memory_system_with_lib_post_opt_time.rpt
}
write_hdl > ./OUTPUTS_${DATE}/memory_system_with_lib_opt.v
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/memory_system_with_lib_datapath_incr.rpt
report_messages > ./OUTPUTS_${DATE}/REPORTS_${DATE}/memory_system_with_lib_messages.rpt
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag final
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
write_sdc > ./OUTPUTS_${DATE}/memory_system_with_lib_m.sdc
write_do_lec -golden_design fv_map -revised_design ./OUTPUTS_${DATE}/memory_system_with_lib_m.v -logfile  ./intermediate2final.lec.log > ./OUTPUTS_${DATE}/intermediate2final.lec.do
