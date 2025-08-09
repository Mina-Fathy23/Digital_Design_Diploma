module Control_Unit_tb();

reg [7:0] speed_limit;
reg [7:0] car_speed;
reg [6:0] leading_distance;
reg       CLK;
reg       rst;
wire      unlock_doors_dut;
wire      accelerate_car_dut;
reg       unlock_doors_expected;
reg       accelerate_car_expected;

Control_Unit dut (
    .speed_limit(speed_limit),
    .car_speed(car_speed),
    .leading_distance(leading_distance),
    .CLK(CLK),
    .rst(rst),
    .unlock_doors(unlock_doors_dut),
    .accelerate_car(accelerate_car_dut)
);

initial begin
    CLK = 0;
    forever
        #1 CLK = ~CLK;
end

integer i;
initial begin
    rst = 1;
    unlock_doors_expected = 1;
    accelerate_car_expected = 0;
    @(negedge CLK);
    if(unlock_doors_dut !== unlock_doors_expected || accelerate_car_dut !== accelerate_car_expected) begin
        $display("Test failed at reset: unlock_doors=%b, accelerate_car=%b", unlock_doors_dut, accelerate_car_dut);
    end

    rst = 0;
    speed_limit = 8'd60; // 60 km/h
    car_speed = 8'd0; // 0 km/h
    leading_distance = 7'd70; // 70 meters
    for(i = 0; i < 20; i = i + 1)begin

        if(car_speed < speed_limit || leading_distance >= 40) begin
            car_speed = car_speed + 8'd10; // Increase speed by 10 km/h
            leading_distance = leading_distance - 7'd5; // Decrease distance by 5 meters
        end
        else begin
            car_speed = car_speed - 8'd30; // Decrease speed by 10 km/h
            leading_distance = leading_distance + 7'd15; // Increase distance by 5 meters
        end
        @(negedge CLK);
    end
    $stop;

end

endmodule