vlog -reportprogress 300 -work work ../../../bench/verilog/bin2bcd_tb.v
vlog -reportprogress 300 -work work ../../../rtl/verilog/bin2bcd.v
vsim work.bin2bcd_tb
do ../../../sim/rtl_sim/bin/bin2bcd_wave.do
run 2600
