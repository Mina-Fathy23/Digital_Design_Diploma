vlib work
vlog Q5_a.v Q5_b.v Q5_c.v Q2_TFF_testbench.v
vsim -voptargs=+acc work.param_ff_t_tb	
add wave *
run -all
#quit -sim