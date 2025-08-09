vlib work
vlog single_port_RAM.v slave_ram_wrapper.v SPI_SLAVE.v SPI_tb.v
vsim -voptargs=+acc work.SPI_tb
add wave *
add wave -position insertpoint  \
sim:/SPI_tb/dut/ram_inst/mem
add wave -position insertpoint  \
sim:/SPI_tb/dut/spi_inst/bit_counter
run -all
#quit -sim