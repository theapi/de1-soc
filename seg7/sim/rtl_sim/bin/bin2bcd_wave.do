onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /bin2bcd_tb/bcd
add wave -noupdate -radix binary /bin2bcd_tb/bin
add wave -noupdate -radix unsigned /bin2bcd_tb/i
add wave -noupdate -radix unsigned /bin2bcd_tb/hundreds
add wave -noupdate -radix unsigned /bin2bcd_tb/tens
add wave -noupdate -radix unsigned /bin2bcd_tb/ones
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1830 ps} 0}
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
WaveRestoreZoom {1650 ps} {2650 ps}
