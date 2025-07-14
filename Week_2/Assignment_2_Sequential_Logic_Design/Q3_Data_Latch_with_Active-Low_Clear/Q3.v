module Latch_AL(D, G, CLR, Q);

input D, G, CLR;
output reg Q;

always @(*) begin

     if(~CLR)begin  // Active low clear
        Q <= 1'b0;
    end
    else if(G)begin // Enable signal
        Q <= D;
    end
    
    // If neither condition is met, Q preserves its previous value
end

endmodule