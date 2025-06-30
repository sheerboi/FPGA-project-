`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 15:57:42
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps


module DA2_sim();
    
    reg clk, rst, update;
    reg [11:0] value0 = 12'b101010101010;
    reg [11:0] value1 = 12'b111111111111;
    wire Sync,sclk;
    wire [1:0] SDATA;
    
    DA2_Top dut(
    .clk(clk),
    .rst(rst),
    .update(update),
    .value0(value0),
    .value1(value1),
    .SDATA(SDATA),
    .SYNC(Sync),
    .SCLK(sclk)
);
    

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
      update <= 1;
      #1500
      update <= 1;
    end
endmodule
