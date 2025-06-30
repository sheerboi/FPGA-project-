`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2025 16:05:08
// Design Name: 
// Module Name: spi_clk_tb
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

module tb_spi_clock_divider;

  // Testbench signals
  reg clk;
  reg rst;
  wire spi_clk;

  // Instantiate the DUT (Device Under Test)
  spi_clock_divider uut (
    .clk(clk),
    .rst(rst),
    .spi_clk(spi_clk)
  );

  // 100 MHz clock generation: Toggle every 5 ns => 10 ns period
  initial clk = 0;
  always #5 clk = ~clk;

  // Simulation control
  initial begin
    // Initialize
    rst = 1;
    #20;           // Hold reset for a few cycles
    rst = 0;

    // Run for a while to observe ext_spi_clk toggling
    #1000;

    $stop;
  end

endmodule