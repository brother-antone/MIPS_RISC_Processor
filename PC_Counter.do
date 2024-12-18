quit -sim

# Create a test wave file
vsim work.PC_Counter

# Add signals to the waveform
add wave -position insertpoint \
    sim:/PC_Counter/CLK \
    sim:/PC_Counter/reset \
    sim:/PC_Counter/next_pc \
    sim:/PC_Counter/pc_write \
    sim:/PC_Counter/pc_out

# Apply a repeating clock signal (20 ns high, 20 ns low)
force -repeat 40 ns /PC_Counter/CLK 0, 1 20 ns

# Initial reset
# Reset the program counter
force -drive /PC_Counter/reset 1
run 40 ns
force -drive /PC_Counter/reset 0
run 40 ns

# Test Case 1: Write to PC
# Set next_pc = 4, pc_write = 1
force -drive /PC_Counter/next_pc 32'b00000000000000000000000000000100
force -drive /PC_Counter/pc_write 1
run 40 ns  

# Test Case 2: Hold PC (pc_write = 0)
# next_pc changes, but pc_write = 0
force -drive /PC_Counter/next_pc 32'b00000000000000000000000000001000
force -drive /PC_Counter/pc_write 0
run 40 ns  

# Test Case 3: Write a new PC value
# Set next_pc = 16, pc_write = 1
force -drive /PC_Counter/next_pc 32'b00000000000000000000000000010000
force -drive /PC_Counter/pc_write 1
run 40 ns  

# Test Case 4: Reset while PC has a value
# Reset the PC counter
force -drive /PC_Counter/reset 1
run 40 ns
force -drive /PC_Counter/reset 0
run 40 ns

# Test Case 5: Write after reset
# Set next_pc = 20, pc_write = 1
force -drive /PC_Counter/next_pc 32'b00000000000000000000000000010100
force -drive /PC_Counter/pc_write 1
run 40 ns  


