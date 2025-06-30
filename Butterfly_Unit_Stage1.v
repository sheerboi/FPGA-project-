`timescale 1ns / 1ps

module Butterfly_Unit_Stage1(
    input signed [15:0] in1_real,
    input signed [15:0] in1_imag,
    input signed [15:0] in2_real,
    input signed [15:0] in2_imag,
    input signed [15:0] twiddle_real,
    input signed [15:0] twiddle_imag,
    output reg signed [32:0] out1_real,
    output reg signed [32:0] out1_imag,
    output reg signed [32:0] out2_real,
    output reg signed [32:0] out2_imag
);

//Fixed Point Notation
//Input has no fractional bits ==> 16 integer bits
//Twiddle_factor has 2 integer bits and 14 fractional bits
//So the temp1 register after multiplication will have 16+2 = 18 integer bits and 14+0 = 14 fractional bits
//Overall temp1 register must have 32 bits
//But since we will be adding our temp1/temp2 register with input1, overflow might occur. So lets take one extra bit for this
//So overall the output will have 33 bits ==> 19 integer bits and 14 fractional bits
//Lets truncate our output sacrificing some precision for resources.
//Assume our output has only 24 bits ==> 19 integer bits and 5 fractional bits
reg signed [31:0] temp1; 
reg signed [31:0] temp2;
reg signed [32:0] in1_real_signextended;
reg signed [32:0] in1_imag_signextended;
reg signed [32:0] temp1_signextended;
reg signed [32:0] temp2_signextended;
always@(*) begin

    temp1 = (in2_real*twiddle_real)-(in2_imag*twiddle_imag);
    temp2 = (in2_real*twiddle_imag)+(in2_imag*twiddle_real);
    in1_real_signextended = in1_real[15]?{3'b111,in1_real,14'b11111111111111}:{3'b000,in1_real,14'b00000000000000};
    in1_imag_signextended = in1_imag[15]?{3'b111,in1_imag,14'b11111111111111}:{3'b000,in1_imag,14'b00000000000000};
    temp1_signextended = temp1[31]?{1'b1,temp1}:{1'b0,temp1};
    temp2_signextended = temp2[31]?{1'b1,temp2}:{1'b0,temp2};
    out1_real = in1_real_signextended+temp1_signextended;
    out1_imag = in1_imag_signextended+temp2_signextended;
    out2_real = in1_real_signextended-temp1_signextended;
    out2_imag = in1_imag_signextended-temp2_signextended;
    
end
    
endmodule


