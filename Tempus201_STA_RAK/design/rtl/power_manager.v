module counter (count, start, clk, reset);
   input clk, reset, start;
   output [7:0] count;
   reg [7:0] count_N;
   reg [7:0] count;

   always @ (posedge clk or posedge reset)
      begin: counter_S
         if (reset) count = 0;
         else begin
	   count = count_N;
         end
      end
   always @ (count or start)
      begin: counter_C
         if (start) count_N = count + 1;
	 else count_N = 0;
      end
endmodule

module state (start, power_control, clk, reset, count);
   input clk, reset;
   input [7:0] count;
   output start;
   output [3:0] power_control;

   reg [2:0] fsm_N;
   reg [2:0] fsm;
   reg [3:0] power_control;
   reg start;

   parameter [3:0] pc_1 = 4'b0000,
   		   pc_2 = 4'b0001,
   		   pc_3 = 4'b0011,
   		   pc_4 = 4'b0111,
   		   pc_5 = 4'b1111,
   		   pc_6 = 4'b0111,
   		   pc_7 = 4'b0011,
   		   pc_8 = 4'b0001;
   parameter [2:0] s1 = 3'b000, 
		   s2 = 3'b001,
		   s3 = 3'b011,
		   s4 = 3'b010,
		   s5 = 3'b110,
		   s6 = 3'b111,
		   s7 = 3'b101,
		   s8 = 3'b100;

   always @ (posedge clk or posedge reset)
      begin: fsm_S
         if (reset) begin
            fsm = s1;
         end
         else fsm = fsm_N;
      end

   always @ (count or fsm)
      begin: fsm_C
         fsm_N = fsm;
         start = 1;
         case (fsm)
            s1: begin
               if (count == 200) begin
                  start = 0;
                  fsm_N = s2;
               end
            end

            s2: begin
               if (count == 150) begin
                  start = 0;
                  fsm_N = s3;
               end
            end

            s3: begin
               if (count == 100) begin
                  start = 0;
                  fsm_N = s4;
               end
            end

            s4: begin
               if (count == 150) begin
                  start = 0;
                  fsm_N = s5;
               end
            end

            s5: begin
               if (count == 200) begin
                  start = 0;
                  fsm_N = s6;
               end
            end

            s6: begin
               if (count == 150) begin
                  start = 0;
                  fsm_N = s7;
               end
            end

            s7: begin
               if (count == 100) begin
                  start = 0;
                  fsm_N = s8;
               end
            end

            s8: begin
               if (count == 150) begin
                  start = 0;
                  fsm_N = s1;
               end
            end

            default: begin
               fsm_N = s1;
            end
         endcase
      end
   always @ (fsm)
      begin: out_value
         case (fsm)
	    s1: power_control = pc_1;
	    s2: power_control = pc_2;
	    s3: power_control = pc_3;
	    s4: power_control = pc_4;
	    s5: power_control = pc_5;
	    s6: power_control = pc_6;
	    s7: power_control = pc_7;
	    s8: power_control = pc_8;
	    default: power_control = pc_1;
         endcase 
      end

endmodule

module power_manager (clk, p_reset, power_switch_enable, isolation_enable, state_retention_enable);
   output power_switch_enable, isolation_enable, state_retention_enable;
   input clk, p_reset;

   wire [7:0] count;
   wire start, iso_en;
   wire [3:0] power_control;

   assign isolation_enable = ~ iso_en;
   state state_inst (.start(start), .power_control(power_control), .clk(clk), .reset(p_reset), .count(count));
   counter counter_inst (.count(count), .start(start), .clk(clk), .reset(p_reset));
   pd_control pd_inst(.sleep(power_control[0]), .clk(clk), .reset(p_reset), .isolation_enable(iso_en), .state_retention_enable(state_retention_enable), .power_switch_enable(power_switch_enable));

endmodule

