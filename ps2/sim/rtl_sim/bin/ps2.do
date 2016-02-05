vlog -reportprogress 300 -work work ../../../bench/verilog/ps2_controller_tb.v
vlog -reportprogress 300 -work work ../../../rtl/verilog/ps2_controller.v
vsim work.ps2_controller_tb
do ../../../sim/rtl_sim/bin/ps2_wave.do
run 600
