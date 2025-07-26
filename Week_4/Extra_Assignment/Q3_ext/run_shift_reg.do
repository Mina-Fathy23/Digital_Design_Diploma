vlib work
vlog Q3.v Q3_tb_right_amount2.v Q3_tb_left_amount1.v
vsim -voptargs=+acc work.shift_register_right_amount2_tb	
add wave *
run -all
#quit -sim