vlib work
vlog Spartan6_DSP48A1.v Spartan6_DSP48A1_tb.v Mul.v Param_4x1MUX.v Param_Reg_2x1MUX.v Post_Add_Sub.v Pre_Add_Sub.v
vsim -voptargs=+acc work.Spartan6_DSP48A1_tb	
add wave *
run -all
#quit -sim