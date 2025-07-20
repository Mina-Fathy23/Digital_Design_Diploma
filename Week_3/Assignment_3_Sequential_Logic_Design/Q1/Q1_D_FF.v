module D_FF(D, E, PRE_n, CLK, Q);

input D, E, PRE_n, CLK; 
output reg Q;

always @(posedge CLK, negedge PRE_n) begin
    
    if(~PRE_n)begin
        Q <= 1'b1; 
    end
    else if(E)begin
        Q <= D;
    end

end

endmodule