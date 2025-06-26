module sram_sp_512d_32w_4m_2b(
    input         CLK,         // Clock signal connected to CEB
    input         CEN,         // Global Chip Enable (active low)
    input         GWEN,        // Global Write Enable
    input  [8:0]  A,           // 512-depth = 9-bit address
    input  [31:0] D,           // 32-bit data input
    input  [31:0] WEN,         // Bitwise write enable (active high)
    output [31:0] Q            // 32-bit data output
);

    wire [2:0] bank_sel = A[8:6];     // Selects one of 8 memory banks
    wire [5:0] local_addr = A[5:0];   // Address within each 64x32 block

    wire [31:0] q_bank[7:0];          // Outputs from each SRAM bank
    wire [7:0] cs_enable;             // Enables for CSB -> selecting memory instance

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : mem_banks
            assign cs_enable[i] = (~CEN & (bank_sel == i));

            memory_wrapper_64_32 u_sram (
                .CEB(CLK),                  // Clock connected directly to CEB
                .OEB(1'b0),                 // Output enable always on
                .CSB(~cs_enable[i]),        // CSB controls which bank is active
                .WEB(~(GWEN & ~|WEN)),      // Write enable (active low)
                .A(local_addr),
                .I(D),
                .O(q_bank[i])
            );
        end
    endgenerate

    // Output MUX from the selected active bank
    assign Q = (bank_sel == 3'd0) ? q_bank[0] :
               (bank_sel == 3'd1) ? q_bank[1] :
               (bank_sel == 3'd2) ? q_bank[2] :
               (bank_sel == 3'd3) ? q_bank[3] :
               (bank_sel == 3'd4) ? q_bank[4] :
               (bank_sel == 3'd5) ? q_bank[5] :
               (bank_sel == 3'd6) ? q_bank[6] :
               q_bank[7];

endmodule

module memory_wrapper_64_32 (
    input CEB,
    input OEB,
    input CSB,
    input WEB,
    input [5:0] A,
    input [31:0] I, // Matches the 7-bit word width of the SRAM
    output [31:0] O // Matches the 7-bit word width of the SRAM
);

    // Instantiate the SRAM macro from the library
    SPRAM_64x32 my_sram (
        .CE(CEB),
        .OEB(OEB),
        .CSB(CSB),
        .WEB(WEB),
        .A(A),
        .I(I),
        .O(O)
    );

endmodule

