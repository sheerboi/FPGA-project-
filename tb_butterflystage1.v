`timescale 1ns / 1ps

module tb_butterflystage1();

reg [15:0] in1_real;
reg [15:0] in1_imag;
reg [15:0] in2_real;
reg [15:0] in2_imag;
reg [15:0] twiddle_real;
reg [15:0] twiddle_imag;
wire [32:0] out1_real;
wire [32:0] out1_imag;
wire [32:0] out2_real;
wire [32:0] out2_imag;

Butterfly_Unit_Stage1 uut(
    in1_real,
    in1_imag,
    in2_real,
    in2_imag,
    twiddle_real,
    twiddle_imag,
    out1_real,
    out1_imag,
    out2_real,
    out2_imag
);

initial begin 
    in1_real = 0;
    in1_imag =0;
    in2_real = 0;
    in2_imag=0;
    twiddle_real=0;
    twiddle_imag=0;
    #10
    in1_real = 1;
    in1_imag =0;
    in2_real = 1;
    in2_imag=0;
    twiddle_real=10000;
    twiddle_imag=0;
    #10
    in1_real = 1;
    in1_imag =0;
    in2_real = 1;
    in2_imag=0;
    twiddle_real=1;
    twiddle_imag=0;
    #10
    $finish;
    
end

endmodule
