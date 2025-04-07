set fp [open "fanouts.txt" "w"]
# (i) Get all input ports except the clock
set all_inputs [all_inputs]
set non_clock_inputs [remove_from_collection $all_inputs [get_ports clk]]

# (ii) Loop over all non-clock input ports and get fanout endpoints
set si_input_ports {}

foreach_in_collection port $non_clock_inputs {
    set endpoints [all_fanout -from $port -endpoints_only]
    foreach_in_collection endpoint $endpoints {
        set endpoint_name [get_attribute $endpoint full_name]
        puts $fp "$endpoint_name"
        if {[regexp {.*\/SI$} $endpoint_name]} {
            lappend si_input_ports [get_attribute $port full_name]
            break
        }
    }
}

# (iii) List all input ports connected to SI pins
set si_input_ports [lsort -unique $si_input_ports]

puts "Input ports with timing paths ending at SI pins:"
foreach port $si_input_ports {
    puts $port
}


