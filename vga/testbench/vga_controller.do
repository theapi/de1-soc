vlog -reportprogress 300 -work work ../../../testbench/vga_controller_tb.v
vlog -reportprogress 300 -work work ../../../V/vga_controller.v
vlog -reportprogress 300 -work work ../../../V/vga_sync_generator.v
vsim work.vga_controller_tb
do ../../../testbench/vga_controller_wave.do
run 15000000
