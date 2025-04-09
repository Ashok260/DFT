# Read netlist and constraints
read_verilog ../RTL/cpu_sys.v
read_lib "../LIBS/slow.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/rf_2p_136d_74w_1m_4b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/rf_2p_256d_76w_1m_4b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/rf_2p_512d_76w_2m_4b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/sram_sp_16384d_36w_16m_8b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/sram_sp_32768d_33w_16m_8b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/sram_sp_512d_32w_4m_2b.lib"
read_lib -lef ../LIBS/all.lef
set load_netlist_ignore_undefined_cell true
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
