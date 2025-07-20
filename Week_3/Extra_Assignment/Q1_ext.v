module Sync_Counter_4bit(clk, set, out, div_2, div_4);

input clk, set;
output reg [3:0] out;
output div_2, div_4;

assign div_2 = out[0];
assign div_4 = out[1];

always @(posedge clk, negedge set) begin

    if(~set)begin

        out <= 4'b1111;
    end
    else begin
        out <= out + 1;
    end
    
end

endmodule