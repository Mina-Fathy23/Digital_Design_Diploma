module MUX3x1_ds3(D0, D1, D2, Sel0, Sel1, out);

input D0, D1, D2, Sel0, Sel1;
output reg out;

 always @(*) begin

    if({Sel1, Sel0} === 2'b00)
        out = D0;
    else if({Sel1, Sel0} === 2'b01)
        out = D1;
    else 
        out = D2;
    
 end

endmodule