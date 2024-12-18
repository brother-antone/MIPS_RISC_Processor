quit -sim

vsim -gui work.completemips
# vsim -gui work.completemips 
# Start time: 00:17:10 on Dec 08,2024
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.completemips(behavioral)
# Loading work.mips(behavioral)
# Loading ieee.numeric_std(body)
# Loading work.pc_counter(behavioral)
# Loading work.add4(behavioral)
# Loading work.registers(behavioral)
# Loading work.mux_drselect(behavioral)
# Loading work.alu(behavioral)
# Loading work.mux_regorimm(behavioral)
# Loading work.mux_fetchdori(behavioral)
# Loading work.mux_aluormem(behavioral)
# Loading work.control_unit(behavioral)
# Loading work.sign_extend(behavioral)
# Loading work.memory(behavioral)
add wave -position insertpoint  \
sim:/completemips/ADDR \
sim:/completemips/CLK \
sim:/completemips/CS \
sim:/completemips/Mem_Bus \
sim:/completemips/reset \
sim:/completemips/WE
add wave -position insertpoint sim:/completemips/CPU/REG/*
add wave -position insertpoint sim:/completemips/CPU/CTRL/*
add wave -position insertpoint sim:/completemips/CPU/ALU_Unit/*

force -freeze sim:/completemips/CLK 0 0
force -freeze sim:/completemips/reset 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns

force -freeze sim:/completemips/CLK 1 0
run 20 ns
force -freeze sim:/completemips/CLK 0 0
run 20 ns