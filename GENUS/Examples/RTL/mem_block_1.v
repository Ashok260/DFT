module sram_sp_32768d_33w_16m_8b (
    input CLK,
    input CEN,
    input GWEN,
    input [14:0] A,      // 32K depth requires 15-bit address
    input [32:0] D,      // 33-bit data
    input [32:0] WEN,    // 33-bit write enable
    output [32:0] Q      // 33-bit output
);

    wire [2:0] bank_sel = A[14:12]; // 4 banks: use 3 MSBs
    wire [12:0] local_addr = A[11:0]; // local 8K address

    wire cen_internal [3:0];
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_cen
            assign cen_internal[i] = (bank_sel == i) ? CEN : 1'b1;
        end
    endgenerate

    wire [32:0] q_internal[3:0];
    wire [6:0] q_7bit[3:0];
    wire [4:0] q_5bit[3:0];

    genvar b;
    generate
        for (b = 0; b < 4; b = b + 1) begin : gen_banks
            // Instantiate 4 x 7-bit SRAM wrappers
            memory_wrapper_8192_7 u_sram7_0 (
                .CEB(CLK),
                .OEB(1'b0),
                .CSB(cen_internal[b]),
                .WEB(~(GWEN & ~WEN[6:0])),
                .A(local_addr),
                .I(D[6:0]),
                .O(q_7bit[0])
            );
            memory_wrapper_8192_7 u_sram7_1 (
                .CEB(CLK),
                .OEB(1'b0),
                .CSB(cen_internal[b]),
                .WEB(~(GWEN & ~WEN[13:7])),
                .A(local_addr),
                .I(D[13:7]),
                .O(q_7bit[1])
            );
            memory_wrapper_8192_7 u_sram7_2 (
                .CEB(CLK),
                .OEB(1'b0),
                .CSB(cen_internal[b]),
                .WEB(~(GWEN & ~WEN[20:14])),
                .A(local_addr),
                .I(D[20:14]),
                .O(q_7bit[2])
            );
            memory_wrapper_8192_7 u_sram7_3 (
                .CEB(CLK),
                .OEB(1'b0),
                .CSB(cen_internal[b]),
                .WEB(~(GWEN & ~WEN[27:21])),
                .A(local_addr),
                .I(D[27:21]),
                .O(q_7bit[3])
            );

            // Instantiate 1 x 5-bit SRAM wrapper
            memory_wrapper_8192_5 u_sram5 (
                .CEB(CLK),
                .OEB(1'b0),
                .CSB(cen_internal[b]),
                .WEB(~(GWEN & ~WEN[32:28])),
                .A(local_addr),
                .I(D[32:28]),
                .O(q_5bit[b])
            );
        end
    endgenerate

    // Output muxing logic
    assign Q = (bank_sel == 0) ? {q_5bit[0], q_7bit[3], q_7bit[2], q_7bit[1], q_7bit[0]} :
               (bank_sel == 1) ? {q_5bit[1], q_7bit[3], q_7bit[2], q_7bit[1], q_7bit[0]} :
               (bank_sel == 2) ? {q_5bit[2], q_7bit[3], q_7bit[2], q_7bit[1], q_7bit[0]} :
                                 {q_5bit[3], q_7bit[3], q_7bit[2], q_7bit[1], q_7bit[0]};

endmodule

// Assuming you have the memory_wrapper module defined as in your previous example:

module memory_wrapper_8192_7 (
    input CEB,
    input OEB,
    input CSB,
    input WEB,
    input [12:0] A,
    input [6:0] I, // Matches the 7-bit word width of the SRAM
    output [6:0] O // Matches the 7-bit word width of the SRAM
);

    // Instantiate the SRAM macro from the library
    spram_8192_7 my_sram (
        .CEB(CEB),
        .OEB(OEB),
        .CSB(CSB),
        .WEB(WEB),
        .A(A),
        .I(I),
        .O(O)
    );

endmodule

module memory_wrapper_8192_5 (
    input CEB,
    input OEB,
    input CSB,
    input WEB,
    input [12:0] A,
    input [4:0] I, // Matches the 7-bit word width of the SRAM
    output [4:0] O // Matches the 7-bit word width of the SRAM
);

    // Instantiate the SRAM macro from the library
    spram_8192_7 my_sram (
        .CEB(CEB),
        .OEB(OEB),
        .CSB(CSB),
        .WEB(WEB),
        .A(A),
        .I(I),
        .O(O)
    );

endmodule


