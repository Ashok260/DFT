set TC TESTCASE_B
set BASE_RTL_DIR /home/01fe21bec223/ITC_2025/Round2/$TC
set LIBS_DIR /home/01fe21bec223/ITC_2025/inputs/LIB

find $BASE_RTL_DIR -name *.v > rtl_path.f
read_hdl -f rtl_path.f
read_lib $LIBS_DIR/NangateOpenCellLibrary_slow_conditional_ccs.lib

elaborate
set_top_module
set_dont_use *SDFF*
syn_generic
syn_map
syn_opt

# Get all designs (single or multiple)
set designs [get_design *]

# Loop over the design(s)
foreach_in_collection design $designs {
    set design_name [get_object_name $design]
    write_hdl $design_name > ${design_name}_net.v
}

