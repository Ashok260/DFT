#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Sat Apr  5 13:00:25 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_lib ../Tech_files/slow.lib
read_lib -lef ../Tech_files/all.lef
read_verilog ../Tech_files/vorca_fixed.v
set_top_module
create_clock -name sclk -period 5 [get_ports clk]
set_delay_cal_mode -siAware true
set_si_mode -enable_delay_report true
set_si_mode -enable_glitch_report true
set_si_mode -enable_glitch_propagation true
set_global timing_pba_exhaustive_path_nworst_limit 2
set_global timing_path_based_exhaustive_max_paths_limit 1000
update_timing -full
report_timing
report_timing -max_paths 10000000 -retime path_slew_propagation -retime_mode exhaustive -max_slack 0.200 > epba_${DATE}.rpt
check_design -type timing -out_file reports_Apr05-13:01:57/check_design.rpt
check_timing -verbose > ${reportDir}/check_timing.rpt
report_analysis_coverage            > ${reportDir}/coverage.rpt
report_clocks                       > ${reportDir}/clocks.rpt
report_case_analysis                > ${reportDir}/case_analysis.rpt
report_inactive_arcs                > ${reportDir}/inactive_arcs.rpt
report_constraint -all_violators > reports_Apr05-13:01:57/allviol.rpt
report_analysis_summary                                         > ${reportDir}/analysis_summary.rpt
report_timing -path_type summary_slack_only -late -max_paths 5  > ${reportDir}/start_end_slack.rpt
report_timing -late   -max_paths 50 -nworst 1 -path_type full_clock -net  > ${reportDir}/worst_max_path.rpt
report_timing -early  -max_paths 50 -nworst 1 -path_type full_clock -net  > ${reportDir}/worst_min_path.rpt
report_timing -path_type end_slack_only                       > ${reportDir}/setup_1.rpt
report_timing -path_type end_slack_only  -early               > ${reportDir}/hold_1.rpt
report_timing -late    -max_paths 100                         > ${reportDir}/setup_100.rpt.gz
report_timing -early   -max_paths 100                         > ${reportDir}/hold_100.rpt.gz
report_timing -retime path_slew_propagation -max_paths 50 -nworst 1 -path_type full_clock    > ${reportDir}/pba_50_paths.rpt
selectObject Net test_si1
deselectObject Net test_si1
selectObject Net test_si1
deselectObject Net test_si1
selectObject Net n1
deselectObject Net n1
selectObject Net n1
deselectObject Net n1
selectInst f32_data_reg_11_
deselectInst f32_data_reg_11_
selectInst f32_data_reg_11_
deselectInst f32_data_reg_11_
selectInst f32_data_reg_11_
deselectInst f32_data_reg_11_
selectInst f32_data_reg_11_
deselectInst f32_data_reg_11_
selectInst f32_data_reg_12_
deselectInst f32_data_reg_12_
selectInst f32_data_reg_12_
deselectInst f32_data_reg_12_
selectInst f32_data_reg_11_
deselectInst f32_data_reg_11_
selectObject Net scan_enable
deselectObject Net scan_enable
selectObject Net {i_wr_data[0]}
selectObject Net {i_wr_data[1]}
selectObject Net {i_wr_data[2]}
selectObject Net {i_wr_data[3]}
selectObject Net {i_wr_data[4]}
selectObject Net {i_wr_data[5]}
selectObject Net {i_wr_data[6]}
selectObject Net {i_wr_data[7]}
selectObject Net {i_wr_data[8]}
selectObject Net {i_wr_data[9]}
selectObject Net {i_wr_data[10]}
selectObject Net {i_wr_data[11]}
selectObject Net {i_wr_data[12]}
selectObject Net {i_wr_data[13]}
selectObject Net {i_wr_data[14]}
selectObject Net {i_wr_data[15]}
selectObject Net {i_wr_data[16]}
selectObject Net {i_wr_data[17]}
selectObject Net {i_wr_data[18]}
selectObject Net {i_wr_data[19]}
selectObject Net {i_wr_data[20]}
selectObject Net {i_wr_data[21]}
selectObject Net {i_wr_data[22]}
selectObject Net {i_wr_data[23]}
selectObject Net {i_wr_data[24]}
selectObject Net {i_wr_data[25]}
selectObject Net {i_wr_data[26]}
selectObject Net {i_wr_data[27]}
selectObject Net {i_wr_data[28]}
selectObject Net {i_wr_data[29]}
selectObject Net {i_wr_data[30]}
selectObject Net {i_wr_data[31]}
deselectObject Net {i_wr_data[0]}
deselectObject Net {i_wr_data[1]}
deselectObject Net {i_wr_data[2]}
deselectObject Net {i_wr_data[3]}
deselectObject Net {i_wr_data[4]}
deselectObject Net {i_wr_data[5]}
deselectObject Net {i_wr_data[6]}
deselectObject Net {i_wr_data[7]}
deselectObject Net {i_wr_data[8]}
deselectObject Net {i_wr_data[9]}
deselectObject Net {i_wr_data[10]}
deselectObject Net {i_wr_data[11]}
deselectObject Net {i_wr_data[12]}
deselectObject Net {i_wr_data[13]}
deselectObject Net {i_wr_data[14]}
deselectObject Net {i_wr_data[15]}
deselectObject Net {i_wr_data[16]}
deselectObject Net {i_wr_data[17]}
deselectObject Net {i_wr_data[18]}
deselectObject Net {i_wr_data[19]}
deselectObject Net {i_wr_data[20]}
deselectObject Net {i_wr_data[21]}
deselectObject Net {i_wr_data[22]}
deselectObject Net {i_wr_data[23]}
deselectObject Net {i_wr_data[24]}
deselectObject Net {i_wr_data[25]}
deselectObject Net {i_wr_data[26]}
deselectObject Net {i_wr_data[27]}
deselectObject Net {i_wr_data[28]}
deselectObject Net {i_wr_data[29]}
deselectObject Net {i_wr_data[30]}
deselectObject Net {i_wr_data[31]}
write_def
selectObject Net test_se
deselectObject Net test_se
selectObject Net test_se
ui::getColorByName chocolate
ui::getColorByName royalblue
deselectObject Net test_se
selectObject Net test_se
deselectObject Net test_se
selectObject Module u_survik
ui::getColorByName darkgreen
get_time_unit
report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all -late > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
get_time_unit
report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all -early > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
selectObject IO_Pin raw_scan_en
