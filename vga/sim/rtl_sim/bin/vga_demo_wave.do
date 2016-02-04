onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /vga_demo_tb/vga_ins/CLOCK_PIXEL
add wave -noupdate /vga_demo_tb/vga_ins/RESET
add wave -noupdate /vga_demo_tb/vga_ins/BLANK_N
add wave -noupdate /vga_demo_tb/vga_ins/VGA_HS
add wave -noupdate /vga_demo_tb/vga_ins/VGA_VS
add wave -noupdate -radix unsigned /vga_demo_tb/vga_ins/hor_reg
add wave -noupdate -radix unsigned /vga_demo_tb/vga_ins/hor_pixel
add wave -noupdate /vga_demo_tb/vga_ins/hor_sync
add wave -noupdate -radix unsigned /vga_demo_tb/vga_ins/ver_reg
add wave -noupdate -radix unsigned /vga_demo_tb/vga_ins/ver_pixel
add wave -noupdate /vga_demo_tb/vga_ins/ver_sync
add wave -noupdate -radix hexadecimal /vga_demo_tb/vga_ins/red
add wave -noupdate -radix hexadecimal /vga_demo_tb/vga_ins/green
add wave -noupdate -radix hexadecimal /vga_demo_tb/vga_ins/blue
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17730 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 176
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
WaveRestoreZoom {0 ns} {12600 us}
