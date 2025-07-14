module testbench_Gray();

reg [2:0] A_tb; // 3-bit input
reg [6:0] B_expected;
wire [6:0] B_dut; // 7-bit output from DUT

Gray_Hot_Encoder #(.USE_GRAY(1)) DUT(A_tb, B_dut);

integer i;

initial begin

    for(i = 0; i < 8; i = i +1)begin

        A_tb = i;
        B_expected[2] = A_tb[2];
        B_expected[1] = A_tb[2] ^ A_tb[1];
        B_expected[0] = A_tb[1] ^ A_tb[0];
        B_expected[6:3] = 3'b000; // Unused bits for Gray code
        #10;

        if(B_dut != B_expected)begin
            $display("Error - Incorrect Gray code output");
            $stop;
        end
    end

    $display("Successfull - All outputs are correct");
    $stop;

end
endmodule