vlib work
vlog Q5.v Q5_tb.v
vsim -voptargs=+acc work.FIFO_tb
add wave -position insertpoint  \
sim:/FIFO_tb/wen_a \
sim:/FIFO_tb/rst \
sim:/FIFO_tb/ren_b \
sim:/FIFO_tb/full_dut \
sim:/FIFO_tb/empty_dut \
sim:/FIFO_tb/dout_b_dut \
sim:/FIFO_tb/din_a \
sim:/FIFO_tb/CLK
add wave -position insertpoint  \
sim:/FIFO_tb/DUT/wr_ptr
add wave -position insertpoint  \
sim:/FIFO_tb/DUT/wr_loop
add wave -position insertpoint  \
sim:/FIFO_tb/DUT/rd_ptr
add wave -position insertpoint  \
sim:/FIFO_tb/DUT/rd_loop
add wave -position insertpoint  \
sim:/FIFO_tb/DUT/fifo
run -all