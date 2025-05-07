read_hdl ../../RTL/RTL/rf_2p_136d_74w_1m_4b.v
read_lib {../../TECHFILES/slow.lib ../../TECHFILES/memories/rd3_256x8_ss_1p62v_125c.lib}
elaborate
set_top_module
syn_gen
syn_map
syn_opt
report_gates
write_hdl > rf_2p_136d_74w_1m_4b.v
write_hdl
