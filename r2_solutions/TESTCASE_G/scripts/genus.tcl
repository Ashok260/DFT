set TC TESTCASE_G
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

foreach_in_collection design [get_designs *] {
    set full_name [get_object_name $design]
    # Trim down to the module name only (strip hierarchy or long IP config)
    set design_name [file tail $full_name]
    
    # You can also further shorten if needed
    if {[string length $design_name] > 60} {
        set design_name [string range $design_name 0 59]
    }

    write_hdl $full_name > ${design_name}_net.v
}
