module counter_16bit(clk,rst,Q);
input clk,rst;
output reg [15:0]Q;
always @(posedge clk or negedge rst)
begin
  if(~rst)
    Q<=15'd0;
 else
   Q<=Q+1'b1;
end
endmodule



