module LFSR(clk, rst, set, out);

input clk, rst, set;
output [3:0] out;

wire xor_out;
wire Q1, Q2, Q3, Q4;

D_FF_set FF1 (Q4, set, clk, Q1);
D_FF_rst FF2 (xor_out, rst, clk, Q2);
D_FF_rst FF3 (Q2, rst, clk, Q3);
D_FF_rst FF4 (Q3, rst, clk, Q4);

assign xor_out = Q4 ^ Q1;
assign out = {Q4, Q3, Q2, Q1};

endmodule