`timescale 1ns / 1ps


module DA2_sim();
    
    reg clk, rst, update;
    reg [11:0] value0 = 12'hAAA;
    reg [11:0] value1 = 12'hFFF;
    wire [1:0] SDATA;
    wire SYNC;
    
    DA2_Top dut(
    clk,
    rst,
    value0,
    value1,
    update,
    SDATA
,
    SYNC);
    

    always #5 clk <= ~clk;

  initial
      begin
        $dumpfile("sim.vcd");
        $dumpvars(0, clk);
        $dumpvars(1, rst);
        $dumpvars(2, update);
        $dumpvars(3, SDATA);
        #4000
        $finish;
      end
  initial
    begin
      clk <= 0;
      update <= 0;
      rst <= 0;
      #7
      rst <= 1;
      #10
      rst <= 0;
      #50
      update <= 1;
      #10
      update <= 0;
      #1500
      update <= 1;
    end
endmodule
    
