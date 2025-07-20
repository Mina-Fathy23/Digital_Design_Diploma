vlib work
vlog D_FF.v Q1_testbench.v
vsim -voptargs=+acc work.d_ff_tb	
add wave *
run -all
#quit -sim