module vending_machine_tb();

reg     D_in_tb;
reg     Q_in_tb; 
reg     clk_tb; 
reg     rst_tb; 
reg    dispense_expected;
reg    change_expected;

parameter WAIT = 2'b00;
parameter Q_25 = 2'b01;
parameter Q_50 = 2'b10;

wire    dispense_dut;
wire    change_dut;

vending_machine #(WAIT,Q_25,Q_50) DUT (D_in_tb, Q_in_tb, clk_tb, rst_tb, dispense_dut, change_dut);

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end

integer i;

initial begin
    rst_tb = 1;
    dispense_expected = 0;
    change_expected = 0;

    @(negedge clk_tb);
    if({dispense_dut, change_dut} != {dispense_expected, change_expected})begin

        $display("Error in RST Functionality Expected dispense:%d change:%d | DUT dispense:%d change:%d", 
                                    dispense_expected, change_expected, dispense_dut, change_dut);
        $stop;
    end

    rst_tb = 0;
    Q_in_tb = 0;

    repeat(20)begin

        D_in_tb = $random;
        if(D_in_tb == 1)begin
    
            dispense_expected = 1;
            change_expected = 1;
        end
        else begin

            dispense_expected = 0;
            change_expected = 0;
        end

        @(negedge clk_tb);
        if({dispense_dut, change_dut} != {dispense_expected, change_expected})begin

        $display("Error in D_in Functionality Expected dispense:%d change:%d | DUT dispense:%d change:%d", 
                                    dispense_expected, change_expected, dispense_dut, change_dut);
        $stop;
        end
    end

    D_in_tb = 0;
    change_expected = 0;
    dispense_expected = 0;
    @(negedge clk_tb);
    Q_in_tb = 1;
    
    for(i = 0; i < 30; i = i + 1)begin
        

        

        repeat(4)@(negedge clk_tb);
        // if({dispense_dut, change_dut} != {dispense_expected, change_expected})begin

        // $display("Error in D_in Functionality Expected dispense:%d change:%d | DUT dispense:%d change:%d", 
        //                             dispense_expected, change_expected, dispense_dut, change_dut);
        // $stop;
        // end

    end

    $display("All tests Passed!");
    $stop;

end

endmodule