vlib work
vlog Q2.v Q2_D_FF.v Q2_tb.v
vsim -voptargs=+acc work.DSP48A1_S_tb	
add wave *
run -all
#quit -sim