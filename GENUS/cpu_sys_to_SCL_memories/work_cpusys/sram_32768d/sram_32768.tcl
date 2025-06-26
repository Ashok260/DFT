
read_hdl ../../RTL/RTL/mem_block_1.v
read_lib {../../TECHFILES/slow.lib ../../TECHFILES/memories/spram_8192_7_min.lib ../../TECHFILES/memories/spram_8192_5_min.lib}
elaborate
set_top_module
syn_gen
syn_map
syn_opt
report_gates
write_hdl > sram_sp_32768d_33w_16m_8b.v
write_hdl
