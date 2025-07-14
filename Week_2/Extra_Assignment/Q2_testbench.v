module Demux1x4_Testbench();

reg D_tb;
reg [1:0] S_tb;
reg [3:0] Y_expected;
wire [3:0] Y_dut;

Demux1x4 DUT(.D(D_tb), .S(S_tb), .Y(Y_dut));

integer i;

initial begin
    for(i = 0; i < 4; i = i + 1)begin

        S_tb = i;
        D_tb = 1;
        Y_expected = {3'b000, D_tb} << S_tb;
        #10;

        if(Y_dut != Y_expected)begin
            $display("Error ! - Incorrect Output");
            $stop;
        end
    end
    $display("Success ! - No Incorrect Output");
    $stop;

end

endmodule