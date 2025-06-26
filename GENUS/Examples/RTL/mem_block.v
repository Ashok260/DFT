module memory_system_with_lib (
    input clk,
    input rst,
    input [2:0] mem_select, // Input to the 3:8 decoder for memory selection
    input we,             // Write enable
    input [3:0] addr,      // 4-bit address for each 16-word memory (2^4 = 16)
    input [15:0] din,       // 16-bit data input
    output reg [15:0] dout   // 16-bit data output
);
integer i;
    // 3:8 Decoder instantiation
    wire [7:0] mem_en;
    decoder_3to8 mem_selector (
        .in(mem_select),
        .out(mem_en)
    );

    // Internal wires to connect the outputs of the memory wrappers
    wire [32:0] dout_internal [7:0];

    // Instantiate 8 memory blocks using the memory_wrapper (assuming you've modified the .lib)
    memory_wrapper mem0 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[0]), // Chip enable for memory block 0
        .gwen(1'b1),      // Assuming global write enable is always active for simplicity
        .addr({6'b0, addr}), // Connect 4-bit addr to lower 4 bits of 10-bit addr
        .din({17'b0, din}),  // Connect 16-bit din to lower 16 bits of 33-bit din
        .wen({32'b0, we}),   // Connect 1-bit we to lower bit of 33-bit wen
        .dout(dout_internal[0])
    );

    memory_wrapper mem1 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[1]), // Chip enable for memory block 1
        .gwen(1'b1),
        .addr({6'b0, addr}),
        .din({17'b0, din}),
        .wen({32'b0, we}),
        .dout(dout_internal[1])
    );

    memory_wrapper mem2 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[2]), // Chip enable for memory block 2
        .gwen(1'b1),
        .addr({6'b0, addr}),
        .din({17'b0, din}),
        .wen({32'b0, we}),
        .dout(dout_internal[2])
    );

    memory_wrapper mem3 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[3]), // Chip enable for memory block 3
        .gwen(1'b1),
        .addr({6'b0, addr}),
        .din({17'b0, din}),
        .wen({32'b0, we}),
        .dout(dout_internal[3])
    );

    memory_wrapper mem4 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[4]), // Chip enable for memory block 4
        .gwen(1'b1),
        .addr({6'b0, addr}),
        .din({17'b0, din}),
        .wen({32'b0, we}),
        .dout(dout_internal[4])
    );

    memory_wrapper mem5 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[5]), // Chip enable for memory block 5
        .gwen(1'b1),
        .addr({6'b0, addr}),
        .din({17'b0, din}),
        .wen({32'b0, we}),
        .dout(dout_internal[5])
    );

    memory_wrapper mem6 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[6]), // Chip enable for memory block 6
        .gwen(1'b1),
        .addr({6'b0, addr}),
        .din({17'b0, din}),
        .wen({32'b0, we}),
        .dout(dout_internal[6])
    );

    memory_wrapper mem7 (
        .clk(clk),
        .rst(rst),
        .cen(mem_en[7]), // Chip enable for memory block 7
        .gwen(1'b1),
        .addr({6'b0, addr}),
        .din({17'b0, din}),
        .wen({32'b0, we}),
        .dout(dout_internal[7])
    );

    // Logic to select the output based on the memory enable signals
    always @(*) begin
        dout = 16'bz; // Default to high-impedance
        for (i = 0; i < 8; i = i + 1) begin
            if (mem_en[i]) begin
                dout = dout_internal[i][15:0]; // Select lower 16 bits of 33-bit output
            end
        end
    end

endmodule

// 3:8 Decoder Module
module decoder_3to8 (
    input [2:0] in,
    output reg [7:0] out
);

    always @(*) begin
        case (in)
            3'b000: out = 8'b00000001;
            3'b001: out = 8'b00000010;
            3'b010: out = 8'b00000100;
            3'b011: out = 8'b00001000;
            3'b100: out = 8'b00010000;
            3'b101: out = 8'b00100000;
            3'b110: out = 8'b01000000;
            3'b111: out = 8'b10000000;
            default: out = 8'b00000000; // Should not happen in normal operation
        endcase
    end

endmodule

// Assuming you have the memory_wrapper module defined as in your previous example:

module memory_wrapper (
    input clk,
    input rst,
    input cen,
    input gwen,
    input [9:0] addr,
    input [32:0] din, // Matches the 33-bit word width of the SRAM
    input [32:0] wen,       // Assuming WEN is a 33-bit wide write enable
    output [32:0] dout // Matches the 33-bit word width of the SRAM
);

    // Instantiate the SRAM macro from the library
    sram_sp_32768d_33w_16m_8b my_sram (
        .CLK(clk),
        .CEN(cen),
        .GWEN(gwen),
        .A(addr),
        .D(din),
        .WEN(wen),
        .Q(dout)
    );

endmodule
