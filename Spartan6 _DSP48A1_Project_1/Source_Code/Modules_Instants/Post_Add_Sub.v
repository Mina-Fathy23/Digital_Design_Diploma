module Post_Add_Sub #(
    parameter WIDTH = 48, // Width of the input and output ports
    parameter RSTTYPE = "SYNC", // "SYNC" or "ASYNC"
    parameter REG_CIN = 1, // Registering the CIN
    parameter REG_COUT = 1, // Registering the Cout
    parameter REG_OUT = 1 // Registering the output
) (
    input [WIDTH-1:0]   mux_X_in1,
    input [WIDTH-1:0]   mux_X_in2,
    input [WIDTH-1:0]   mux_X_in3,
    // input [WIDTH-1:0]   mux_X_in4 = 0,
    input [1:0]         mux_X_sel,

    input [WIDTH-1:0]   mux_Z_in1,
    input [WIDTH-1:0]   mux_Z_in2,
    input [WIDTH-1:0]   mux_Z_in3,
    // input [WIDTH-1:0]   mux_Z_in4 = 0,
    input [1:0]         mux_Z_sel,
    input               cin,
    input               sel, // Select signal for addition or subtraction
    input               clk,
    input               clk_enable_carry, // Clock enable signals
    input               clk_enable_out, // Clock enable signals
    input               rst_carry,
    input               rst_out,
    output [WIDTH-1:0]  out,
    output              cout
);

// Internal signal for the registered input
wire [WIDTH-1:0] out_reg;
reg [WIDTH-1:0] mux_X_out;
reg [WIDTH-1:0] mux_Z_out;
wire             cin_reg;
wire             cout_reg;

//Instantiate the parameterized register module for in1 and in2
Param_Reg_2x1MUX #(.WIDTH(1),       .RSTTYPE(RSTTYPE),.REG(REG_CIN))  CYI  (cin, clk, clk_enable_carry, rst_carry, cin_reg);
Param_Reg_2x1MUX #(.WIDTH(1),       .RSTTYPE(RSTTYPE),.REG(REG_COUT)) CYO  (cout_reg, clk, clk_enable_carry, rst_carry, cout);
Param_Reg_2x1MUX #(.WIDTH(WIDTH),   .RSTTYPE(RSTTYPE),.REG(REG_OUT))  PREG (out_reg, clk, clk_enable_out, rst_out, out);

//MUX for X inputs
always @(mux_X_sel or mux_X_in1 or mux_X_in2 or mux_X_in3) begin

    case (mux_X_sel)
        2'b01: mux_X_out = mux_X_in1;
        2'b10: mux_X_out = mux_X_in2;
        2'b11: mux_X_out = mux_X_in3;
        default: mux_X_out = 0; // Default case to handle unexpected values
    endcase
    
end

//MUX for Z inputs
always @(mux_Z_sel or mux_Z_in1 or mux_Z_in2 or mux_Z_in3) begin

    case (mux_Z_sel)
        2'b01: mux_Z_out = mux_Z_in1;
        2'b10: mux_Z_out = mux_Z_in2;
        2'b11: mux_Z_out = mux_Z_in3;
        default: mux_Z_out = 0; // Default case to handle unexpected values
    endcase
    
end

//Adder LOGIC
assign {cout_reg, out_reg} = (sel) ? (mux_Z_out - (mux_X_out + cin_reg)) : (mux_Z_out + mux_X_out + cin_reg);
endmodule