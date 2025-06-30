`timescale 1ns / 1ps

module tb_top_module();

reg clk;
reg rst;
reg [15:0] in0;
reg [15:0] in1;
reg [15:0] in2;
reg [15:0] in3;
reg [15:0] in4;
reg [15:0] in5;
reg [15:0] in6;
reg [15:0] in7;
reg [15:0] twiddle0_real;
reg [15:0] twiddle1_real;
reg [15:0] twiddle2_real;
reg [15:0] twiddle3_real;
reg [15:0] twiddle0_imag;
reg [15:0] twiddle1_imag;
reg [15:0] twiddle2_imag;
reg [15:0] twiddle3_imag;
wire [65:0] out_real0;
wire [65:0] out_real1;
wire [65:0] out_real2;
wire [65:0] out_real3;
wire [65:0] out_real4;
wire [65:0] out_real5;
wire [65:0] out_real6;
wire [65:0] out_real7;
wire [65:0] out_imag0;
wire [65:0] out_imag1;
wire [65:0] out_imag2;
wire [65:0] out_imag3;
wire [65:0] out_imag4;
wire [65:0] out_imag5;
wire [65:0] out_imag6;
wire [65:0] out_imag7;

FFT uut(
    in0,
    in1,
    in2,
    in3,
    in4,
    in5,
    in6,
    in7,
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
    
initial begin

    in0 = 0;
    in1 =0;
    in2 =0;
    in3 =0;
    in4 =0;
    in5 =0;
    in6 =0;
    in7 =0;
    clk =0;
    rst =1;
    twiddle0_real = 16'b0100000000000000; //1.0 represented in 16 bits, in 2.14 format
    twiddle1_real = 16'b0010110101000001; //0.7071067812
    twiddle2_real = 16'b0000000000000000; //0
    twiddle3_real = 16'b1101001010111111; //-0.7071067812
    twiddle0_imag = 16'b0000000000000000; //0
    twiddle1_imag = 16'b1101001010111111; //-0.7071067812
    twiddle2_imag = 16'b1100000000000000; //-1
    twiddle3_imag = 16'b1101001010111111; //-0.7071067812
    #10
    rst=0;
    //4094,4093,4095,4093,4093,4091,4094,4095
    #10 
    in0 = 4095;
    in1 = 4092;
    #10 
    in0 = 4094;
    in1 = 4091;
    #10 
    in0 = 4091;
    #10 
    in0 = 4093;
    #10 
    in0 = 4093;
    #10
    in0 = 4095;
    #10 
    in0 = 4093;
    #10 
    in0 = 4094;
    #10 
    $finish;
end

always begin
    #5 clk = ~clk;
end

endmodule
