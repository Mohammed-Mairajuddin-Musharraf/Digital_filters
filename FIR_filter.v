`timescale 1ns/1ps
module fir_3tap(input Clk,input [7:0] Xin,input [7:0] H0 ,input [7:0] H1,input [7:0] H2,output reg [15:0] Yout);
wire [15:0] MO,M1, M2,add_out1,add_out2;
wire [15:0] Q1,Q2;
//Braun Multiplier instantiation
braun_multiplier
m1(.a(Xin),.b(H2),.prod(M2));
braun_multiplier
m2(.a(Xin),.b(H1),.prod(M1));
braun_multiplier
m3(.a(Xin),.b(HO),.prod(MO));
//adders
RCA 16bit r1(.sum(add_out1),.a(Q1),.b(M1)); RCA 16bit r2(.sum(add_out2),.a(Q2),.b(MO));
//flip-flop instantiations (for introducing a delay).
DFF dff1 (.CIK(CIK),.D(M2),.Q(Q1));
DFF dff2 (.Clk(Clk),.D(add_out1),.Q(Q2)); //Assign the last adder output to final output. 
always@ (posedge Clk)
Yout <= add_out2;
endmodule
