
read_hdl ../../RTL/RTL/cpu_sys.v
read_lib {../../TECHFILES/slow.lib ../../TECHFILES/memories/spram_8192_7_min.lib ../../TECHFILES/memories/spram_8192_5_min.lib ../../TECHFILES/memories/SPRAM_8192x36_min_SP.lib ../../TECHFILES/memories/SPRAM_64x32_min.lib ../../TECHFILES/memories/DPRAM_512x24_min.lib ../../TECHFILES/memories/rd3_512x16_ss_1p62v_125c.lib ../../TECHFILES/memories/rd3_256x8_ss_1p62v_125c.lib}
elaborate
set_top_module
syn_gen
syn_map
syn_opt
report_gates
write_hdl > cpu_sys_scl.v
write_hdl
