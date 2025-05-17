set output [all_outputs]
set scan_outs [list]
foreach_in_collection src $output {

    set src_name [get_object_name $src]
    #puts $src_name

    # get only the endpoint pins of the flat fanout cone
    set f_pins [all_fanin -to $src -flat  ]

    foreach_in_collection ep_pin $f_pins {
        # get the pin name (port name)
        set pname [get_pins  [get_object_name $ep_pin]]
        # puts [get_object_name $pname]
        foreach_in_collection pin $pname {
            set pin_name [get_object_name $pin]
            set parts [split $pin_name "/"]
            if {[lindex $parts 1] eq "Q"} {
                puts "Source: $src_name"
                puts "Dest: $pin_name"
                lappend scan_outs $src_name
                puts "---------"
            }
        }
    }
    
}