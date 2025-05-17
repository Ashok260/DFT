# === [ TIMESTAMP ] ===
set DATE [clock format [clock seconds] -format "%b%d-%T"]

# === [ CONFIGURATION ] ===
set DESIGN_LIST {axi4lscope wbscopc wbscope}
set TECH_LIB ../inputs/LIB/NangateOpenCellLibrary_slow_conditional_ccs.lib
set BASE_RTL_DIR ../TestCases
  # Load libraries and RTL
  read_libs $TECH_LIB
# === [ LOOP THROUGH DESIGNS ] ===
foreach DESIGN_NAME $DESIGN_LIST {

  puts "\n\n==== Synthesizing: $DESIGN_NAME ====\n\n"

  set RTL_DIR ${BASE_RTL_DIR}/Testcase_A
  set OUT_DIR ./OUTPUT_${DESIGN_NAME}_${DATE}
  file mkdir $OUT_DIR

  #read_hdl [glob ${RTL_DIR}/*.v]
read_hdl ${RTL_DIR}/${DESIGN_NAME}.v
  elaborate

  # Don't use these flip-flops
  set_dont_use \
    SDFFRS_X1 SDFFRS_X2 \
    SDFFR_X1  SDFFR_X2 \
    SDFFS_X1  SDFFS_X2 \
    SDFF_X1   SDFF_X2

  # Run synthesis
  syn_generic
  syn_map
  syn_opt

  # Output final synthesized netlist
  write_hdl ${DESIGN_NAME} > ${OUT_DIR}/${DESIGN_NAME}_opt.v
  gui_show
  # Clean previous data
  reset_design ${DESIGN_NAME}

}

