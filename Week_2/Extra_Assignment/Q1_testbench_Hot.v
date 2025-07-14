module testbench_Hot();

reg [2:0] A_tb;
reg [6:0] B_expected;
wire [6:0] B_dut;

Gray_Hot_Encoder #(.USE_GRAY(0)) DUT(A_tb, B_dut);

integer i;

initial begin
    for(i = 0; i < 8; i = i +1)begin
        A_tb = i;
        if(A_tb == 0)
            B_expected = 7'b000_0000;
        else
            B_expected = 7'b000_0001 << (A_tb - 1);

        #10;

         if(B_dut != B_expected)begin
            $display("Error! - Incorrect Output");
            $stop;
         end
    end

    $display("Success ! - No Incorrect Output");
    $stop;
end

endmodule