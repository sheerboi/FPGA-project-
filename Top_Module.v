`timescale 1ns / 1ps

module Top_Module(
    input clk,
    input clk25,
    input clk125,
    input rst,
    input [11:0] in,
//    input signed [15:0] twiddle0_real,
//    input signed [15:0] twiddle1_real,
//    input signed [15:0] twiddle2_real,
//    input signed [15:0] twiddle3_real,
//    input signed [15:0] twiddle0_imag,
//    input signed [15:0] twiddle1_imag,
//    input signed [15:0] twiddle2_imag,
//    input signed [15:0] twiddle3_imag,
    output reg signed [11:0] out_real,
    output reg signed [11:0] out_imag
    //output [2:0] peak_frequency
    );
    
    reg signed [15:0] inputs [7:0];
    reg signed [11:0] outputs_real [7:0];
    reg signed [11:0] outputs_imag [7:0];
    reg [2:0] output_pointer;
//    reg signed [66:0] out_real0;
//    reg signed [66:0] out_real1;
//    reg signed [66:0] out_real2;
//    reg signed [66:0] out_real3;
//    reg signed [66:0] out_real4;
//    reg signed [66:0] out_real5;
//    reg signed [66:0] out_real6;
//    reg signed [66:0] out_real7;
//    reg signed [66:0] out_imag0;
//    reg signed [66:0] out_imag1;
//    reg signed [66:0] out_imag2;
//    reg signed [66:0] out_imag3;
//    reg signed [66:0] out_imag4;
//    reg signed [66:0] out_imag5;
//    reg signed [66:0] out_imag6;
//    reg signed [66:0] out_imag7;
    
    reg signed [15:0] twiddle0_real;
    reg signed [15:0] twiddle1_real;
    reg signed [15:0] twiddle2_real;
    reg signed [15:0] twiddle3_real;
    reg signed [15:0] twiddle0_imag;
    reg signed [15:0] twiddle1_imag;
    reg signed [15:0] twiddle2_imag;
    reg signed [15:0] twiddle3_imag;
    
    reg [3:0] countclk125;
    reg [3:0] countclk25;
     
    wire signed [66:0] out_real0;
    wire signed [66:0] out_real1;
    wire signed [66:0] out_real2;
    wire signed [66:0] out_real3;
    wire signed [66:0] out_real4;
    wire signed [66:0] out_real5;
    wire signed [66:0] out_real6;
    wire signed [66:0] out_real7;
    wire signed [66:0] out_imag0;
    wire signed [66:0] out_imag1;
    wire signed [66:0] out_imag2;
    wire signed [66:0] out_imag3;
    wire signed [66:0] out_imag4;
    wire signed [66:0] out_imag5;
    wire signed [66:0] out_imag6;
    wire signed [66:0] out_imag7;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            twiddle0_real <= 16'b0100000000000000; //1.0 represented in 16 bits, in 2.14 format
            twiddle1_real <= 16'b0010110101000001; //0.7071067812
            twiddle2_real <= 16'b0000000000000000; //0
            twiddle3_real <= 16'b1101001010111111; //-0.7071067812
            twiddle0_imag <= 16'b0000000000000000; //0
            twiddle1_imag <= 16'b1101001010111111; //-0.7071067812
            twiddle2_imag <= 16'b1100000000000000; //-1
            twiddle3_imag <= 16'b1101001010111111; //-0.7071067812
        end
       
    end
    
    always @(posedge clk125 or posedge rst) begin
        if (rst) begin
            inputs[0] <= 16'b0;
            inputs[1] <= 16'b0;
            inputs[2] <= 16'b0;
            inputs[3] <= 16'b0;
            inputs[4] <= 16'b0;
            inputs[5] <= 16'b0;
            inputs[6] <= 16'b0;
            inputs[7] <= 16'b0;
            outputs_real[0] <= 12'b0;
            outputs_real[1] <= 12'b0;
            outputs_real[2] <= 12'b0;
            outputs_real[3] <= 12'b0;
            outputs_real[4] <= 12'b0;
            outputs_real[5] <= 12'b0;
            outputs_real[6] <= 12'b0;
            outputs_real[7] <= 12'b0;
            outputs_imag[0] <= 12'b0;
            outputs_imag[1] <= 12'b0;
            outputs_imag[2] <= 12'b0;
            outputs_imag[3] <= 12'b0;
            outputs_imag[4] <= 12'b0;
            outputs_imag[5] <= 12'b0;
            outputs_imag[6] <= 12'b0;
            outputs_imag[7] <= 12'b0;
            countclk125 <= 4'b0;
        end
       
        else begin
            countclk125 <= countclk125 +1;
            if(countclk125==4'b1111) begin
                inputs[7] <= {4'b0,in};
                inputs[6] <= {4'b0,inputs[7]};
                inputs[5] <= {4'b0,inputs[6]};
                inputs[4] <= {4'b0,inputs[5]};
                inputs[3] <= {4'b0,inputs[4]};
                inputs[2] <= {4'b0,inputs[3]};
                inputs[1] <= {4'b0,inputs[2]};
                inputs[0] <= {4'b0,inputs[1]};
                outputs_real[0] <= out_real0[66:55];
                outputs_real[1] <= out_real1[66:55];
                outputs_real[2] <= out_real2[66:55];
                outputs_real[3] <= out_real3[66:55];
                outputs_real[4] <= out_real4[66:55];
                outputs_real[5] <= out_real5[66:55];
                outputs_real[6] <= out_real6[66:55];
                outputs_real[7] <= out_real7[66:55];
                outputs_imag[0] <= out_imag0[66:55];
                outputs_imag[1] <= out_imag1[66:55];
                outputs_imag[2] <= out_imag2[66:55];
                outputs_imag[3] <= out_imag3[66:55];
                outputs_imag[4] <= out_imag4[66:55];
                outputs_imag[5] <= out_imag5[66:55];
                outputs_imag[6] <= out_imag6[66:55];
                outputs_imag[7] <= out_imag7[66:55];
            end
        end
    end
    
//     always @(posedge clk125 or posedge rst) begin
//        if (rst) begin
//            outputs_real[0] <= 16'b0;
//            outputs_real[1] <= 16'b0;
//            outputs_real[2] <= 16'b0;
//            outputs_real[3] <= 16'b0;
//            outputs_real[4] <= 16'b0;
//            outputs_real[5] <= 16'b0;
//            outputs_real[6] <= 16'b0;
//            outputs_real[7] <= 16'b0;
//            outputs_imag[0] <= 16'b0;
//            outputs_imag[1] <= 16'b0;
//            outputs_imag[2] <= 16'b0;
//            outputs_imag[3] <= 16'b0;
//            outputs_imag[4] <= 16'b0;
//            outputs_imag[5] <= 16'b0;
//            outputs_imag[6] <= 16'b0;
//            outputs_imag[7] <= 16'b0;
//        end

//        else begin
//            outputs_real[0] <= out_real0[66:55];
//            outputs_real[1] <= out_real1[66:55];
//            outputs_real[2] <= out_real2[66:55];
//            outputs_real[3] <= out_real3[66:55];
//            outputs_real[4] <= out_real4[66:55];
//            outputs_real[5] <= out_real5[66:55];
//            outputs_real[6] <= out_real6[66:55];
//            outputs_real[7] <= out_real7[66:55];
//            outputs_imag[0] <= out_imag0[66:55];
//            outputs_imag[1] <= out_imag1[66:55];
//            outputs_imag[2] <= out_imag2[66:55];
//            outputs_imag[3] <= out_imag3[66:55];
//            outputs_imag[4] <= out_imag4[66:55];
//            outputs_imag[5] <= out_imag5[66:55];
//            outputs_imag[6] <= out_imag6[66:55];
//            outputs_imag[7] <= out_imag7[66:55];
//        end
//    end
    always @(posedge clk25 or posedge rst) begin
        if (rst) begin
            out_real <= 12'b0;
            out_imag <= 12'b0;
            output_pointer <=3'b000;
            countclk25 <= 4'b0000;
        end
        
        else begin
            countclk25<=countclk25+1;
            if(countclk25==4'b1111) begin
                out_real <= outputs_real[output_pointer];
                out_imag <= outputs_imag[output_pointer];
                output_pointer <= output_pointer+1;
            end
        end
    end    
    
    FFT fft(
        inputs[0],
        inputs[1],
        inputs[2],
        inputs[3],
        inputs[4],
        inputs[5],
        inputs[6],
        inputs[7],
        twiddle0_real,
        twiddle1_real,
        twiddle2_real,
        twiddle3_real,
        twiddle0_imag,
        twiddle1_imag,
        twiddle2_imag,
        twiddle3_imag,
        out_real0,
        out_real1,
        out_real2,
        out_real3,
        out_real4,
        out_real5,
        out_real6,
        out_real7,
        out_imag0,
        out_imag1,
        out_imag2,
        out_imag3,
        out_imag4,
        out_imag5,
        out_imag6,
        out_imag7
    );
    
//    Magnitude_Comparator magcomp(
//        clk,
//        out_real0,
//        out_real1,
//        out_real2,
//        out_real3,
//        out_real4,
//        out_imag0,
//        out_imag1,
//        out_imag2,
//        out_imag3,
//        out_imag4,
//        peak_frequency
//    );
endmodule
