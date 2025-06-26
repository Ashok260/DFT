##############################################################################
## Preset global variables and attributes
##############################################################################

set DESIGN CLOCK
set DATE [clock format [clock seconds] -format "%b%d-%T"]
set _OUTPUTS_PATH outputs_${DATE}
set _REPORTS_PATH reports_${DATE}
set _LOG_PATH logs_${DATE}

set_db / .init_lib_search_path {. ../TECHFILES}
set_db / .init_hdl_search_path {. ../RTL}
set_db / .information_level 7

###############################################################
## Library setup
###############################################################

read_libs ../TECHFILES/NangateOpenCellLibrary_slow_conditional_ccs.lib
read_physical -lef NangateOpenCellLibrary.lef

####################################################################
## Load Design
####################################################################

read_hdl ../RTL/timer.v
elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration

check_design -unresolved

####################################################################
## Constraints Setup
####################################################################

create_clock -name clk -period 5 [get_ports clk]

if {![file exists ${_LOG_PATH}]} {
    file mkdir ${_LOG_PATH}
    puts "Creating directory ${_LOG_PATH}"
}

if {![file exists ${_OUTPUTS_PATH}]} {
    file mkdir ${_OUTPUTS_PATH}
    puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
    file mkdir ${_REPORTS_PATH}
    puts "Creating directory ${_REPORTS_PATH}"
}

##################################################################################################
## DFT Setup
##################################################################################################

set_db / .dft_scan_style muxed_scan
set_db / .dft_prefix DFT_
set_db / .dft_identify_top_level_test_clocks true
set_db / .dft_identify_test_signals true
set_db / .dft_identify_internal_test_clocks false
set_db / .use_scan_seqs_for_non_dft false
set_db "design:$DESIGN" .dft_scan_map_mode tdrc_pass
set_db "design:$DESIGN" .dft_connect_shift_enable_during_mapping tie_off
set_db "design:$DESIGN" .dft_connect_scan_data_pins_during_mapping loopback
set_db "design:$DESIGN" .dft_scan_output_preference auto
set_db "design:$DESIGN" .dft_lockup_element_type preferred_level_sensitive
set_db "design:$DESIGN" .dft_mix_clock_edges_in_scan_chains true

## Scan Infrastructure Definition
define_test_clock -name scanclk -period 18000 [get_ports clk]
define_shift_enable -name se -active high scan_en -create_port
define_test_mode -name tm -active high test_mode -create_port

define_scan_chain -name top_chain -sdi scan_in -sdo scan_out -shift_enable se -create_ports

## Run the DFT rule checks
check_dft_rules > $_REPORTS_PATH/${DESIGN}-tdrcs
report_scan_registers > $_REPORTS_PATH/${DESIGN}-DFTregs
report_scan_setup > $_REPORTS_PATH/${DESIGN}-DFTsetup_tdrc

####################################################################################################
## Synthesizing to gates
####################################################################################################

set_db / .syn_map_effort high
syn_generic
syn_map
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED
write_snapshot -outdir $_REPORTS_PATH -tag map
report_summary -directory $_REPORTS_PATH

foreach cg [vfind / -cost_group *] {
    report_timing -group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_map.rpt
}

#######################################################################################################
## Optimize Netlist
#######################################################################################################
set_db / .syn_opt_effort high
syn_opt
write_snapshot -outdir $_REPORTS_PATH -tag syn_opt
report_summary -directory $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

foreach cg [vfind / -cost_group *] {
    report_timing -group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_opt.rpt
}

######################################################################################################
## Optional additional DFT commands. (section 2)
######################################################################################################

## Re-run DFT rule checks
check_dft_rules -advanced
## Build the full scan chanins
connect_scan_chains -auto_create_chains
report_scan_chains > $_REPORTS_PATH/${DESIGN}-DFTchains

#######################################################################################################
## Optimize Netlist
#######################################################################################################

set_db / .syn_opt_effort low
syn_opt -incremental
write_snapshot -outdir $_REPORTS_PATH -tag syn_opt_low_incr
report_summary -directory $_REPORTS_PATH
puts "Runtime & Memory after 'syn_opt'"
time_info INCREMENTAL_POST_SCAN_CHAINS

#############################################
## DFT Reports
#############################################

report_scan_setup > $_REPORTS_PATH/${DESIGN}-DFTsetup_final
write_scandef > ${_OUTPUTS_PATH}/${DESIGN}-scanDEF
write_dft_abstract_model > ${_OUTPUTS_PATH}/${DESIGN}-scanAbstract
write_hdl -abstract > ${_OUTPUTS_PATH}/${DESIGN}-logicAbstract
write_script -analyze_all_scan_chains > ${_OUTPUTS_PATH}/${DESIGN}-writeScript-analyzeAllScanChains

######################################################################################################
## write backend file set (verilog, SDC, config, etc.)
######################################################################################################

report_dp > $_REPORTS_PATH/${DESIGN}_datapath_incr.rpt
report_messages > $_REPORTS_PATH/${DESIGN}_messages.rpt
write_snapshot -outdir $_REPORTS_PATH -tag final
report_summary -directory $_REPORTS_PATH
write_hdl > ${_OUTPUTS_PATH}/${DESIGN}_scan.v
write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_scan.sdc

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Scan Insertion Finished ....."
puts "============================"

file copy [get_db / .stdout_log] ${_LOG_PATH}/.

##quit
