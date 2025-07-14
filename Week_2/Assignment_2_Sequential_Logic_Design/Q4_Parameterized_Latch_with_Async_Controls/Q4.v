module Latch_2_Ctrl(aset, data, gate, aclr, q);

parameter LAT_WIDTH = 1; // Default size of the latch
input aset, gate, aclr;
input [LAT_WIDTH-1:0] data;
output reg [LAT_WIDTH-1:0] q;

always @(*) begin

    if(aclr)begin
        q <= {LAT_WIDTH{1'b0}};
    end
    else if(aset)begin
        q <= {LAT_WIDTH{1'b1}};
    end
    else if(gate)begin
        q <= data;
    end
    
end

endmodule