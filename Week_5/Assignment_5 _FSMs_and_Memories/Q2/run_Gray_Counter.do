vlib work
vlog Gray_counter.v Q2.v Q2_tb.v
vsim -voptargs=+acc work.FSM_Gray_Counter_2B_tb	
add wave *
run -all
#quit -sim