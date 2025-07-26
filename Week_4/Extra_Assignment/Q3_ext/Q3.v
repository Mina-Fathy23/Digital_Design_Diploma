module shift_register #(
    parameter SHIFT_DIRECTION = "LEFT",
    parameter SHIFT_AMOUNT = 1
) (
    input load,
    input [7:0] load_value,
    input clk,
    input rst,
    output reg [7:0] PO
);

always @(posedge clk, posedge rst) begin

    if(rst) begin
        PO <= 8'b0;
    end else if (load) begin
        PO <= load_value;
    end else begin
        if (SHIFT_DIRECTION == "LEFT") begin
            PO <= PO << SHIFT_AMOUNT;
        end else if (SHIFT_DIRECTION == "RIGHT") begin
            PO <= PO >> SHIFT_AMOUNT;
        end
    end
end
    
endmodule