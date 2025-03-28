module s_reset (reset_in, test_mode,  reset_out, clock);

input reset_in, clock, test_mode;

output reset_out;

reg reset_out;

always @(posedge clock) begin
  reset_out <= reset_in;
end

endmodule
