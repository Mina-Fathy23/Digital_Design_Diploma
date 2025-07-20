module Param_Shift_Reg_tb();

// •LOAD_AVALUE = 2
// • LOAD_SVALUE = 4
// • SHIFT_DIRECTION = "LEFT"
// • SHIFT_WIDTH = 8

//Signals order: sclr, sset, shiftin, load, data, clock, enable, aclr, aset, shiftout, q
//Parameter order: parameter LOAD_AVLAUE , SHIFT_DIRECTION , LOAD_SVALUE, SHIFT_WIDTH

//Signal Stimulus singals
reg sclr_tb, sset_tb, shiftin_tb, load_tb, clock_tb, enable_tb, aclr_tb, aset_tb;
reg [7:0] data_tb;
wire shiftout_dut;
wire [7:0] q_dut;
//Simulation Expected output
reg shiftout_expected;
reg [7:0] q_expected;

Param_Shift_Reg #(.LOAD_AVLAUE(2),
                  .LOAD_SVALUE(4),
                  .SHIFT_DIRECTION("LEFT"),
                  .SHIFT_WIDTH(8)) DUT(sclr_tb, sset_tb, shiftin_tb, load_tb, data_tb, clock_tb, enable_tb, aclr_tb, aset_tb, shiftout_dut, q_dut);
initial begin
    clock_tb = 0;
    forever begin
        #1 clock_tb = ~clock_tb;
    end
end
initial begin
    //2.1 Verify Asynchronous Clear (aclr) Functionality
    aclr_tb = 1;
    aset_tb = 1;
    q_expected = 8'b0000_0000;
    repeat(50)begin

        sclr_tb = $random; 
        sset_tb = $random;
        shiftin_tb = $random;
        load_tb = $random;
        data_tb = $random;
        enable_tb = $random;
        @(negedge clock_tb);
        if(q_dut != q_expected) begin
        $display("Error in Asynchronous Clear (aclr)! Expected output:%d and Dut output: %d", q_expected, q_dut);
        $stop;
        end
    end
    //2.2Verify Asynchronous Set (aset) Functionality
    aclr_tb = 0;
    aset_tb = 1;
    q_expected = 2;

     repeat(50)begin
        sclr_tb = $random; 
        sset_tb = $random;
        shiftin_tb = $random;
        load_tb = $random;
        data_tb = $random;
        enable_tb = $random;
        @(negedge clock_tb);
        if(q_dut != q_expected) begin
        $display("Error in Asynchronous Set (aset)! Expected output:%d and Dut output: %d", q_expected, q_dut);
        $stop;
        end
     end

    //2.3 Verify Synchronous Clear (sclr) Functionality
    aclr_tb = 0;
    enable_tb = 1;
    sclr_tb = 1;
    sset_tb = 1;
   
     repeat(50)begin
        shiftin_tb = $random;
        load_tb = $random;
        data_tb = $random;
        @(negedge clock_tb);
        if(q_dut != q_expected) begin
        $display("Error in Synchronous Clear (sclr)! Expected output:%d and Dut output: %d", q_expected, q_dut);
        $stop;
        end
    end

    // 2.4 Verify Synchronous Set (sset) Functionality
    aclr_tb = 0;
    aset_tb = 0;
    sclr_tb = 0;
    enable_tb = 1;
    sset_tb = 1;
    q_expected = 4;

    repeat(50)begin
        shiftin_tb = $random;
        load_tb = $random;
        data_tb = $random;
        @(negedge clock_tb);
        if(q_dut != q_expected) begin
        $display("Error in Synchronous Set (sset)! Expected output:%d and Dut output: %d", q_expected, q_dut);
        $stop;
        end
    end
    // 2.5 Verify Load Functionality
    aclr_tb = 0;
    aset_tb = 0;
    sclr_tb = 0;
    sset_tb = 0;
    enable_tb = 1;
    load_tb = 1;

    repeat(50)begin
        shiftin_tb = $random;
        data_tb = $random;
        q_expected = data_tb;
        @(negedge clock_tb);
        if(q_dut != q_expected) begin
            $display("Error in Load Functionality! Expected output:%d and Dut output: %d", q_expected, q_dut);
            $stop;
        end
    end
    // 2.6 Verify Shifting Functionality
    aclr_tb = 0;
    aset_tb = 0;
    sclr_tb = 0;
    sset_tb = 0;
    load_tb = 0;
    enable_tb = 1;
    
    repeat(50)begin
        shiftin_tb = $random;
        data_tb = $random;
        @(negedge clock_tb);
        $display("Q_DUT: %b", q_dut);
    end
    $display("SUCCESS!! All test Passed!");
    $stop;
end
endmodule