module LogicMux(A, B, C, D, E, F, sel, out, outbar);

input A, B, C, D, E, F, sel;
output out, outbar;
wire t1, t2;

assign t1 = (A & B & C);
assign t2 = ~(D ^ E ^ F);
assign out = (sel == 1) ? t2 : t1;
assign outbar = ~out;

endmodule