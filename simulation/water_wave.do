onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /water_dispenser_testbench/clock
add wave -noupdate /water_dispenser_testbench/reset
add wave -noupdate -expand /water_dispenser_testbench/switches
add wave -noupdate /water_dispenser_testbench/button_add
add wave -noupdate /water_dispenser_testbench/button_ok
add wave -noupdate /water_dispenser_testbench/button_cancel
add wave -noupdate /water_dispenser_testbench/total_amount
add wave -noupdate /water_dispenser_testbench/dispenser/current_state
add wave -noupdate -radix unsigned /water_dispenser_testbench/dispenser/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4731 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 275
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {5250 ns}
