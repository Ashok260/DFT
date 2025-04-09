# Set paths
set report_file "scanChain.rpt"
set output_file "scan_in_ports.txt"


set fout [open $output_file w]

# read through report
set fin [open $report_file r]
set current_chain ""
while {[gets $fin line] >= 0} {
    # match lines like: [1] scan info : chain1_sub0
    if {[regexp {^\[(\d+)\]\s+scan info\s+:\s+\S+} $line -> chain_idx]} {
        set current_chain $chain_idx
        continue
    }
    # match the START FF: START: storm_U2_reg_173/QN (...)
    if {$current_chain ne "" && [regexp {^\s*START:\s+(\S+)/\S+} $line -> ff_inst]} {
        # 1) get library cell name of that instance
        set cell_type [get_object_name [get_lib_cells -of_objects $ff_inst]]

        # 2) find what drives its SI pin during scan shift
        set si_pin   "${ff_inst}/SI"
        set drivers  [all_fanin -startpoints_only -to $si_pin]
        set source   [get_object_name [lindex $drivers 0]]

        # 3) write out: chain#  instance  cell_type  driver
        puts $fout "<$current_chain> <$ff_inst> <$cell_type> <$source>"

        # clear so we only do one START per chain
        set current_chain ""
    }
}
close $fin
close $fout
set fanouts [all_fanin -startpoints_only -to scan_out -only_cells]
foreach_in_collection x $fanouts {                                
 puts [get_object_name $x]
}

