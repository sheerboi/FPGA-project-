
#include <stdio.h>

struct complex_out
{
    float out1_real, out1_imag, out2_real, out2_imag;
};

struct complex_out butterfly(float in1_real, float in1_imag, float in2_real, float in2_imag, float twiddle_real, float twiddle_imag)
{
    float out1_real, out1_imag, out2_real, out2_imag;
    float temp1, temp2;
    temp1 = (in2_real * twiddle_real) - (in2_imag * twiddle_imag);
    temp2 = (in2_real * twiddle_imag) + (in2_imag * twiddle_real);
    out1_real = in1_real + temp1;
    out1_imag = in1_imag + temp2;
    out2_real = in1_real - temp1;
    out2_imag = in1_imag - temp2;
    struct complex_out out = {out1_real, out1_imag, out2_real, out2_imag};
    return out;
}

void fft(float in[8])
{
    float twiddle0_real = 1;
    float twiddle0_imag = 0;
    float twiddle1_real = 0.7071067812;
    float twiddle1_imag = -0.7071067812;
    float twiddle2_real = 0;
    float twiddle2_imag = -1;
    float twiddle3_real = -0.7071067812;
    float twiddle3_imag = -0.7071067812;

    struct complex_out stage00 = butterfly(in[0], 0, in[4], 0, twiddle0_real, twiddle0_imag);
    struct complex_out stage01 = butterfly(in[2], 0, in[6], 0, twiddle0_real, twiddle0_imag);
    struct complex_out stage02 = butterfly(in[1], 0, in[5], 0, twiddle0_real, twiddle0_imag);
    struct complex_out stage03 = butterfly(in[3], 0, in[7], 0, twiddle0_real, twiddle0_imag);
    struct complex_out stage10 = butterfly(stage00.out1_real, stage00.out1_imag, stage01.out1_real, stage01.out1_imag, twiddle0_real, twiddle0_imag);
    struct complex_out stage11 = butterfly(stage00.out2_real, stage00.out2_imag, stage01.out2_real, stage01.out2_imag, twiddle2_real, twiddle2_imag);
    struct complex_out stage12 = butterfly(stage02.out1_real, stage02.out1_imag, stage03.out1_real, stage03.out1_imag, twiddle0_real, twiddle0_imag);
    struct complex_out stage13 = butterfly(stage02.out2_real, stage02.out2_imag, stage03.out2_real, stage03.out2_imag, twiddle2_real, twiddle2_imag);
    struct complex_out stage20 = butterfly(stage10.out1_real, stage10.out1_imag, stage12.out1_real, stage12.out1_imag, twiddle0_real, twiddle0_imag);
    struct complex_out stage21 = butterfly(stage11.out1_real, stage11.out1_imag, stage13.out1_real, stage13.out1_imag, twiddle1_real, twiddle1_imag);
    struct complex_out stage22 = butterfly(stage10.out2_real, stage10.out2_imag, stage12.out2_real, stage12.out2_imag, twiddle2_real, twiddle2_imag);
    struct complex_out stage23 = butterfly(stage11.out2_real, stage11.out2_imag, stage13.out2_real, stage13.out2_imag, twiddle3_real, twiddle3_imag);

    printf("x0 real: %f, x0 imag: %f\n", stage20.out1_real, stage20.out1_imag);
    printf("x1 real: %f, x1 imag: %f\n", stage21.out1_real, stage21.out1_imag);
    printf("x2 real: %f, x2 imag: %f\n", stage22.out1_real, stage22.out1_imag);
    printf("x3 real: %f, x3 imag: %f\n", stage23.out1_real, stage23.out1_imag);
    printf("x4 real: %f, x4 imag: %f\n", stage20.out2_real, stage20.out2_imag);
    printf("x5 real: %f, x5 imag: %f\n", stage21.out2_real, stage21.out2_imag);
    printf("x6 real: %f, x6 imag: %f\n", stage22.out2_real, stage22.out2_imag);
    printf("x7 real: %f, x7 imag: %f\n", stage23.out2_real, stage23.out2_imag);
}

int main()
{
    float input[8] = {4094, 4093, 4095, 4093, 4093, 4091, 4094, 4095};
    fft(input);
    return 0;
}
