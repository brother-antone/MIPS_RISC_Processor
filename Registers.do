quit -sim

# Create a test wave file
vsim work.Registers

# Add signals to the waveform
add wave -position insertpoint \
    sim:/Registers/CLK \
    sim:/Registers/reset \
    sim:/Registers/RegW \
    sim:/Registers/SR1 \
    sim:/Registers/SR2 \
    sim:/Registers/DR \
    sim:/Registers/Reg_In \
    sim:/Registers/ReadReg1 \
    sim:/Registers/ReadReg2

# Apply a repeating clock signal (20 ns high, 20 ns low)
force -repeat 40 /Registers/CLK 0, 1 20

# Initial reset
# Reset all registers
force -drive /Registers/reset 1
run 40 ns
force -drive /Registers/reset 0
run 40 ns

# Test Case 1: Write to Register 5
# Write "10101010" to register 5
force -drive /Registers/DR 5
force -drive /Registers/Reg_In 32'b10101010101010101010101010101010
force -drive /Registers/RegW 1
run 40 ns  

# Test Case 2: Read from Register 5
# Read from register 5 into ReadReg1
force -drive /Registers/SR1 5
force -drive /Registers/RegW 0
run 40 ns  

# Test Case 3: Write to Register 10
# Write "11110000" to register 10
force -drive /Registers/DR 10
force -drive /Registers/Reg_In 32'b11110000111100001111000011110000
force -drive /Registers/RegW 1
run 40 ns  

# Test Case 4: Read from Register 10
# Read from register 10 into ReadReg2
force -drive /Registers/SR2 10
force -drive /Registers/RegW 0
run 40 ns  

# Test Case 5: Simultaneous Read
# Read from registers 5 and 10 simultaneously
force -drive /Registers/SR1 5
force -drive /Registers/SR2 10
run 40 ns

# Test Case 6: Reset after Writes
# Reset all registers again
force -drive /Registers/reset 1
run 40 ns
force -drive /Registers/reset 0
run 40 ns

# Test Case 7: Verify Reset
# Read from registers 5 and 10 after reset
force -drive /Registers/SR1 5
force -drive /Registers/SR2 10
run 40 ns

# End simulation
quit -force
