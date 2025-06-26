module sram_sp_16384d_36w_16m_8b (
    input         CLK,
    input         CEN,         // Active low
    input         GWEN,        // Global write enable
    input  [13:0] A,           // 16K depth = 14-bit address
    input  [35:0] D,           // 36-bit input data
    input  [35:0] WEN,         // 36-bit write enables (active high per bit)
    output [35:0] Q            // 36-bit output
);

    wire [12:0] local_addr = A[12:0]; // Lower 13 bits
    wire sel = A[13];                 // MSB for bank selection

    wire ceb0 = ~(~CEN & (sel == 1'b0));
    wire ceb1 = ~(~CEN & (sel == 1'b1));

    wire csb0 = ceb0; // Can be same as CEB if chip select not used differently
    wire csb1 = ceb1;

    wire web0 = ~(GWEN & ~|WEN); // Write enable logic
    wire web1 = ~(GWEN & ~|WEN);

    wire [35:0] q0, q1;

    memory_wrapper_8192_36 u_bank0 (
        .CEB(CLK),
        .OEB(1'b0),
        .CSB(csb0),
        .WEB(web0),
        .A(local_addr),
        .I(D),
        .O(q0)
    );

    memory_wrapper_8192_36 u_bank1 (
        .CEB(CLK),
        .OEB(1'b0),
        .CSB(csb1),
        .WEB(web1),
        .A(local_addr),
        .I(D),
        .O(q1)
    );

    // Select output based on MSB of address
    assign Q = (sel == 1'b0) ? q0 : q1;

endmodule


module memory_wrapper_8192_36 (
    input CEB,
    input OEB,
    input CSB,
    input WEB,
    input [12:0] A,
    input [35:0] I, // Matches the 7-bit word width of the SRAM
    output [35:0] O // Matches the 7-bit word width of the SRAM
);

    // Instantiate the SRAM macro from the library
    SPRAM_8192x36 my_sram (
        .CE(CEB),
        .OEB(OEB),
        .CSB(CSB),
        .WEB(WEB),
        .A(A),
        .I(I),
        .O(O)
    );

endmodule
//SPRAM_8192x36(A,CE,WEB, OEB, CSB,      I,O)

