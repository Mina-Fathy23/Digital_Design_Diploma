vlib work
vlog Q1.v Q1_D_FF.v Q1_tb.v
vsim -voptargs=+acc work.ALSU_tb	
add wave *
run -all
#quit -sim