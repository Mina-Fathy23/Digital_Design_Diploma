module MUX3x1_ds2(D0, D1, D2, Sel0, Sel1, out);

input D0, D1, D2, Sel0, Sel1;
output out;

assign out = ({Sel1, Sel0} === 2'b00)? D0:
             ({Sel1, Sel0} === 2'b01)? D1: D2;

endmodule