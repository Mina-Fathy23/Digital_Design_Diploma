module DSP48A1_S_tb();
reg[17:0]  A_tb;
reg[17:0]  B_tb;
reg[47:0]  C_tb;
reg[17:0]  D_tb;
reg[47:0] P_expected;
reg clk_tb, rst_n_tb;

wire [47:0] P_dut;

DSP48A1_S DUT(A_tb, B_tb, C_tb, D_tb, clk_tb, rst_n_tb, P_dut);

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end

initial begin
    rst_n_tb = 0;
    P_expected = 0;
    repeat(4)@(negedge clk_tb);

    if(P_dut != P_expected) begin

        $display("Error in Synchronous rst_n Expected: out:%d | DUT: out:%d", P_expected, P_dut);
        $stop;
    end
    rst_n_tb = 1;
    A_tb = 10;
    B_tb = 11;
    C_tb = 12;
    D_tb = 13;
    P_expected = ((B_tb + D_tb) * A_tb) + C_tb;
    repeat(4)@(negedge clk_tb);
     if(P_dut != P_expected) begin

        $display("Error in Functionality Expected: out:%d | DUT: out:%d", P_expected, P_dut);
        $stop;
    end
    A_tb = 100;
    B_tb = 111;
    C_tb = 112;
    D_tb = 113;
    P_expected = ((B_tb + D_tb) * A_tb) + C_tb;
    repeat(4)@(negedge clk_tb);
     if(P_dut != P_expected) begin

        $display("Error in Functionality Expected: out:%d | DUT: out:%d", P_expected, P_dut);
        $stop;
    end
    $display("All tests passed");
    $stop;
end
endmodule