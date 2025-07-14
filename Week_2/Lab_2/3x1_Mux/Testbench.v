module testbench();

reg D0_tb, D1_tb, D2_tb, Sel0_tb, Sel1_tb;
wire out_dut, out_expected;

MUX3x1_ds2 Golden(D0_tb, D1_tb, D2_tb, Sel0_tb, Sel1_tb, out_expected);
MUX3x1_ds3 DUT(D0_tb, D1_tb, D2_tb, Sel0_tb, Sel1_tb, out_dut);

initial begin

    repeat(100)begin
        D0_tb    = $random;
        D1_tb    = $random;
        D2_tb    = $random;
        Sel0_tb  = $random;
        Sel1_tb  = $random;
        #10;

        if(out_dut != out_expected) begin
        $display("Error - Mux output is incorrect");
        $stop;
        
        end
    end
     $display("Successful - No Incorrect Outputs");
     $stop;

end
endmodule