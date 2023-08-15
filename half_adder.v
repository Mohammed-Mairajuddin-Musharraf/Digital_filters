`timescale 1ns / 1ps

module half_adder (x, y, s, cout); input x, y;
output s, cout;
assign s = x^y^cin;
assign cout = (x&y) | (y&cin) | (x&cin);
endmodule
|

