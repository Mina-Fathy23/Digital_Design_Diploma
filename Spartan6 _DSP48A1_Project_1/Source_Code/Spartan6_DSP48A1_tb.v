module Spartan6_DSP48A1_tb(); 
parameter A0REG = 0;      
parameter A1REG = 1;
parameter B0REG = 0;
parameter B1REG = 1;
parameter CREG  = 1;      
parameter DREG  = 1; 
parameter MREG  = 1;
parameter PREG  = 1; 
parameter CARRYINREG  = 1;
parameter CARRYOUTREG = 1;
parameter OPMODEREG = 1;
parameter CARRYINSEL = "OPMODE5";   
parameter B_INPUT = "DIRECT";        
parameter RSTTYPE = "SYNC";

//stimulus and clock generation
 //Input Ports
reg  [17:0] A;
reg  [17:0] B;
reg  [47:0] C;
reg  [17:0] D;
reg  [17:0] BCIN;         //Cascade input for Port B
reg         CARRYIN;
//Control Ports
reg         CLK;          //DSP CLK
reg  [7:0]  OPMODE;       //Control input to select the arithmetic operations of the DSP48A1 slice.
//Clock Enable Input Ports
reg         CEA;          // Clock enable for the A port registers: (AOREG & A1REG)
reg         CEB;          // Clock enable for the B port registers: (BOREG & B1REG)
reg         CEC;          // Clock enable for the C port registers (CREG)
reg         CECARRYIN;    // Clock enable for the carry-in register (CYI) and the carry-out register (CYO)
reg         CED;          // Clock enable for the D port register (DREG)
reg         CEM;          // Clock enable for the multiplier register (MREG)
reg         CEOPMODE;     // Clock enable for the opmode register (OPMODEREG)
reg         CEP;           // Clock enable for the P output port registers (PREG = 1)
//Reset Input Ports: All the resets are active high reset.
reg         RSTA;         // Reset for the A registers: (AOREG & A1REG)
reg         RSTB;         // Reset for the B registers: (BOREG & B1REG)
reg         RSTC;         // Reset for the C registers (CREG)
reg         RSTCARRYIN;   // Reset for the carry-in register (CYI) and the carry-out register (CYO)
reg         RSTD;         // Reset for the D register (DREG)
reg         RSTM;         // Reset for the multiplier register (MREG)
reg         RSTOPMODE;    // Reset for the opmode register (OPMODEREG)
reg         RSTP;          // Reset for the P output registers (PREG = 1)

// Cascade Ports:
reg  [47:0] PCIN;
wire [17:0] BCOUT;         
wire [47:0] PCOUT;          

//Output Ports
wire [35:0] M;     
wire [47:0] P;            
wire        CARRYOUT;     
wire        CARRYOUTF;   


// Instantiate the DSP48A1 module
Spartan6_DSP48A1 #(
    .A0REG(A0REG),
    .A1REG(A1REG),
    .B0REG(B0REG),
    .B1REG(B1REG),
    .CREG(CREG),
    .DREG(DREG),
    .MREG(MREG),
    .PREG(PREG),
    .CARRYINREG(CARRYINREG),
    .CARRYOUTREG(CARRYOUTREG),
    .OPMODEREG(OPMODEREG),
    .CARRYINSEL(CARRYINSEL),
    .B_INPUT(B_INPUT),
    .RSTTYPE(RSTTYPE)
) dut (
    //Input Ports
    .A(A), 
    .B(B), 
    .C(C), 
    .D(D), 
    .BCIN(BCIN), 
    .CARRYIN(CARRYIN), 
    //Control Ports
    .CLK(CLK), 
    .OPMODE(OPMODE), 
    //Clock Enable Input Ports
    .CEA(CEA), 
    .CEB(CEB), 
    .CEC(CEC), 
    .CECARRYIN(CECARRYIN), 
    .CED(CED), 
    .CEM(CEM), 
    .CEOPMODE(CEOPMODE), 
    .CEP(CEP), 
    //Output Ports
    .M(M), 
    .P(P), 
    .CARRYOUT(CARRYOUT), 
    .CARRYOUTF(CARRYOUTF), 
    //Reset Input Ports
    .RSTA(RSTA), 
    .RSTB(RSTB), 
    .RSTC(RSTC), 
    .RSTCARRYIN(RSTCARRYIN), 
    .RSTD(RSTD), 
    .RSTM(RSTM), 
    .RSTOPMODE(RSTOPMODE), 
    .RSTP(RSTP), 

   // Cascade Ports:
   .BCOUT(BCOUT),
   .PCIN(PCIN),
   .PCOUT(PCOUT)
);

