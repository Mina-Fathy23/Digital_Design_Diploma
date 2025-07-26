module D_FF_set(D, set, CLK, Q);

parameter WIDTH = 1;
input set, CLK; 
input [WIDTH-1: 0] D;
output reg [WIDTH-1: 0] Q;

always @(posedge CLK, posedge set) begin
    
    if(set)begin
        Q <= 1; 
    end
    else begin
        Q <= D;
    end

end

endmodule