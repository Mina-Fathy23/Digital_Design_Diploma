module Ripple_counter_4bit(Clk, Rstn, Out);

input Clk, Rstn;
output [3:0] Out;

wire qn0, qn1, qn2, qn3;
wire q0, q1, q2, q3;

//D_FF_2(d, rstn, clk, q_r, qbar_r);
D_FF_2 ff1(qn0, Rstn, Clk, q0, qn0);
D_FF_2 ff2(qn1, Rstn,  q0, q1, qn1);
D_FF_2 ff3(qn2, Rstn,  q1, q2, qn2);
D_FF_2 ff4(qn3, Rstn,  q2, q3, qn3);

assign Out = {qn3, qn2, qn1, qn0};

endmodule