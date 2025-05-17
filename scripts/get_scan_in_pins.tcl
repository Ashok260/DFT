set input [all_inputs]

foreach_in_collection src $input {
    set src_name [get_object_name $src]
    

    # get only the endpoint pins of the flat fanout cone
    set f_pins [all_fanout -from $src -flat -endpoints_only ]

    foreach_in_collection ep_pin $f_pins {
        # get the pin name (port name)
        set pname [get_pins  [get_object_name $ep_pin]]
        # puts [get_object_name $pname]
        foreach_in_collection pin $pname {
            set pin_name [get_object_name $pin]
            set parts [split $pin_name "/"]
            if {[lindex $parts 1] eq "SI"} {
                puts "Source: $src_name"
                puts "Dest: $pin_name"
                puts "---------"
            }
        }
    }
    
}