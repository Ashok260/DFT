
#load design netlist
read_hdl ../RTL/cpu_sys.v

#Load Target Library First and then link library
set_attribute target_library "../LIBS/nangate.lib ../LIBS/memories/rf_2p_136d_74w_1m_4b.lib ../LIBS/memories/rf_2p_256d_76w_1m_4b.lib ../LIBS/memories/rf_2p_512d_76w_2m_4b.lib ../LIBS/memories/sram_sp_16384d_36w_16m_8b.lib ../LIBS/memories/sram_sp_32768d_33w_16m_8b.lib ../LIBS/memories/sram_sp_512d_32w_4m_2b.lib"
#load link library
set_attribute link_library "../LIBS/slow.lib ../LIBS/memories/rf_2p_136d_74w_1m_4b.lib ../LIBS/memories/rf_2p_256d_76w_1m_4b.lib ../LIBS/memories/rf_2p_512d_76w_2m_4b.lib ../LIBS/memories/sram_sp_16384d_36w_16m_8b.lib ../LIBS/memories/sram_sp_32768d_33w_16m_8b.lib ../LIBS/memories/sram_sp_512d_32w_4m_2b.lib"

#elaborate the design
elaborate

#check for unresolved references
check_design -unresolved

#Synthesizing to generic cells
syn_gen

#mapping cells to target library
syn_map

#optimice the design
syn_opt

#check the library of the gates
report_gates

#write out the netlist
write_hdl > mcrb_tglib_net.v
