module top(
   input wire reset,

   input wire clk,
   output reg d);

   reg [4:0]  count;
   always @(posedge clk or negedge reset) begin
      if (~reset) begin
         count <= 0;
         d <= 0;
      end else begin
         count <= count + 1;
         if (count == 0) begin
            d <= ~d;
         end
      end
   end // always @ (posedge clk or negedge reset)
endmodule // test
