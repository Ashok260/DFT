module rf_2p_256d_76w_1m_4b (
    input         CLKA,
    input         CENA,
    input  [7:0]  AA,
    input         CLKB,
    input         CENB,
    input  [7:0]  AB,
    input  [75:0] DB,
    output [75:0] QA
);

    wire [7:0]  qa8_0, qa8_1, qa8_2, qa8_3, qa8_4, qa8_5, qa8_6, qa8_7,qa8_8,qa8_9;
    wire [79:0] full_QA;
    wire [7:0] unused_o2_8_0, unused_o2_8_1, unused_o2_8_2, unused_o2_8_3, 
               unused_o2_8_4, unused_o2_8_5, unused_o2_8_6, unused_o2_8_7,unused_o2_8_8,unused_o2_8_9;

    // Instantiate 8 rf_256x8     blocks
    rf_256x8     u_rd3_0 (
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
        .I1   (8'b0),
        .I2   (DB[7:0]),
        .O1   (qa8_0),
        .O2   (unused_o2_8_0)
    );

    rf_256x8     u_rd3_1 (
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
        .I1   (8'b0),
        .I2   (DB[15:8]),
        .O1   (qa8_1),
        .O2   (unused_o2_8_1)
    );

    rf_256x8     u_rd3_2 (
        .A1   (AA),
        .A2   (AB),
        .CE1  (CLKA ),
        .CE2  (CLKB),
        .WEB1 (1'b1),
        .WEB2 (1'b0),
        .OEB1 (1'b0),
        .OEB2 (1'b1),
        .CSB1 (CENA),
        .CSB2 (CENB),
        .I1   (8'b0),
        .I2   (DB[23:16]),
        .O1   (qa8_2),
        .O2   (unused_o2_8_2)
    );

    rf_256x8     u_rd3_3 (
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
        .I1   (8'b0),
        .I2   (DB[31:24]),
        .O1   (qa8_3),
        .O2   (unused_o2_8_3)
    );

    rf_256x8     u_rd3_4 (
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
        .I1   (8'b0),
        .I2   (DB[39:32]),
        .O1   (qa8_4),
        .O2   (unused_o2_8_4)
    );

    rf_256x8     u_rd3_5 (
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
        .I1   (8'b0),
        .I2   (DB[47:40]),
        .O1   (qa8_5),
        .O2   (unused_o2_8_5)
    );

    rf_256x8     u_rd3_6 (
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
        .I1   (8'b0),
        .I2   (DB[55:48]),
        .O1   (qa8_6),
        .O2   (unused_o2_8_6)
    );

    rf_256x8     u_rd3_7 (
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
        .I1   (8'b0),
        .I2   (DB[63:56]),
        .O1   (qa8_7),
        .O2   (unused_o2_8_7)
    );

    rf_256x8     u_rd3_8 (
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
        .I1   (8'b0),
        .I2   (DB[71:64]),
        .O1   (qa8_8),
        .O2   (unused_o2_8_8)
    );
    rf_256x8     u_rd3_9 (
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
        .I1   (8'b0),
        .I2   ({4'b0,DB[75:72]}),
        .O1   (qa8_9),
        .O2   (unused_o2_8_9)
    );

    // Combine outputs into full_QA, grounding MSB 4 bits
    assign full_QA = {qa8_9,qa8_8,qa8_7, qa8_6, qa8_5, qa8_4, qa8_3, qa8_2, qa8_1, qa8_0};

    // Final 76-bit output
    assign QA = full_QA[75:0];

endmodule

module rf_256x8     (
    input         A1, A2,          // Address inputs
    input         CE1, CE2,        // Clock enables
    input         WEB1, WEB2,      // Write enables
    input         OEB1, OEB2,      // Output enables
    input         CSB1, CSB2,      // Chip selects
    input  [7:0]  I1, I2,          // 8-bit data inputs
    output [7:0]  O1, O2           // 8-bit data outputs
);

    // Instantiate a 256x8 memory block using a DPRAM or SRAM structure
    rd3_256x8 u_dpram_256x8 (
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
