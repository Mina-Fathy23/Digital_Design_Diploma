module d_ff_tb();

reg D_tb, E_tb, PRE_n_tb, CLK_tb, Q_expected;
wire Q_dut;

D_FF DUT(D_tb, E_tb, PRE_n_tb, CLK_tb, Q_dut);

initial begin
    CLK_tb = 0;
    forever
     #1  CLK_tb = ~CLK_tb;
end

initial begin
    PRE_n_tb = 0;
    @(negedge CLK_tb);
    PRE_n_tb = 1;

    repeat(100)begin
        E_tb = $random;
        D_tb = $random;
        if(E_tb)
            Q_expected = D_tb;

        @(negedge CLK_tb);

        if(Q_dut != Q_expected) begin

            $display("Error! Expected output:%d and Dut output: %d", Q_expected, Q_dut);
            $stop;
        end
       
    end
    $display("Success, All outputs are Correct!");
    $stop;
end
endmodule