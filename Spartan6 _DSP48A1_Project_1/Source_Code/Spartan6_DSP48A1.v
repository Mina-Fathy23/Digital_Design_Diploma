module Spartan6_DSP48A1 #(
    parameter A0REG = 0,      //define the number of pipeline registers in the A and B input paths.
    parameter A1REG = 1,
    parameter B0REG = 0,
    parameter B1REG = 1,
    parameter CREG  = 1,      //value of 0 or 1. The number defines the snumber of pipeline stages. Default: 1 (registered)
    parameter DREG  = 1, 
    parameter MREG  = 1,
    parameter PREG  = 1, 
    parameter CARRYINREG  = 1,
    parameter CARRYOUTREG = 1,
    parameter OPMODEREG = 1,
    parameter CARRYINSEL = "OPMODE5",      /*used in the carry cascade input, either
                                the CARRYIN input will be considered or the value of opcode[5]. This
                                attribute can be set to the string CARRYIN or OPMODE5. Default:
                                OPMODE5. Tie the output of the mux to 0 if none of these string
                                values exist.*/
    parameter B_INPUT = "DIRECT",         /*The B_INPUT attribute defines whether the input to the B port is
                                routed from the B input (attribute = DIRECT) or the cascaded input
                                (BCIN) from the previous DSP48A1 slice (attribute = CASCADE).
                                Default: DIRECT. Tie the output of the mux to 0 if none of these string
                                values exist.*/
    parameter RSTTYPE = "SYNC"           /*The RSTTYPE attribute defines the type of reset used in the DSP48A1 slice.
                                The value can be either SYNC or ASYNC. Default: SYNC.*/
) (
    //Input Ports
    input  [17:0] A,
    input  [17:0] B,
    input  [47:0] C,
    input  [17:0] D,
    input  [17:0] BCIN,         //Cascade input for Port B
    input         CARRYIN,
    //Control Ports
    input         CLK,          //DSP CLK
    input  [7:0]  OPMODE,       //Control input to select the arithmetic operations of the DSP48A1 slice.
    //Clock Enable Input Ports
    input         CEA,          // Clock enable for the A port registers: (AOREG & A1REG)
    input         CEB,          // Clock enable for the B port registers: (BOREG & B1REG)
    input         CEC,          // Clock enable for the C port registers (CREG)
    input         CECARRYIN,    // Clock enable for the carry-in register (CYI) and the carry-out register (CYO)
    input         CED,          // Clock enable for the D port register (DREG)
    input         CEM,          // Clock enable for the multiplier register (MREG)
    input         CEOPMODE,     // Clock enable for the opmode register (OPMODEREG)
    input         CEP,           // Clock enable for the P output port registers (PREG = 1)
    //Output Ports
    output [35:0] M,            /*multiplier data output, It is either the output of the M register (MREG = 1) 
                                or the direct output of the multiplier (MREG = 0).*/
    output [47:0] P,            /*Primary data output from the post-adder/subtracter. It is either the 
                                output of the P register (PREG = 1) or the direct output of the post-adder/subtracter (PREG = 0).*/
    output        CARRYOUT,     /*It can be registered in (CARRYOUTREG = 1) or unregistered (CARRYOUTREG = 0).
                                This output is to be connected only to CARRYIN of adjacent DSP48A1 if multiple DSP blocks are used.*/
    output        CARRYOUTF,    //copy of the CARRYOUT signal that can be routed to the user logic.

    //Reset Input Ports: All the resets are active high reset.
    input         RSTA,         // Reset for the A registers: (AOREG & A1REG)
    input         RSTB,         // Reset for the B registers: (BOREG & B1REG)
    input         RSTC,         // Reset for the C registers (CREG)
    input         RSTCARRYIN,   // Reset for the carry-in register (CYI) and the carry-out register (CYO)
    input         RSTD,         // Reset for the D register (DREG)
    input         RSTM,         // Reset for the multiplier register (MREG)
    input         RSTOPMODE,    // Reset for the opmode register (OPMODEREG)
    input         RSTP,          // Reset for the P output registers (PREG = 1)
    // Cascade Ports:
    output [17:0] BCOUT,         //Cascade output for Port B
    input  [47:0] PCIN,          //Cascade input for Port P
    output [47:0] PCOUT          //Cascade output for Port P
);

//=========================================================================================================================
//--------------------------------------------Stage 1:  A, B, C, D, and pre_Add_Sub---------------------------------------
//=========================================================================================================================
/*Inputs: A, B, C, D, BCIN, OPMODE[6], OPMODE[4]
Outputs:  A_reg, C_reg, D_reg, B_bypass_mux_out
*/

//B, D, pre_add_sub
wire [17:0] pre_adder_out;
wire [17:0] D_reg;
wire [17:0] B0_reg;
wire [17:0] B_bypass_mux_out;
//input A, C
wire [17:0] A0_reg;
wire [47:0] C_reg;
//OPMODE
wire [7:0] OPMODE_reg;

Param_Reg_2x1MUX #(.WIDTH(8), .RSTTYPE(RSTTYPE), .REG(OPMODEREG)) OPMODE_reg_mux (.in(OPMODE), .clk(CLK), .clk_enable(CEOPMODE), .rst(RSTOPMODE), .out(OPMODE_reg));

wire [17:0] B_temp;

