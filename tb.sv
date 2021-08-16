`timescale 1ns/1ps

module tb;

   reg clk;
   always begin
      #(10ns) clk = ~clk;
   end

   reg reset;
   wire d;

   top u_top(.clk(clk), .reset(reset), .d(d));

   initial begin
      reset = 1;
      clk = 0;
      run_test();
      $finish();
   end

   task run_test;
      begin
         $display("Resetting...");
         @(posedge clk);
         reset <= 0;
         @(negedge clk);
         @(posedge clk);
         reset <= 1;
         if (d === 0) begin
            $display("PASS: d is 0");
         end else if (d === 1) begin
            $display("FAIL: d is 1");
         end else begin
            $display("FAIL: d is ", d);
         end
         $display("Running");
         repeat(16) begin
            @clk;
         end
         if (d == 1) begin
            $display("PASS: d is 1");
         end else begin
            $display("FAIL: d is 0");
         end
      end
   endtask // run_test

endmodule // tb
