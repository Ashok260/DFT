module rf_2p_512d_76w_2m_4b (
    input         CLKA,
    input         CENA,
    input  [8:0]  AA,
    input         CLKB,
    input         CENB,
    input  [8:0]  AB,
    input  [75:0] DB,
    output [75:0] QA
);

    wire [23:0] qa24_0, qa24_1;
    wire [15:0] qa16_0, qa16_1;

    wire [79:0] full_QA;

wire [23:0] unused_o2_24_0, unused_o2_24_1;
wire [15:0] unused_o2_16_0, unused_o2_16_1;

    // 2 x 24-bit SRAMs
    rf_512x24 u_sram24_0 (
        .A1   (AA),
        .A2   (AB),
        .CE1  (CLKA),
        .CE2  (CLKB),
        .WEB1 (1'b1),
        .WEB2 (1'b0),
        .OEB1 (1'b0),
        .OEB2 (1'b1),
        .CSB1 (CENA),
        .CSB2 (CENB),
        .I1   (24'b0),
        .I2   (DB[23:0]),
        .O1   (qa24_0),
        .O2   (unused_o2_24_0)
    );

    rf_512x24 u_sram24_1 (
        .A1   (AA),
        .A2   (AB),
        .CE1  (CLKA),
        .CE2  (CLKB),
        .WEB1 (1'b1),
        .WEB2 (1'b0),
        .OEB1 (1'b0),
        .OEB2 (1'b1),
        .CSB1 (CENA),
        .CSB2 (CENB),
        .I1   (24'b0),
        .I2   (DB[47:24]),
        .O1   (qa24_1),
        .O2   (unused_o2_24_1)
    );

    // 2 x 16-bit SRAMs
    rf_512x16 u_sram16_0 (
        .A1   (AA),
        .A2   (AB),
        .CE1  (CLKA),
        .CE2  (CLKB),
        .WEB1 (1'b1),
        .WEB2 (1'b0),
        .OEB1 (1'b0),
        .OEB2 (1'b1),
        .CSB1 (CENA),
        .CSB2 (CENB),
        .I1   (16'b0),
        .I2   (DB[63:48]),
        .O1   (qa16_0),
        .O2   (unused_o2_16_0)
    );

    rf_512x16 u_sram16_1 (
        .A1   (AA),
        .A2   (AB),
        .CE1  (CLKA),
        .CE2  (CLKB),
        .WEB1 (1'b1),
        .WEB2 (1'b0),
        .OEB1 (1'b0),
        .OEB2 (1'b1),
        .CSB1 (CENA),
        .CSB2 (CENB),
        .I1   (16'b0),
        .I2   ({4'b0,DB[75:64]}),
        .O1   (qa16_1),
        .O2   (unused_o2_16_1)
    );

    // Combine outputs: MSB 4 bits are grounded
    assign full_QA = {qa16_1, qa16_0, qa24_1, qa24_0};

    // Final 76-bit output
    assign QA = full_QA[75:0];

endmodule
module rf_512x24 (
    input  [8:0]  A1, A2,        // 512-depth = 9-bit address
    input         CE1, CE2,      // Clock / chip enable (high active)
    input         WEB1, WEB2,    // Write enable (active LOW)
    input         OEB1, OEB2,    // Output enable (active LOW)
    input         CSB1, CSB2,    // Chip select (active LOW)
    input  [23:0] I1, I2,        // 24-bit data input
    output [23:0] O1, O2         // 24-bit data output
);
DPRAM_512x24 u_dpram_512x24 (
    .A1   (A1),
    .A2   (A2),
    .CE1  (CE1),
    .CE2  (CE2),
    .WEB1 (WEB1),
    .WEB2 (WEB2),
    .OEB1 (OEB1),
    .OEB2 (OEB2),
    .CSB1 (CSB1),
    .CSB2 (CSB2),
    .I1   (I1),
    .I2   (I2),
    .O1   (O1),
    .O2   (O2)
);
endmodule
module rf_512x16 (
    input  [8:0]  A1, A2,        // 512-depth = 9-bit address
    input         CE1, CE2,      // Clock / chip enable (high active)
    input         WEB1, WEB2,    // Write enable (active LOW)
    input         OEB1, OEB2,    // Output enable (active LOW)
    input         CSB1, CSB2,    // Chip select (active LOW)
    input  [15:0] I1, I2,        // 16-bit data input
    output [15:0] O1, O2         // 16-bit data output
);
rd3_512x16 u_dpram_512x16 (
    .A1   (A1),
    .A2   (A2),
    .CE1  (CE1),
    .CE2  (CE2),
    .WEB1 (WEB1),
    .WEB2 (WEB2),
    .OEB1 (OEB1),
    .OEB2 (OEB2),
    .CSB1 (CSB1),
    .CSB2 (CSB2),
    .I1   (I1),
    .I2   (I2),
    .O1   (O1),
    .O2   (O2)
);
endmodule
