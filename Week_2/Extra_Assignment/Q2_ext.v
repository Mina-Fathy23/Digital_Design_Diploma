module Demux1x4(D, S, Y);

input D;
input [1:0] S;
output [3:0] Y;

assign Y = {3'b000, D} << S;

endmodule