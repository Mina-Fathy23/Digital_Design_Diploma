module Param_Reg_2x1MUX #(
    parameter WIDTH = 2,
    parameter RSTTYPE = "SYNC", // "SYNC" or "ASYNC"
    parameter REG = 1
) (
    input  [WIDTH-1:0] in,
    input              clk,
    input              clk_enable, // Clock enable signal
    input              rst,
    output reg [WIDTH-1:0] out
);
//Registering the first input based on the reset type
generate
    if(REG == 0) begin
        always @(in) begin
            out = in;
            
        end
    end else begin
        if (RSTTYPE == "ASYNC") begin
            always @(posedge clk or posedge rst) begin
                if (rst) begin
                    out <= {WIDTH{1'b0}};
                end else if(clk_enable)begin
                    out <= in;
                end
            end
        end else if (RSTTYPE == "SYNC") begin
            always @(posedge clk) begin
                if (rst) begin
                    out <= {WIDTH{1'b0}};
                end else if(clk_enable)begin
                    out <= in;
                end
            end
        end
    end
endgenerate

endmodule
