# Read netlist and constraints
read_verilog ../RTL/cpu_sys.v
read_lib "/jk/Genus/Genus_CUI_RAK/LIB/CDK_R512x16.lib"
read_lib -lef ../LIBS/all.lef
set_top_module
read_sdc ../SDC/cpu_sys.sdc
# Open report file
set report_file [open "cpu_sys_analysis_report.txt" "w"]

# -------------------------
# (i) Instance count of memories
# -------------------------
set mem_cells [get_cells -hierarchical -filter "is_memory"]
set mem_count [llength $mem_cells]
puts $report_file "============================================"
puts $report_file "(i) Instance Count of Memories"
puts $report_file "============================================"
puts $report_file "Memory instance count: $mem_count\n"

# -------------------------
# (ii) List of memory configurations (types)
# -------------------------
set mem_types {}
foreach mem $mem_cells {
    lappend mem_types [get_attribute $mem ref_name]
}
set unique_mem_types [lsort -unique $mem_types]

puts $report_file "============================================"
puts $report_file "(ii) Unique Memory Configurations"
puts $report_file "============================================"
foreach type $unique_mem_types {
    puts $report_file $type
}
puts $report_file ""

# -------------------------
# (iii) Count of Flip-Flops
# -------------------------
set ff_cells [get_cells -hierarchical -filter "is_sequential"]
set ff_count [llength $ff_cells]

puts $report_file "============================================"
puts $report_file "(iii) Flip-Flop Count"
puts $report_file "============================================"
puts $report_file "Flip-flop count: $ff_count\n"

# -------------------------
# (iv) Total number of instances
# -------------------------
set all_instances [get_cells -hierarchical]
set total_instance_count [llength $all_instances]

puts $report_file "============================================"
puts $report_file "(iv) Total Instance Count"
puts $report_file "============================================"
puts $report_file "Total number of instances: $total_instance_count\n"

# -------------------------
# (v) Clock list and sourc# Read netlist and constraints

# Open report file
set report_file [open "cpu_sys_analysis_report.txt" "w"]

# -------------------------
# (i) Instance count of memories
# -------------------------
set mem_cells [get_cells -hierarchical -filter "is_memory"]
set mem_count [llength $mem_cells]
puts $report_file "============================================"
puts $report_file "(i) Instance Count of Memories"
puts $report_file "============================================"
puts $report_file "Memory instance count: $mem_count\n"

# -------------------------
# (ii) List of memory configurations (types)
# -------------------------
set mem_types {}
foreach mem $mem_cells {
    lappend mem_types [get_attribute $mem ref_name]
}
set unique_mem_types [lsort -unique $mem_types]

puts $report_file "============================================"
puts $report_file "(ii) Unique Memory Configurations"
puts $report_file "============================================"
foreach type $unique_mem_types {
    puts $report_file $type
}
puts $report_file ""

# -------------------------
# (iii) Count of Flip-Flops
# -------------------------
set ff_cells [get_cells -hierarchical -filter "is_sequential"]
set ff_count [llength $ff_cells]

puts $report_file "============================================"
puts $report_file "(iii) Flip-Flop Count"
puts $report_file "============================================"
puts $report_file "Flip-flop count: $ff_count\n"

# -------------------------
# (iv) Total number of instances
# -------------------------
set all_instances [get_cells -hierarchical]
set total_instance_count [llength $all_instances]

puts $report_file "============================================"
puts $report_file "(iv) Total Instance Count"
puts $report_file "============================================"
puts $report_file "Total number of instances: $total_instance_count\n"

# -------------------------
# (v) Clock list and sources
# -------------------------
set clocks [all_clocks]

puts $report_file "============================================"
puts $report_file "(v) Clock List and Their Sources"
puts $report_file "============================================"
foreach clk $clocks {
    set clk_name [get_object_name $clk]
    set clk_sources [get_attribute $clk sources]
    puts $report_file "$clk_name -> $clk_sources"
}

# Close report file
close $report_file
puts "Report generated: cpu_sys_analysis_report.txt"es
# -------------------------
set clocks [all_clocks]

puts $report_file "============================================"
puts $report_file "(v) Clock List and Their Sources"
puts $report_file "============================================"
foreach clk $clocks {
    set clk_name [get_object_name $clk]
    set clk_sources [get_attribute $clk sources]
    puts $report_file "$clk_name -> $clk_sources"
}

# Close report file
close $report_file
puts "Report generated: cpu_sys_analysis_report.txt"
