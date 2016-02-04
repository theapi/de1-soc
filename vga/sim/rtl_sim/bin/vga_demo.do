vlog -reportprogress 300 -work work ../../testbench/vga_demo_tb.v
vlog -reportprogress 300 -work work ../../V/vga_demo.v
vsim work.vga_demo_tb
do ../../testbench/vga_demo_wave.do
run 15000000
