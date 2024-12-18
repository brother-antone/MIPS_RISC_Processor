quit -sim

vsim -gui work.add4
# vsim -gui work.add4 
# Start time: 21:15:11 on Dec 07,2024
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.add4(behavioral)

add wave -position insertpoint sim:/add4/*

force -freeze sim:/add4/presum 00000000000000000000000000000000 0
run 20 ns
force -freeze sim:/add4/presum 00000000000000000000000000000001 0
run 20 ns
