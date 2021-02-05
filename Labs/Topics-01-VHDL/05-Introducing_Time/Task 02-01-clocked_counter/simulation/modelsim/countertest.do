vsim work.sixteenbitcounter

add wave -position insertpoint sim:/sixteenbitcounter/CLK -radix unsigned sim:/sixteenbitcounter/Y

force -freeze sim:/sixteenbitcounter/CLK 1 0, 0 {50 ps} -r 100

run 1100 ps
