set DESIGN riscv_core
set LIB_PATH {../LIBS}
set RTL_PATH {../RTL}
set OUT_PATH {../OUTPUTS}
find $RTL_PATH -name *.v > rtl_path.f
read_hdl -f rtl_path.f
read_lib $LIB_PATH/NangateOpenCellLibrary_slow_conditional_ccs.lib
read_physical -lef $LIB_PATH/NangateOpenCellLibrary.lef
elaborate $DESIGN
set_dont_use *SDFF*
syn_generic
syn_map
syn_opt
report_gates > $OUT_PATH/gates.rep
write_hdl > $OUT_PATH/riscv_core_net.v
