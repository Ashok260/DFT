##### View definition file does not have LEFs.
read_lib -lef { \
../../libs/lef/FreePDK45_lib_v1.0.lef  \
../../libs/MACRO/LEF/pllclk.lef \
../../libs/MACRO/LEF/ram_256X16A.lef \
../../libs/MACRO/LEF/rom_512x16A.lef}

read_view_definition ../scripts/viewDefinition.tcl

read_verilog "../../design/dtmf_recvr_core.v.gz"

set_top_module dtmf_recvr_core -ignore_undefined_cell
read_def "../../design/full.def"
