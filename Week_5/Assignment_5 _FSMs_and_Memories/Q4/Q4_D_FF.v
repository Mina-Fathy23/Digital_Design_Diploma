module D_FF(D, rst, clk_en, CLK, Q);

parameter WIDTH = 1;
input rst, CLK, clk_en; 
input [WIDTH-1: 0] D;
output reg [WIDTH-1: 0] Q;

always @(posedge CLK) begin
    
    if(rst)begin
        Q <= 0; 
    end
    else if(clk_en) begin
        Q <= D;
    end

end

endmodule