`timescale 1ns / 1ps

module Magnitude_Comparator(
    input clk,
    input signed [66:0] out_real0,
    input signed [66:0] out_real1,
    input signed [66:0] out_real2,
    input signed [66:0] out_real3,
    input signed [66:0] out_real4,
    input signed [66:0] out_imag0,
    input signed [66:0] out_imag1,
    input signed [66:0] out_imag2,
    input signed [66:0] out_imag3,
    input signed [66:0] out_imag4,
    output reg [2:0] peak_frequency
    );
    
    //Lets truncate the outputs while calculating the magnitudes, sacrificing some precision for better utilization
    //Lets consider only the 25 integer bits and 30 fractional bits ==> Only the last 55 bits.
    // Magnitude will have 55 + 55 + 1(overflow) = 111 bits
    //Since magnitude of X(k) = X(N-K) in a DFT
    reg [110:0] mag0;
    reg [110:0] mag1_7;
    reg [110:0] mag2_6;
    reg [110:0] mag3_5;
    reg [110:0] mag4;
    
    always@(posedge clk) begin
        mag0 <= out_real0*out_real0+out_imag0*out_imag0;
        mag1_7 <= out_real1*out_real1+out_imag1*out_imag1;
        mag2_6 <= out_real2*out_real2+out_imag2*out_imag2;
        mag3_5 <= out_real3*out_real3+out_imag3*out_imag3;
        mag4 <= out_real4*out_real4+out_imag4*out_imag4;
    end
    
    always@(*) begin
        if((mag0>=mag1_7)&&(mag0>=mag2_6)&&(mag0>=mag3_5)&&(mag0>=mag4)) begin
            peak_frequency = 2'd0;
        end
        else if((mag1_7>=mag0)&&(mag1_7>=mag2_6)&&(mag1_7>=mag3_5)&&(mag1_7>=mag4)) begin
            peak_frequency = 2'd1;
        end
        else if((mag2_6>=mag1_7)&&(mag2_6>=mag0)&&(mag2_6>=mag3_5)&&(mag2_6>=mag4)) begin
            peak_frequency = 2'd2;
        end
        else if((mag3_5>=mag1_7)&&(mag3_5>=mag2_6)&&(mag3_5>=mag0)&&(mag3_5>=mag4)) begin
            peak_frequency = 2'd3;
        end
        else begin
            peak_frequency = 2'd4;
        end
    end
    
endmodule
