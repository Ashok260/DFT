read_spef -rc_corner corner_worst_RCMAX ../../design/SPEF/corner_worst_RCMAX.spef.gz
read_spef -rc_corner corner_worst_RCMIN ../../design/SPEF/corner_worst_RCMIN.spef.gz

################################
# Setup threading
################################
set_multi_cpu_usage -localCpu 2   ;# Not using multiple machines

################################
# Setup some global timer variables
################################
set_delay_cal_mode -SIAware true                 ;# Turn on SI analysis
set_si_mode -enable_glitch_report 1                               ;# Turn on glitch analysis
set_si_mode -enable_glitch_propagation 1                               ;# Turn on glitch propagation
set_global timing_write_sdf_allow_negative_setuphold_sum true   ;# Enable SDF to have negative delays

################################
# Select report formatting
################################
set report_precision 3
set_table_style -name report_timing -max_widths {70}
set_global report_timing_format {hpin edge cell slew load delay incr_delay arrival required}

################################
# set timing derates here if you have them
################################
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -late  1.1
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -late  1.1

update_timing -full
report_constraint -all_violators  > rep.vio.gz
report_analysis_coverage > rep.coverage
report_timing -path_type end_slack_only > setup.rpt
report_timing -path_type end_slack_only -early > hold.rpt
#report_analysis_summary > ras.rpt
#report_analysis_summary -merged_groups -merged_views > ras_merge.rpt

# Merge these reports later in the main script
report_timing  -max_path 10 -max_slack 10 > setup_maxpath.rpt
report_timing  -nworst 1                  > setup_nworst.rpt
report_timing  -max_path 10 -max_slack 10 > hold_maxpath.rpt
report_timing  -nworst 1                  > hold_nworst.rpt
report_timing -machine_readable -max_path 10 -max_slack 10 > setup_maxpath_machine.rpt
report_timing -machine_readable -nworst 1                  > setup_nworst_machine.rpt
report_timing -machine_readable -max_path 10 -max_slack 10 > hold_maxpath_machine.rpt
report_timing -machine_readable -nworst 1                  > hold_nworst_machine.rpt
#save_design -noTimingGraph test.enc