initial begin
    CLK = 0;
    forever
        #1 CLK = ~CLK;
end

initial begin
    // 2.1. Verify Reset Operation
    RSTA = 1; RSTB = 1; RSTC = 1; RSTD = 1; RSTM = 1; RSTP = 1; RSTCARRYIN = 1; RSTOPMODE = 1;
    A = $random;B = $random;C = $random;D = $random;CARRYIN = $random;OPMODE = $random;
    CEA = $random; CEB = $random; CEC = $random; CED = $random; CEM = $random; CEP = $random;
    CECARRYIN = $random; CEOPMODE = $random; PCIN = $random; BCIN = $random;

    repeat(10) begin
        @(negedge CLK);
        if(P != 48'h000000000000) begin
          $display("Test failed: in Reset");
          $stop;
        end    
    end
    RSTA = 0; RSTB = 0; RSTC = 0; RSTD = 0; RSTM = 0; RSTP = 0; RSTCARRYIN = 0; RSTOPMODE = 0;
    CEA = 1; CEB = 1; CEC = 1; CED = 1; CEM = 1; CEP = 1; CECARRYIN = 1; CEOPMODE = 1;

    
    // 2.2. Verify DSP Path 1 
    A = 20; B = 10; C = 350; D = 25;
    OPMODE = 8'b11011101;
    BCIN = $random; CARRYIN = 0; PCIN = $random;

    repeat(4)@(negedge CLK);
    if(BCOUT != 18'hF || M != 36'h12c || P != 48'h32 || PCOUT != 48'h32 ||  CARRYOUT != 0 || CARRYOUTF != 0) begin

        $display("Test failed: DSP Path 1");
        $stop;
    end

    
    // 2.3. Verify DSP Path 2
    A = 20; B = 10; C = 350; D = 25;
    OPMODE = 8'b00010000; 
    BCIN = $random; CARRYIN = 0; PCIN = $random;

    repeat(3)@(negedge CLK);
    if(BCOUT != 18'h23 || M != 36'h2BC || P != 48'h0 || PCOUT != 0 || CARRYOUT != 0 || CARRYOUTF != 0) begin
        $display("Test failed: DSP Path 2");
        $stop;
    end


    // 2.4. Verify DSP Path 3 
    A = 20; B = 10; C = 350; D = 25;
    OPMODE = 8'b00001010;
    BCIN = $random; CARRYIN = 0; PCIN = $random;
    
    repeat(3)@(negedge CLK);
    if(BCOUT != 18'ha || M != 36'hc8 || P != 48'h0 || PCOUT != 0 || CARRYOUT != 0 || CARRYOUTF != 0) begin
        $display("Test failed: DSP Path 3");
        $stop;
    end

    // 2.5. Verify DSP Path 4 
    A = 5; B = 6; C = 350; D = 25; PCIN = 3000;
    OPMODE = 8'b10100111;
    BCIN = $random; CARRYIN = 0; 

    repeat(3)@(negedge CLK);
    if(BCOUT != 18'h6 || M != 36'h1e || P != 48'hfe6fffec0bb1 || PCOUT != 48'hfe6fffec0bb1 || CARRYOUT != 1 || CARRYOUTF != 1) begin
        $display("Test failed: DSP Path 4");
        $stop;
    end

    $display("ALL TESTS PASSED");
    $stop;

end 
endmodule