#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Tue Apr  8 15:35:40 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_verilog ../RTL/cpu_sys.v
read_lib {../LIBS/slow.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/rf_2p_136d_74w_1m_4b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/rf_2p_256d_76w_1m_4b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/rf_2p_512d_76w_2m_4b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/sram_sp_16384d_36w_16m_8b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/sram_sp_32768d_33w_16m_8b.lib ../dummyNL4KLE_tech-20250115T065802Z-001/dummyNL4KLE_tech/memories/sram_sp_512d_32w_4m_2b.lib}
read_lib -lef ../LIBS/all.lef
set_top_module
read_sdc ../SDC/cpu_sys.sdc
report_instance_library
report_instance_library > library_inst.txt
report_instance_library > cell_type.txt
