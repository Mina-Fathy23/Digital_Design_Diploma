module ALSU_tb();

reg [2:0]  A_tb;
reg [2:0]  B_tb;
reg        clk_tb;
reg        rst_tb;
reg        cin_tb;           //only valid to be used if the parameter FULL_ADDER is 'ON'
reg        serial_in_tb;     //Used only in shift operation
reg        red_op_A_tb;      //When High, Inditacted a reduction operation on A instead of A and B when OPCODE is AND or XOR
reg        red_op_B_tb;      //When High, Inditacted a reduction operation on B instead of A and B when OPCODE is AND or XOR
reg [2:0]  opcode_tb; 
reg        bypass_A_tb;      //When High, Port A is registered to the output ignoring opcode operation 
reg        bypass_B_tb;      //When High, Port B is registered to the output ignoring opcode operation 
reg        direction_tb;     //When High, Shifting to Left, otherwise it's right
reg [15:0] leds_expected; 
reg [5:0]  out_expected; 

wire [15:0]leds_dut;        //Blinks with every clk cycle in case of invalid operation
wire [5:0]  out_dut;        //Output of ALSU

ALSU DUT(
    .A(A_tb),
    .B(B_tb),
    .clk(clk_tb),
    .rst(rst_tb),
    .cin(cin_tb),
    .serial_in(serial_in_tb),
    .red_op_A(red_op_A_tb),
    .red_op_B(red_op_B_tb),
    .opcode(opcode_tb),
    .bypass_A(bypass_A_tb),
    .bypass_B(bypass_B_tb),
    .direction(direction_tb),
    .leds(leds_dut),
    .out(out_dut)
);

integer i;

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end

initial begin
    //2.1 Verify Asynchronous rst Functionality
    rst_tb =1;
    leds_expected = 0;
    out_expected =0;
    A_tb = 0;
    B_tb = 0;
    cin_tb = 0;
    serial_in_tb = 0;
    red_op_A_tb = 0;
    red_op_B_tb = 0;
    opcode_tb = 0;
    bypass_A_tb = 0;
    bypass_B_tb = 0;
    direction_tb = 0;
    @(negedge clk_tb);
    if(leds_dut != leds_expected || out_dut != out_expected)begin
        $display("Error in Asynchronous rst Expected: led:%d out:%d | DUT: led:%d out:%d", leds_expected, out_expected, leds_dut, out_dut);
        $stop;
    end

    //2.2 Verify Bypass Functionality
    rst_tb = 0;
    bypass_A_tb = 1;
    bypass_B_tb = 1;

    for(i= 0; i < 10; i = i + 1)begin

        A_tb = $random;
        B_tb = $random;
        opcode_tb = $urandom_range(0,5);

        out_expected = A_tb; //As Priority parameter didn't change and by default equals "A"
        repeat(2)@(negedge clk_tb);
        if(out_dut != out_expected)begin
            $display("Error in Bypass Functionality I:%d Expected: out:%d | DUT: out:%d",  i, out_expected, out_dut);
            $stop;
        end
    end

    //2.3 Verify opcode 0 Functionality
    bypass_A_tb = 0;
    bypass_B_tb = 0;
    opcode_tb = 0;

    for(i= 0; i < 10; i = i + 1)begin

        A_tb = $random;
        B_tb = $random;
        red_op_A_tb = $random;
        red_op_B_tb = $random;

        out_expected = red_op_A_tb ? &(A_tb) : 
                       red_op_B_tb ? &(B_tb) : A_tb & B_tb;

        repeat(2)@(negedge clk_tb);
        if(out_dut != out_expected)begin
            $display("Error in opcode 0 Functionality I:%d Expected: out:%d | DUT: out:%d",  i, out_expected, out_dut);
            $stop;
        end
    end

    //2.4 Verify opcode 1 Functionality
    opcode_tb = 1;

    for(i= 0; i < 10; i = i + 1)begin

        A_tb = $random;
        B_tb = $random;
        red_op_A_tb = $random;
        red_op_B_tb = $random;

        out_expected = red_op_A_tb ? ^(A_tb) : 
                       red_op_B_tb ? ^(B_tb) : A_tb ^ B_tb;

        repeat(2)@(negedge clk_tb);
        if(out_dut != out_expected)begin
            $display("Error in opcode 1 Functionality I:%d Expected: out:%d | DUT: out:%d",  i, out_expected, out_dut);
            $stop;
        end
    end

    //2.5 Verify opcode 2 Functionality
    opcode_tb = 2;
    red_op_A_tb = 0;
    red_op_B_tb = 0;
    for(i= 0; i < 10; i = i + 1)begin

        A_tb = $random;
        B_tb = $random;
        cin_tb = $random;

        out_expected = A_tb + B_tb + cin_tb;

        repeat(2)@(negedge clk_tb);
        if(out_dut != out_expected)begin
            $display("Error in opcode 2 Functionality I:%d Expected: out:%d | DUT: out:%d",  i, out_expected, out_dut);
            $stop;
        end
    end
    //2.6 Verify opcode 3 Functionality
    opcode_tb = 3;
    for(i= 0; i < 10; i = i + 1)begin

        A_tb = $random;
        B_tb = $random;

        out_expected = A_tb * B_tb;

        repeat(2)@(negedge clk_tb);
        if(out_dut != out_expected)begin
            $display("Error in opcode 3 Functionality I:%d Expected: out:%d | DUT: out:%d",  i, out_expected, out_dut);
            $stop;
        end
    end
    //2.7 Verify opcode 4 Functionality
    opcode_tb = 4;

    for(i= 0; i < 10; i = i + 1)begin

        A_tb = $random;
        B_tb = $random;
        serial_in_tb = $random;
        direction_tb = $random;
        repeat(2)@(negedge clk_tb);
    end
    //2.8 Verify opcode 5 Functionality
    opcode_tb = 5;
    for(i= 0; i < 10; i = i + 1)begin
        A_tb = $random;
        B_tb = $random;
        serial_in_tb = $random;
        direction_tb = $random;
        repeat(2)@(negedge clk_tb);
    end
    $stop;
end
 

endmodule