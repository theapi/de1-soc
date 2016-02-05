onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ps2_controller_tb/clk
add wave -noupdate /ps2_controller_tb/reset
add wave -noupdate /ps2_controller_tb/ps2_clock
add wave -noupdate /ps2_controller_tb/ps2_data
add wave -noupdate -radix hexadecimal -childformat {{{/ps2_controller_tb/scan_code[7]} -radix hexadecimal} {{/ps2_controller_tb/scan_code[6]} -radix hexadecimal} {{/ps2_controller_tb/scan_code[5]} -radix hexadecimal} {{/ps2_controller_tb/scan_code[4]} -radix hexadecimal} {{/ps2_controller_tb/scan_code[3]} -radix hexadecimal} {{/ps2_controller_tb/scan_code[2]} -radix hexadecimal} {{/ps2_controller_tb/scan_code[1]} -radix hexadecimal} {{/ps2_controller_tb/scan_code[0]} -radix hexadecimal}} -subitemconfig {{/ps2_controller_tb/scan_code[7]} {-height 17 -radix hexadecimal} {/ps2_controller_tb/scan_code[6]} {-height 17 -radix hexadecimal} {/ps2_controller_tb/scan_code[5]} {-height 17 -radix hexadecimal} {/ps2_controller_tb/scan_code[4]} {-height 17 -radix hexadecimal} {/ps2_controller_tb/scan_code[3]} {-height 17 -radix hexadecimal} {/ps2_controller_tb/scan_code[2]} {-height 17 -radix hexadecimal} {/ps2_controller_tb/scan_code[1]} {-height 17 -radix hexadecimal} {/ps2_controller_tb/scan_code[0]} {-height 17 -radix hexadecimal}} /ps2_controller_tb/scan_code
add wave -noupdate /ps2_controller_tb/scan_ready
add wave -noupdate /ps2_controller_tb/keyboard/ps2_clock_edge_detect
add wave -noupdate /ps2_controller_tb/keyboard/state_reg
add wave -noupdate /ps2_controller_tb/keyboard/ps2_clock_negedge
add wave -noupdate /ps2_controller_tb/keyboard/state_reg
add wave -noupdate -radix binary -expand /ps2_controller_tb/keyboard/r_scan_code
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {630 ns}