generate
    if(B_INPUT == "DIRECT")
        assign B_temp = B;
    else if(B_INPUT == "CASCADE")
        assign B_temp = BCIN;
    else
        assign B_temp = 0; // Default value if neither DIRECT nor CASCADE is selected
endgenerate

Param_Reg_2x1MUX #(.WIDTH(18), .RSTTYPE(RSTTYPE), .REG(DREG))  D_reg_mux     (.in(D),      .clk(CLK), .clk_enable(CED), .rst(RSTD), .out(D_reg));
Param_Reg_2x1MUX #(.WIDTH(18), .RSTTYPE(RSTTYPE), .REG(B0REG)) B0REG_reg_mux (.in(B_temp), .clk(CLK), .clk_enable(CEB), .rst(RSTB), .out(B0_reg));
Param_Reg_2x1MUX #(.WIDTH(18), .RSTTYPE(RSTTYPE), .REG(A0REG)) A0REG_reg_mux (.in(A),      .clk(CLK), .clk_enable(CEA), .rst(RSTA), .out(A0_reg));
Param_Reg_2x1MUX #(.WIDTH(48), .RSTTYPE(RSTTYPE), .REG(CREG))  CREG_reg_mux  (.in(C),      .clk(CLK), .clk_enable(CEC), .rst(RSTC), .out(C_reg));

Pre_Add_Sub #(.WIDTH(18)) pre_add_sub (.in1(D_reg), .in2(B0_reg), .sel(OPMODE_reg[6]), .out(pre_adder_out));


assign B_bypass_mux_out = (OPMODE_reg[4]) ? pre_adder_out : B0_reg; // MUX for pre_add_sub output



//=========================================================================================================================
//--------------------------------------------Stage 2: Multiplier-------------------------------------------------
//=========================================================================================================================
/*
Inputs: A_reg, D_reg, B_bypass_mux_out
Outputs:  BCOUT, M, D:A:B Cont
*/

wire [47:0] D_A_B_cont; // D:A:B Cont
wire [17:0] B1_reg;
wire [17:0] A1_reg;


//Multiplier
Param_Reg_2x1MUX #(.WIDTH(18), .RSTTYPE(RSTTYPE), .REG(B1REG))  B1REG_reg_mux (.in(B_bypass_mux_out), .clk(CLK), .clk_enable(CEB), .rst(RSTB), .out(B1_reg));
Param_Reg_2x1MUX #(.WIDTH(18), .RSTTYPE(RSTTYPE), .REG(A1REG))  A1REG_reg_mux (.in(A0_reg), .clk(CLK), .clk_enable(CEA), .rst(RSTA), .out(A1_reg));
MUL #(.WIDTH(18), .RSTTYPE(RSTTYPE), .REG_OUT(MREG)) mul (
    .in1(B1_reg),
    .in2(A1_reg),
    .clk(CLK),
    .clk_enable_out(CEM), // Clock enable signals for output
    .rst_out(RSTM),
    .out(M)
);

assign BCOUT = B1_reg; // B input registered output
assign D_A_B_cont = {D_reg[11:0], A1_reg, B1_reg}; // D:A:B Cont output

//=========================================================================================================================
//--------------------------------------------Stage 3: Post Add/Sub-------------------------------------------------
//=========================================================================================================================

/*Inputs: C_reg, M, D:A:B Cont, PCIN, CARRYIN, opmode[3:0], opmode[5], opmode[7]
Outputs:  P, CARRYOUT, PCOUT, CARRYOUTF
*/
wire [47:0] M_extended; // Extended M output
//Post Add/Sub

 wire cin_temp;

generate

    if(CARRYINSEL == "CARRYIN")
        assign cin_temp = CARRYIN;
    else if(CARRYINSEL == "OPMODE5")
        assign cin_temp = OPMODE_reg[5];
    else
        assign cin_temp = 0; // Default value if neither CARRYIN nor OPMODE5 is selected
endgenerate

assign M_extended = { 12'b0, M}; // Extend M to match the width of P

Post_Add_Sub #(
        .WIDTH(48), 
        .RSTTYPE(RSTTYPE), 
        .REG_CIN(CARRYINREG), 
        .REG_COUT(CARRYOUTREG), 
        .REG_OUT(PREG)
        ) post_add_sub (
        .mux_X_in1(M_extended), // D:A:B Cont
        .mux_X_in2(P),
        .mux_X_in3(D_A_B_cont),
        .mux_X_sel(OPMODE_reg[1:0]), // Select signal for MUX X inputs
        .mux_Z_in1(PCIN),
        .mux_Z_in2(P),
        .mux_Z_in3(C_reg),
        .mux_Z_sel(OPMODE_reg[3:2]), // Select signal for MUX Z inputs
        .cin(cin_temp),
        .sel(OPMODE_reg[7]), // Select signal for addition or subtraction
        .clk(CLK),
        .clk_enable_carry(CECARRYIN), // Clock enable signals for carry-in and carry-out
        .clk_enable_out(CEP), // Clock enable signals for output
        .rst_carry(RSTCARRYIN),
        .rst_out(RSTP),
        .out(P),
        .cout(CARRYOUT)
        );

assign CARRYOUTF = CARRYOUT; // Copy of the CARRYOUT signal that can be routed to the user logic
assign PCOUT = P; // Cascade output for Port P

endmodule