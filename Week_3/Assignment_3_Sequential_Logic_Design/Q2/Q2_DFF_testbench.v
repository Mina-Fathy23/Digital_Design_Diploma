module param_ff_d_tb();

reg d_tb, rstn_tb, clk_tb;
wire q_r_dut, qbar_r_dut, q_r_expected, qbar_r_expected;

Param_FF #(.FF_TYPE("DFF")) DUT(d_tb, rstn_tb, clk_tb, q_r_dut, qbar_r_dut);
D_FF Golden(d_tb, rstn_tb, clk_tb, q_r_expected, qbar_r_expected);

initial begin
    clk_tb = 0;
    forever
    #1 clk_tb = ~(clk_tb);
end

initial begin
    rstn_tb = 0;
    @(negedge clk_tb);
    rstn_tb = 1;

    repeat(100)begin

        d_tb = $random;
        rstn_tb = $random;

        @(negedge clk_tb);

        if(q_r_dut != q_r_expected && qbar_r_dut != qbar_r_expected)begin
            $display("Error! Expected output:%d and Dut output: %d", q_r_expected, q_r_dut);
            $stop;
        end
    end
    $display("Success, All outputs are Correct!");
    $stop;    
end
endmodule