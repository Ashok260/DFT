Puts "Sourcing a few TCL constraints dtmf_recvr_core.scan"
create_clock [get_ports {refclk}]  -add  -name refclk -period 40 -waveform {0 20}
set_propagated_clock  [get_clocks {*}]
Puts "Done sourcing a few TCL constraints dtmf_recvr_core.scan"

