`timescale 1ns / 1ps
module ripple_carry_adder_16bit (
    input [15:0] A,
    input [15:0] B,
    output [15:0] Sum,
    output Cout
);

    wire [3:0] C;

    ripple_carry_adder_4bit rca0 (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(1'b0),
        .Sum(Sum[3:0]),
        .Cout(C[0])
    );

    ripple_carry_adder_4bit rca1 (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(C[0]),
        .Sum(Sum[7:4]),
        .Cout(C[1])
    );

    ripple_carry_adder_4bit rca2 (
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(C[1]),
        .Sum(Sum[11:8]),
        .Cout(C[2])
    );

    ripple_carry_adder_4bit rca3 (
        .A(A[15:12]),
        .B(B[15:12]),
        .Cin(C[2]),
        .Sum(Sum[15:12]),
        .Cout(Cout)
    );

endmodule
