quit -sim

vsim work.memory
# vsim work.memory 
# Start time: 17:59:51 on Dec 06,2024
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.memory(behavioral)
add wave -position insertpoint sim:/memory/*
force -freeze sim:/memory/CS 1 0
force -freeze sim:/memory/WE 1 0
force -freeze sim:/memory/CLK 0 0
force -freeze sim:/memory/reset 0 0
force -freeze sim:/memory/ADDR 00000000000000000000000000000101 0
force -freeze sim:/memory/Mem_bus 11111111111111111111111111111111 0
run 20 ns
force -freeze sim:/memory/CLK 1 0
run 20 ns
force -freeze sim:/memory/CLK 0 0
run 20 ns
force -freeze sim:/memory/WE 0 0
force -freeze sim:/memory/CS 0 0
noforce sim:/memory/Mem_bus
run 20 ns
force -freeze sim:/memory/CLK 1 0
run 20 ns
run 20 ns
force -freeze sim:/memory/CS 1 0
force -freeze sim:/memory/WE 1 0
force -freeze sim:/memory/CLK 0 0
force -freeze sim:/memory/ADDR 00000000000000000000000000000001 0
force -freeze sim:/memory/Mem_bus 10000000011000000001100000000100 0
run 20 ns
force -freeze sim:/memory/CLK 1 0
run 20 ns
force -freeze sim:/memory/CLK 0 0
run 20 ns
force -freeze sim:/memory/WE 0 0
noforce sim:/memory/Mem_bus
force -freeze sim:/memory/CLK 0 0
force -freeze sim:/memory/ADDR 00000000000000000000000000000101 0
run 20 ns
force -freeze sim:/memory/CLK 1 0
run 20 ns
