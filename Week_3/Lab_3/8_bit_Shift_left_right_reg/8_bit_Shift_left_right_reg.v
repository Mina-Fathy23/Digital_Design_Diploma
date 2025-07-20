module Shift_right_left_reg_8bit(SI,clk, reset, LEFT_RIGHT, PO);

input  SI, clk, reset, LEFT_RIGHT;
output reg [7:0] PO;

always @(posedge clk, posedge reset) begin
    
    if(reset)begin
        PO <= 0;
    end
    else begin

        if(LEFT_RIGHT)begin 
            //shift right
            PO <= {SI, PO[7:1]};
        end
        else begin
            //shift left
            PO <= {PO[6:0], SI};
        end
    end
end

endmodule