`timescale 1ns / 1ps
module ripple_carry_adder_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [3:0] S;
    wire [3:0] C;

    full_adder fa0 (.A(A[0]), .B(B[0]), .Cin(Cin),  .Sum(S[0]), .Cout(C[0]));
    full_adder fa1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .Sum(S[1]), .Cout(C[1]));
    full_adder fa2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .Sum(S[2]), .Cout(C[2]));
    full_adder fa3 (.A(A[3]), .B(B[3]), .Cin(C[2]), .Sum(S[3]), .Cout(Cout));

    assign Sum = S;

endmodule

