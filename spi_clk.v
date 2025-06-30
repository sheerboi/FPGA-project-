`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2025 16:00:03
// Design Name: 
// Module Name: spi_clk
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

module spi_clock_divider(
  input clk,        // 100 MHz system clock
  input rst,
  output reg spi_clk
);

  reg [2:0] counter;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      counter <= 0;
      spi_clk <= 0;
    end else begin
      if (counter == 3) begin  // Divide by 4 => 100 MHz / 4 = 25 MHz; toggle => 12.5 MHz
        counter <= 0;
        spi_clk <= ~spi_clk;
      end else begin
        counter <= counter + 1;
      end
    end
  end
endmodule

