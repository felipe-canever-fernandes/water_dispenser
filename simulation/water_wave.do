onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /water_dispenser_testbench/clock
add wave -noupdate /water_dispenser_testbench/reset
add wave -noupdate -expand /water_dispenser_testbench/switches
add wave -noupdate /water_dispenser_testbench/button_add
add wave -noupdate /water_dispenser_testbench/button_ok
add wave -noupdate /water_dispenser_testbench/button_cancel
add wave -noupdate /water_dispenser_testbench/total_amount_in_ml
add wave -noupdate /water_dispenser_testbench/dispenser/current_state
add wave -noupdate -radix unsigned -childformat {{{/water_dispenser_testbench/dispenser/count[13]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[12]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[11]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[10]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[9]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[8]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[7]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[6]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[5]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[4]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[3]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[2]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[1]} -radix unsigned} {{/water_dispenser_testbench/dispenser/count[0]} -radix unsigned}} -subitemconfig {{/water_dispenser_testbench/dispenser/count[13]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[12]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[11]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[10]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[9]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[8]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[7]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[6]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[5]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[4]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[3]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[2]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[1]} {-height 18 -radix unsigned} {/water_dispenser_testbench/dispenser/count[0]} {-height 18 -radix unsigned}} /water_dispenser_testbench/dispenser/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6755 ns} 0}
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
WaveRestoreZoom {0 ns} {10500 ns}
