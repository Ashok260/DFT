/*module counter (clk,rst,en,q);
parameter n=32;
input clk;
input rst;
input en;
output reg [n-1:0]q;
always @(posedge clk)
begin
	if(rst)
		q<=32'd0;
	else if(en)
	begin
		if(q==32'hffffffff)
			q<=32'd0;
		else
			q<=q+32'd1;
	end
	else
		q<=32'd0;
end
endmodule */
module random_counter_lfsr(input clk, rst_n,   
                 input[4:0] initialized_value,  
                 output[4:0] counter_random);  
 wire [4:0] counter_lfsr;  
 wire d_xor;  
  xor xor_u(d_xor,counter_lfsr[1],counter_lfsr[4]);  
 D_FF u0(.q(counter_lfsr[0]), .d(counter_lfsr[4]), .rst_n(rst_n), .clk(clk),.init_value(initialized_value[0]));  
 D_FF u1(.q(counter_lfsr[1]), .d(counter_lfsr[0]), .rst_n(rst_n), .clk(clk),.init_value(initialized_value[1]));  
 D_FF u2(.q(counter_lfsr[2]), .d(d_xor), .rst_n(rst_n), .clk(clk),.init_value(initialized_value[2]));  
 D_FF u3(.q(counter_lfsr[3]), .d(counter_lfsr[2]), .rst_n(rst_n), .clk(clk),.init_value(initialized_value[3]));  
 D_FF u4(.q(counter_lfsr[4]), .d(counter_lfsr[3]), .rst_n(rst_n), .clk(clk),.init_value(initialized_value[4])); 
 assign counter_random = counter_lfsr;  
 endmodule    
 // FPGA projects using Verilog/ VHDL
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog code for random counter using linear shift feedback register
// Verilog code for D_FF using in random counter
 module D_FF (q, d, rst_n, clk,init_value);  
 output q;  
 input d, rst_n, clk,init_value;  
 reg q; 
 always @(posedge clk or negedge rst_n)  
 if (~rst_n)  
 q <= init_value;    
 else  
 q <= d; 
 endmodule 


