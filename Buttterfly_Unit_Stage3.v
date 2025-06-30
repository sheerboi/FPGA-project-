`timescale 1ns / 1ps

module Butterfly_Unit_Stage3(
    input signed [49:0] in1_real,
    input signed [49:0] in1_imag,
    input signed [49:0] in2_real,
    input signed [49:0] in2_imag,
    input signed [15:0] twiddle_real,
    input signed [15:0] twiddle_imag,
    output reg signed [66:0] out1_real,
    output reg signed [66:0] out1_imag,
    output reg signed [66:0] out2_real,
    output reg signed [66:0] out2_imag
);

//Input has 50 bits ==> 22 integer bits and 28 fractional bits
//Twiddle_factor has 2 integer bits and 14 fractional bits
//So the temp1 register after multiplication will have 22+2 = 24 integer bits and 28+14 = 42 fractional bits
//Overall temp1 register must have 66 bits
//But since we will be adding our temp1/temp2 register with input1, overflow might occur. So lets take one extra bit for this
//So overall the output will have 67 bits ==> 25 integer bits and 42 fractional bits

reg signed [65:0] temp1;
reg signed [65:0] temp2;
reg signed [66:0] in1_real_signextended;
reg signed [66:0] in1_imag_signextended;
reg signed [66:0] temp1_signextended;
reg signed [66:0] temp2_signextended;

always@(*) begin

    temp1 = (in2_real*twiddle_real)-(in2_imag*twiddle_imag);
    temp2 = (in2_real*twiddle_imag)+(in2_imag*twiddle_real);
    in1_real_signextended = in1_real[49]?{3'b111,in1_real,14'b11111111111111}:{3'b000,in1_real,14'b00000000000000};
    in1_imag_signextended = in1_imag[49]?{3'b111,in1_imag,14'b11111111111111}:{3'b000,in1_imag,14'b00000000000000};
    temp1_signextended = temp1[65]?{1'b1,temp1}:{1'b0,temp1};
    temp2_signextended = temp2[65]?{1'b1,temp2}:{1'b0,temp2};
    out1_real = in1_real_signextended+temp1_signextended;
    out1_imag = in1_imag_signextended+temp2_signextended;
    out2_real = in1_real_signextended-temp1_signextended;
    out2_imag = in1_imag_signextended-temp2_signextended;
    
end
    
endmodule