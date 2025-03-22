set design              doppler
set clientCnt           2
set clientThreadCnt     1
set masterThreadCnt     8
set lsfQueue            ssv
set hostGroup           "\"\""
set maxMem              8000
set tmpDisk             1000
set minSlashTmpGigs     10

if {[info command distribute_partition] != "" } {
  puts "You are starting Tempus in DSTA mode"
}

##################################
# DSTA part 1 set threading and start clients
##################################
set_multi_cpu_usage -localCpu $masterThreadCnt -cpuPerRemoteHost $clientThreadCnt -remoteHost $clientCnt

#set_distribute_host -ssh -shellTimeout 60 -add [list esdevlnx2 rlsj-schritz] 
set_distribute_host -timeout 300 -lsf -queue lnx64 

dist_start_clients

read_lib ../../libs/MACRO/LIBERTY/pllclk.lib
read_lib ../../libs/MACRO/LIBERTY/rom_512x16A.lib
read_lib ../../libs/MACRO/LIBERTY/ram_256x16A.lib
read_lib ../../libs/liberty/FreePDK45_lib_v1.0_typical_scan.lib
read_lib ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib
read_lib ../../libs/liberty/FreePDK45_lib_v1.0_typical.lib

####
read_view_definition ../scripts_cmmmc/viewDefinition_8.tcl
####

read_verilog "../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" ; # 8269 instances
set_top_module dtmf_recvr_core -ignore_undefined_cell

################################
# Check how big the tescase is
################################
set cellCnt [sizeof_collection [get_cells -hier *]]
puts "Your design has: $cellCnt instances"

################################
# Read in the spef files
################################
read_spef -rc_corner corner_worst_RCMAX {../design/SPEF/corner_worst_RCMAX.spef.gz}
read_spef -rc_corner corner_worst_RCMIN {../design/SPEF/corner_worst_RCMIN.spef.gz}

##################################
# DSTA part 2 send the design to the clients
##################################
distribute_partition

################################
# Turn on SI analysis
################################
set_delay_cal_mode -engine aae -SIAware true -siMode signoff

################################
# Calculate the timing results
################################
update_timing -full

################################
# Create reports
################################
#check_design
check_design -type timing  -outfile check_design.rpt
report_constraint -all_violators                            > all_vio.rpt
report_analysis_coverage                                    > coverage.rpt
report_timing -path_type end_slack_only -max_slack 0        > setup_1.rpt
report_timing -path_type end_slack_only -max_slack 0 -early > hold_1.rpt
report_timing -late -max_slack 0 -max_paths 100             > setup_100.rpt.gz
report_timing -early -max_slack 0 -max_paths 100            > hold_100.rpt.gz

dist_print_client_usage
dist_print_usage