module pd_control (sleep, clk, reset, isolation_enable, state_retention_enable, power_switch_enable);
input sleep, clk, reset;
output isolation_enable, state_retention_enable, power_switch_enable;
wire [7:0] count;

   power_state power_state_i(.start(start), .sleep(sleep), .isolation_enable(isolation_enable), .state_retention_enable(state_retention_enable), .power_switch_enable(power_switch_enable), .clk(clk), .reset(reset), .count(count));
   counter counter_i (.count(count), .start(start), .clk(clk), .reset(reset));

endmodule

module power_state (start, power_switch_enable, state_retention_enable, isolation_enable, sleep, clk, reset, count);
   input clk, reset, sleep;
   input [7:0] count;
   output start, power_switch_enable, state_retention_enable, isolation_enable;

   reg [2:0] fsm_N;
   reg [2:0] fsm;
   reg start, power_switch_enable, state_retention_enable, isolation_enable;
   reg power_switch_enable_N, state_retention_enable_N, isolation_enable_N;

   parameter [2:0] ice_wake = 3'b000,
                   ice_sleep = 3'b001,
                   pge_sleep = 3'b011,
                   pse_sleep = 3'b010,
                   pse_wake = 3'b110,
                   pge_wake = 3'b100;

   always @ (posedge clk or posedge reset)
      begin: fsm_S
         if (reset) begin
             fsm = ice_wake;
         end
         else begin
	     fsm = fsm_N;
	     isolation_enable = isolation_enable_N;
	     state_retention_enable = state_retention_enable_N;
	     power_switch_enable = power_switch_enable_N;
         end
      end

   always @ (sleep or count or fsm or isolation_enable or state_retention_enable or power_switch_enable)
      begin: fsm_C
         start = 1;
	 fsm_N = fsm;
	 isolation_enable_N = isolation_enable;
	 state_retention_enable_N = state_retention_enable;
	 power_switch_enable_N = power_switch_enable;
         case (fsm)
            ice_wake: begin
               if (count == 8) begin
                  start = 0;
         	  isolation_enable_N = 0;
         	  state_retention_enable_N = 0;
         	  power_switch_enable_N = 0;
                  if (sleep == 1) 
                     fsm_N = ice_sleep;
                  else
                     fsm_N = ice_wake;
               end
            end

            ice_sleep: begin
               if (count == 8) begin
                  start = 0;
         	  isolation_enable_N = 1;
         	  state_retention_enable_N = 0;
         	  power_switch_enable_N = 0;
                  if (sleep == 0) 
                     fsm_N = ice_wake;
                  else
                     fsm_N = pge_sleep;
               end
            end

            pge_sleep: begin
               if (count == 10) begin
                  start = 0;
         	  isolation_enable_N = 1;
         	  state_retention_enable_N = 1;
         	  power_switch_enable_N = 0;
                  if (sleep == 0) 
                     fsm_N = ice_sleep;
                  else
                     fsm_N = pse_sleep;
               end
            end

            pse_sleep: begin
               if (count == 6) begin
                  start = 0;
         	  isolation_enable_N = 1;
         	  state_retention_enable_N = 1;
         	  power_switch_enable_N = 1;
                  if (sleep == 0) 
                     fsm_N = pse_wake;
                  else
                     fsm_N = pse_sleep;
               end
            end

            pse_wake: begin
               if (count == 6) begin
                  start = 0;
         	  isolation_enable_N = 1;
         	  state_retention_enable_N = 1;
         	  power_switch_enable_N = 0;
                  if (sleep == 0) 
                     fsm_N = pge_wake;
                  else
                     fsm_N = pse_sleep;
               end
            end

            pge_wake: begin
               if (count == 8) begin
                  start = 0;
         	  isolation_enable_N = 1;
         	  state_retention_enable_N = 0;
         	  power_switch_enable_N = 0;
                  if (sleep == 0) 
                     fsm_N = ice_wake;
                  else
                     fsm_N = pse_wake;
               end
            end

            default: begin
               fsm_N = ice_wake;
            end
         endcase
      end

endmodule

