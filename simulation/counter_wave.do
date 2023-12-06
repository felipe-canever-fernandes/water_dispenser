onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /counter_testbench/clock
add wave -noupdate /counter_testbench/reset
add wave -noupdate -radix unsigned -childformat {{{/counter_testbench/count[31]} -radix unsigned} {{/counter_testbench/count[30]} -radix unsigned} {{/counter_testbench/count[29]} -radix unsigned} {{/counter_testbench/count[28]} -radix unsigned} {{/counter_testbench/count[27]} -radix unsigned} {{/counter_testbench/count[26]} -radix unsigned} {{/counter_testbench/count[25]} -radix unsigned} {{/counter_testbench/count[24]} -radix unsigned} {{/counter_testbench/count[23]} -radix unsigned} {{/counter_testbench/count[22]} -radix unsigned} {{/counter_testbench/count[21]} -radix unsigned} {{/counter_testbench/count[20]} -radix unsigned} {{/counter_testbench/count[19]} -radix unsigned} {{/counter_testbench/count[18]} -radix unsigned} {{/counter_testbench/count[17]} -radix unsigned} {{/counter_testbench/count[16]} -radix unsigned} {{/counter_testbench/count[15]} -radix unsigned} {{/counter_testbench/count[14]} -radix unsigned} {{/counter_testbench/count[13]} -radix unsigned} {{/counter_testbench/count[12]} -radix unsigned} {{/counter_testbench/count[11]} -radix unsigned} {{/counter_testbench/count[10]} -radix unsigned} {{/counter_testbench/count[9]} -radix unsigned} {{/counter_testbench/count[8]} -radix unsigned} {{/counter_testbench/count[7]} -radix unsigned} {{/counter_testbench/count[6]} -radix unsigned} {{/counter_testbench/count[5]} -radix unsigned} {{/counter_testbench/count[4]} -radix unsigned} {{/counter_testbench/count[3]} -radix unsigned} {{/counter_testbench/count[2]} -radix unsigned} {{/counter_testbench/count[1]} -radix unsigned} {{/counter_testbench/count[0]} -radix unsigned}} -subitemconfig {{/counter_testbench/count[31]} {-height 18 -radix unsigned} {/counter_testbench/count[30]} {-height 18 -radix unsigned} {/counter_testbench/count[29]} {-height 18 -radix unsigned} {/counter_testbench/count[28]} {-height 18 -radix unsigned} {/counter_testbench/count[27]} {-height 18 -radix unsigned} {/counter_testbench/count[26]} {-height 18 -radix unsigned} {/counter_testbench/count[25]} {-height 18 -radix unsigned} {/counter_testbench/count[24]} {-height 18 -radix unsigned} {/counter_testbench/count[23]} {-height 18 -radix unsigned} {/counter_testbench/count[22]} {-height 18 -radix unsigned} {/counter_testbench/count[21]} {-height 18 -radix unsigned} {/counter_testbench/count[20]} {-height 18 -radix unsigned} {/counter_testbench/count[19]} {-height 18 -radix unsigned} {/counter_testbench/count[18]} {-height 18 -radix unsigned} {/counter_testbench/count[17]} {-height 18 -radix unsigned} {/counter_testbench/count[16]} {-height 18 -radix unsigned} {/counter_testbench/count[15]} {-height 18 -radix unsigned} {/counter_testbench/count[14]} {-height 18 -radix unsigned} {/counter_testbench/count[13]} {-height 18 -radix unsigned} {/counter_testbench/count[12]} {-height 18 -radix unsigned} {/counter_testbench/count[11]} {-height 18 -radix unsigned} {/counter_testbench/count[10]} {-height 18 -radix unsigned} {/counter_testbench/count[9]} {-height 18 -radix unsigned} {/counter_testbench/count[8]} {-height 18 -radix unsigned} {/counter_testbench/count[7]} {-height 18 -radix unsigned} {/counter_testbench/count[6]} {-height 18 -radix unsigned} {/counter_testbench/count[5]} {-height 18 -radix unsigned} {/counter_testbench/count[4]} {-height 18 -radix unsigned} {/counter_testbench/count[3]} {-height 18 -radix unsigned} {/counter_testbench/count[2]} {-height 18 -radix unsigned} {/counter_testbench/count[1]} {-height 18 -radix unsigned} {/counter_testbench/count[0]} {-height 18 -radix unsigned}} /counter_testbench/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {299 ns} 0} {{Cursor 2} {651 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {1050 ns}
