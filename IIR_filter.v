﻿`timescale 1ns / 1ps

module IIR_filter(clk,rst,a,x,y);
input clk,rst; input [3:0]a,x;
output [3:0]y;
reg [3:0] y_val;//register to store intermediate value of 
y wire [7:0] baugh_prod_actual;//BW multiplier product 
baugh_mult bm1(.a(a), .b(y_val), .p(baugh_prod_actual)); 
always@(posedge clk,rst,x,a)
begin
if (rst) begin
y_val <= x;
end
else begin
y_val<= x + booth_prod_actual[3:0];
end
end
assign y = y_val;
endmodule
