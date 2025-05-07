read_hdl ../../RTL/RTL/mem_block_512_32.v
read_lib {../../TECHFILES/slow.lib ../../TECHFILES/memories/SPRAM_64x32_min.lib}
elaborate
set_top_module
syn_gen
syn_map
syn_opt
report_gates
write_hdl > sram_sp_512d_32w_4m_2b.v
write_hdl
