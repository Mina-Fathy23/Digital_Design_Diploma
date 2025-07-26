vlib work
vlog Q3.v Q3_N_bit_up_Counter.v Q3_tb.v
vsim -voptargs=+acc work.TDM_tb	
add wave *
run -all
#quit -sim