`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 15:43:30
// Design Name: 
// Module Name: top_tb
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


module tb_top;

  // Inputs
  reg clk;
  reg rst;
  reg read;
  reg MISO;

  // Outputs
  wire SCLK;
  wire CS;
  wire [11:0] audio;
  wire new_data;

  // Instantiate the top module
  MIC3_top uut (
    .clk(clk),
    .rst(rst),
    .read(read),
    .MISO(MISO),
    .SCLK(SCLK),
    .CS(CS),
    .audio(audio),
    .new_data(new_data)
  );

  // Clock generation: 100 MHz
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Testbench stimulus
  initial begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, tb_top);
    $display("Starting top module test...");

    // Initialize
    rst = 1;
    read = 0;
    MISO = 0;

    // Reset pulse
    #50;
    rst = 0;
    #20;

    // First SPI transaction
    $display("Triggering first read...");
    read = 1;
    #20;
    read = 0;

    // Wait for SPI to become active
    wait(CS == 0);

    // Simulate 12-bit audio sample (0xCDE = 1100_1101_1110)
   MISO = 1; @(negedge SCLK); // dummy bit 
    MISO = 1; @(negedge SCLK); // bit 11
    MISO = 1; @(negedge SCLK); // bit 10
    MISO = 0; @(negedge SCLK); // bit 9
    MISO = 0; @(negedge SCLK); // bit 8
    MISO = 1; @(negedge SCLK); // bit 7
    MISO = 1; @(negedge SCLK); // bit 6
    MISO = 0; @(negedge SCLK); // bit 5
    MISO = 1; @(negedge SCLK); // bit 4
    MISO = 1; @(negedge SCLK); // bit 3
    MISO = 1; @(negedge SCLK); // bit 2
    MISO = 1; @(negedge SCLK); // bit 1
    MISO = 1; @(negedge SCLK); // bit 0

    // Wait for new_data signal
    wait(new_data);
    $display("First audio sample received: %h", audio);

    // Wait and perform another transaction
    #200;

    $display("Triggering second read...");
    read = 1;
    #20;
    read = 0;

    wait(CS == 0);

    // Simulate second sample (0x123 = 0001_0010_0011)
    MISO = 0; @(negedge SCLK);
    MISO = 0; @(negedge SCLK);
    MISO = 0; @(negedge SCLK);
    MISO = 1; @(negedge SCLK);
    MISO = 0; @(negedge SCLK);
    MISO = 0; @(negedge SCLK);
    MISO = 1; @(negedge SCLK);
    MISO = 0; @(negedge SCLK);
    MISO = 0; @(negedge SCLK);
    MISO = 1; @(negedge SCLK);
    MISO = 1; @(negedge SCLK);
    MISO = 0; @(negedge SCLK);

    wait(new_data);
    $display("Second audio sample received: %h", audio);

    #100;
    $display("Test complete.");
    $finish;
  end

endmodule
