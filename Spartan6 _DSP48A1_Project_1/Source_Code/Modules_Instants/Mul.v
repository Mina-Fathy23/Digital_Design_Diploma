module MUL #(
    parameter   WIDTH = 18,
    localparam  OUT_WIDTH = 2* WIDTH,
    parameter   RSTTYPE = "SYNC", // "SYNC" or "ASYNC"
    parameter   REG_OUT = 1 // Registering the output
) (
    input [WIDTH-1:0]       in1,
    input [WIDTH-1:0]       in2,
    input                   clk,
    input                   clk_enable_out, // Clock enable signals
    input                   rst_out,
    output [OUT_WIDTH-1:0]  out
);

// Internal signal for the registered input
wire [OUT_WIDTH-1:0]  out_reg;

//Instantiate the parameterized register module for in1 and in2
Param_Reg_2x1MUX #(.WIDTH(OUT_WIDTH),   .RSTTYPE(RSTTYPE), .REG(REG_OUT)) MREG  (out_reg, clk, clk_enable_out, rst_out, out);

assign out_reg = in1 * in2;
    
    
endmodule