`timescale 1ns / 1ps

module MIC3_top (
  input clk,          // 100 MHz system clock from ZedBoard        
  input MISO,         // SPI data from Pmod MIC
  input rst,
  input read,
  output [11:0] audio,
  output new_data,
  output SCLK,        // SPI clock to MIC
  output CS          // Chip Select (Active Low)
     // Pulse when new audio data is available
);

  wire spi_clk; // Internal SPI clock (12.5 MHz)
//   wire rst;          // Reset signal
//  wire read;
//  wire [11:0] audio; // Captured 12-bit audio sample
//  wire new_data;  

  // Generate the 12.5 MHz SPI clock from 100 MHz input clock
  spi_clock_divider clk_gen (
    .clk(clk),         // 100 MHz system clock
    .rst(rst),         // Reset signal
    .spi_clk(spi_clk)  // 12.5 MHz SPI clock output
  );

  // Interface with Pmod MIC (SPI communication and data capture)
  mic3 mic_inst (
    .clk(clk),          // 100 MHz system clock
    .rst(rst),          // Reset signal
    .ext_spi_clk(spi_clk), // 12.5 MHz SPI clock
    .SCLK(SCLK),        // SPI clock to MIC
    .CS(CS),            // Chip Select for MIC
    .MISO(MISO),        // SPI data from Pmod MIC
    .read(read),        // Trigger for initiating the SPI transaction
    .audio(audio),      // 12-bit audio data output
    .new_data(new_data) // Pulse when new audio data is available
  );
  

endmodule
