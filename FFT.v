`timescale 1ns / 1ps

module FFT(
    input signed [15:0] in0,
    input signed [15:0] in1,
    input signed [15:0] in2,
    input signed [15:0] in3,
    input signed [15:0] in4,
    input signed [15:0] in5,
    input signed [15:0] in6,
    input signed [15:0] in7,
    input signed [15:0] twiddle0_real,
    input signed [15:0] twiddle1_real,
    input signed [15:0] twiddle2_real,
    input signed [15:0] twiddle3_real,
    input signed [15:0] twiddle0_imag,
    input signed [15:0] twiddle1_imag,
    input signed [15:0] twiddle2_imag,
    input signed [15:0] twiddle3_imag,
    output signed [66:0] out_real0,
    output signed [66:0] out_real1,
    output signed [66:0] out_real2,
    output signed [66:0] out_real3,
    output signed [66:0] out_real4,
    output signed [66:0] out_real5,
    output signed [66:0] out_real6,
    output signed [66:0] out_real7,
    output signed [66:0] out_imag0,
    output signed [66:0] out_imag1,
    output signed [66:0] out_imag2,
    output signed [66:0] out_imag3,
    output signed [66:0] out_imag4,
    output signed [66:0] out_imag5,
    output signed [66:0] out_imag6,
    output signed [66:0] out_imag7
    );
    
    wire [32:0] block00out1_real;
    wire [32:0] block00out1_imag;
    wire [32:0] block00out2_real;
    wire [32:0] block00out2_imag;
    wire [32:0] block01out1_real;
    wire [32:0] block01out1_imag;
    wire [32:0] block01out2_real;
    wire [32:0] block01out2_imag;
    wire [32:0] block02out1_real;
    wire [32:0] block02out1_imag;
    wire [32:0] block02out2_real;
    wire [32:0] block02out2_imag;
    wire [32:0] block03out1_real;
    wire [32:0] block03out1_imag;
    wire [32:0] block03out2_real;
    wire [32:0] block03out2_imag;
    wire [49:0] block10out1_real;
    wire [49:0] block10out1_imag;
    wire [49:0] block10out2_real;
    wire [49:0] block10out2_imag;
    wire [49:0] block11out1_real;
    wire [49:0] block11out1_imag;
    wire [49:0] block11out2_real;
    wire [49:0] block11out2_imag;
    wire [49:0] block12out1_real;
    wire [49:0] block12out1_imag;
    wire [49:0] block12out2_real;
    wire [49:0] block12out2_imag;
    wire [49:0] block13out1_real;
    wire [49:0] block13out1_imag;
    wire [49:0] block13out2_real;
    wire [49:0] block13out2_imag;
    
    Butterfly_Unit_Stage1 block00(
            in0,
            16'b0,
            in4,
            16'b0,
            twiddle0_real,
            twiddle0_imag,
            block00out1_real,
            block00out1_imag,
            block00out2_real,
            block00out2_imag
    );
    Butterfly_Unit_Stage1 block01(
            in2,
            16'b0,
            in6,
            16'b0,
            twiddle0_real,
            twiddle0_imag,
            block01out1_real,
            block01out1_imag,
            block01out2_real,
            block01out2_imag
    );
    Butterfly_Unit_Stage1 block02(
            in1,
            16'b0,
            in5,
            16'b0,
            twiddle0_real,
            twiddle0_imag,
            block02out1_real,
            block02out1_imag,
            block02out2_real,
            block02out2_imag
    );
    Butterfly_Unit_Stage1 block03(
            in3,
            16'b0,
            in7,
            16'b0,
            twiddle0_real,
            twiddle0_imag,
            block03out1_real,
            block03out1_imag,
            block03out2_real,
            block03out2_imag
    );
    
    Butterfly_Unit_Stage2 block10(
            block00out1_real,
            block00out1_imag,
            block01out1_real,
            block01out1_imag,
            twiddle0_real,
            twiddle0_imag,
            block10out1_real,
            block10out1_imag,
            block10out2_real,
            block10out2_imag
    );
    Butterfly_Unit_Stage2 block11(
            block00out2_real,
            block00out2_imag,
            block01out2_real,
            block01out2_imag,
            twiddle2_real,
            twiddle2_imag,
            block11out1_real,
            block11out1_imag,
            block11out2_real,
            block11out2_imag
    );
    Butterfly_Unit_Stage2 block12(
            block02out1_real,
            block02out1_imag,
            block03out1_real,
            block03out1_imag,
            twiddle0_real,
            twiddle0_imag,
            block12out1_real,
            block12out1_imag,
            block12out2_real,
            block12out2_imag
    );
    Butterfly_Unit_Stage2 block13(
            block02out2_real,
            block02out2_imag,
            block03out2_real,
            block03out2_imag,
            twiddle2_real,
            twiddle2_imag,
            block13out1_real,
            block13out1_imag,
            block13out2_real,
            block13out2_imag
    );
    Butterfly_Unit_Stage3 block20(
            block10out1_real,
            block10out1_imag,
            block12out1_real,
            block12out1_imag,
            twiddle0_real,
            twiddle0_imag,
            out_real0,
            out_imag0,
            out_real4,
            out_imag4
    );
    Butterfly_Unit_Stage3 block21(
            block11out1_real,
            block11out1_imag,
            block13out1_real,
            block13out1_imag,
            twiddle1_real,
            twiddle1_imag,
            out_real1,
            out_imag1,
            out_real5,
            out_imag5
    );
    Butterfly_Unit_Stage3 block22(
            block10out2_real,
            block10out2_imag,
            block12out2_real,
            block12out2_imag,
            twiddle2_real,
            twiddle2_imag,
            out_real2,
            out_imag2,
            out_real6,
            out_imag6
    );
    Butterfly_Unit_Stage3 block23(
            block11out2_real,
            block11out2_imag,
            block13out2_real,
            block13out2_imag,
            twiddle3_real,
            twiddle3_imag,
            out_real3,
            out_imag3,
            out_real7,
            out_imag7
    );
    
        
        
endmodule
