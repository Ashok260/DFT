set DATE [clock format [clock seconds] -format "%b%d-%T"]
read_libs ../TECHFILES/NangateOpenCellLibrary_slow_conditional_ccs.lib
read_hdl ../RTL/s298_Mod.v
elaborate
set_top_module
check_design -unresolved
read_sdc ../SDC/s298.sdc
if {[llength [all_registers]] > 0} { 
  define_cost_group -name I2C -design s298
  define_cost_group -name C2O -design s298
  define_cost_group -name C2C -design s298
  path_group -from [all_registers] -to [all_registers] -group C2C -name C2C
  path_group -from [all_registers] -to [all_outputs] -group C2O -name C2O
  path_group -from [all_inputs]  -to [all_registers] -group I2C -name I2C
}
define_cost_group -name I2O -design s298
path_group -from [all_inputs]  -to [all_outputs] -group I2O -name I2O
foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> ./OUTPUTS_${DATE}/REPORTS_${DATE}/s298_pretim.rpt
}
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/generic/s298_datapath.rpt
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag generic
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
syn_map
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag map
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/map/s298_datapath.rpt
syn_opt
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag opt
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/opt/s298_datapath.rpt
foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> ./OUTPUTS_${DATE}/REPORTS_${DATE}/s298_post_opt_time.rpt
}
write_hdl > ./OUTPUTS_${DATE}/s298_opt.v
report_dp > ./OUTPUTS_${DATE}/REPORTS_${DATE}/s298_datapath_incr.rpt
report_messages > ./OUTPUTS_${DATE}/REPORTS_${DATE}/s298_messages.rpt
write_snapshot -outdir ./OUTPUTS_${DATE}/REPORTS_${DATE} -tag final
report_summary -directory ./OUTPUTS_${DATE}/REPORTS_${DATE}
write_sdc > ./OUTPUTS_${DATE}/s298_m.sdc
write_do_lec -golden_design fv_map -revised_design ./OUTPUTS_${DATE}/s298_m.v -logfile  ./intermediate2final.lec.log > ./OUTPUTS_${DATE}/intermediate2final.lec.do
