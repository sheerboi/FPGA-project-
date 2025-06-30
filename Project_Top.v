`timescale 1ns / 1ps

module Project_Top(
    input clk,
    input rst,
    input MISO_Mic,
    output SCLK_MIC,        
    output CS_MIC,
    output [1:0] SDATA_DA2,
    output SYNC_DA2,
    output SCLK_DA2
    );
    
    wire [11:0] in;
    wire [11:0] value0;
    wire [11:0] value1;
    reg update;
    reg read;
    reg new_data1; 
    wire new_data;
    
    always@(*) new_data1=new_data;
    
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            update<=1'b0;
           read<=1'b0;
        end
        else begin
            update<=1'b1;
           read<=1'b1;
        end
    end
    
    MIC3_top mic(
      .clk(clk),          // 100 MHz system clock from ZedBoard        
      .MISO(MISO_Mic),         // SPI data from Pmod MIC
      .rst(rst),
      .read(read), //Read signal goes high for one clock cycle of 12.5 MHz after every 16 clock cycles of 12.5 MHz
      .audio(in),
      .new_data(new_data),
      .SCLK(SCLK_MIC),        // SPI clock to MIC
      .CS(CS_MIC)          // Chip Select (Active Low)
         // Pulse when new audio data is available
    );

//    spi_receiver mic(
//    .clk(clk),             // 100 MHz system clock
//    .rst(rst),
//    .miso(MISO_Mic),
//    .sclk(SCLK_MIC),
//    .ss(CS_MIC),
//    .data_out(in),
//    .data_valid(new_data)
//);
    
    
    Top_Module fft(
    .clk(clk),
    .clk25(SCLK_DA2),
    .clk125(SCLK_MIC),
    .rst(rst),
    .in(in),
    .out_real(value0),
    .out_imag(value1)
    );
    
    DA2_Top da2(
    .clk(clk),
    .rst(rst),
    .update(update),   //Update signal goes high for one clock cycle of 25 MHz after every 16 clock cycles of 25 MHz
    .value0(value0),
    .value1(value1),
    .SDATA(SDATA_DA2),
    .SYNC(SYNC_DA2),
    .SCLK(SCLK_DA2)
    );
    
    
    
endmodule
