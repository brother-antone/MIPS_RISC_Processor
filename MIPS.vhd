library IEEE;
use IEEE.STD_Logic_1164.ALL;

entity MIPS is
	Port(
		CLK, RST 	: in std_logic;
		ADDR 			: out std_logic_vector(31 downto 0);
		CS, WE		: out std_logic;
		Mem_Bus		: inout std_logic_vector(31 downto 0)
		);
end MIPS;

architecture Behavioral of MIPS is

    -- Component Declarations
    component PC_Counter
        Port(
            CLK, reset, pc_write : in std_logic;
            next_pc : in std_logic_vector(31 downto 0);
            pc_out : out std_logic_vector(31 downto 0)
        );
    end component;

    component Registers
        Port(
            CLK, reset, RegW : in std_logic;
            SR1, SR2, DR : in std_logic_vector(4 downto 0);
            Reg_In : in std_logic_vector(31 downto 0);
            ReadReg1, ReadReg2 : out std_logic_vector(31 downto 0)
        );
    end component;

    component ALU
        Port(
            A, B : in std_logic_vector(31 downto 0);
            ALUop : in std_logic_vector(2 downto 0);
            Result : out std_logic_vector(31 downto 0)
        );
    end component;

    component Control_Unit
        Port(
            CLK, reset : in std_logic;
            instruction : in std_logic_vector(31 downto 0); 
            DRSelect, REGorIMM, ALUorMEM, FetchDorI, RegWrite, MemCS, MemWrite, pc_write, rst : out std_logic;
            ALUOp : out std_logic_vector(2 downto 0)
        );
    end component;

    component Add4
        Port(
            presum  : in std_logic_vector(31 downto 0);
            postsum : out std_logic_vector(31 downto 0)
        );
    end component;

    component Sign_Extend
        Port(
            imm_in : in std_logic_vector(15 downto 0);
            imm_out : out std_logic_vector(31 downto 0)
        );
    end component;

    -- MUX Components
    component MUX_ALUorMEM
        Port(
            input0, input1 : in std_logic_vector(31 downto 0);
            sel : in std_logic;
            output : out std_logic_vector(31 downto 0)
        );
    end component;

    component MUX_DRSelect
        Port(
            input0, input1: in std_logic_vector(4 downto 0);
            sel : in std_logic;
            output : out std_logic_vector(4 downto 0)
        );
    end component;

    component MUX_FetchDorI
        Port(
            input0, input1 : in std_logic_vector(31 downto 0);
            sel : in std_logic;
            output : out std_logic_vector(31 downto 0)
        );
    end component;

    component MUX_REGorIMM
        Port(
            input0, input1 : in std_logic_vector(31 downto 0);
            sel : in std_logic;
            output : out std_logic_vector(31 downto 0)
        );
    end component;

    -- Signal Declarations
    signal PC, Next_PC, Instruction, ALU_Result : std_logic_vector(31 downto 0);
    signal ReadReg1_X, ReadReg2_X, RegWriteData : std_logic_vector(31 downto 0);
    signal SignExtended : std_logic_vector(31 downto 0);
    signal DRSelect_X, REGorIMM_X, ALUorMEM_X, FetchDorI_X, RegWrite_X, MemCS_X, MemWrite_X, pc_write_X, rst_X : std_logic;
    signal ALUOp_X : std_logic_vector(2 downto 0);
    signal MUX_DR_out : std_logic_vector(4 downto 0);
	 signal MUX_ALU_out, MUX_MEM_out, MUX_ADDR_out : std_logic_vector(31 downto 0);

begin

	process(CLK)
	begin
		if rising_edge(CLK) then
            		if Mem_Bus /= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" then
                		Instruction <= Mem_Bus;
            		end if;
        	end if;
    	end process;

    -- PC Counter
    PC_C: PC_Counter
        Port Map (
            CLK => CLK,
            reset => RST,
            pc_write => pc_write_X,
            next_pc => Next_PC,
            pc_out => PC
        );

    -- Add4 for Next_PC Calculation
    ADDER: Add4
        Port Map (
            presum => PC,
            postsum => Next_PC
        );

    -- Register File
    REG: Registers
        Port Map (
            CLK => CLK,
            reset => RST,
            RegW => RegWrite_X,
            SR1 => Instruction(25 downto 21),
            SR2 => Instruction(20 downto 16),
            DR => MUX_DR_out,
            Reg_In => RegWriteData,
            ReadReg1 => ReadReg1_X,
            ReadReg2 => ReadReg2_X
        );

    -- DR MUX
    MUX_DR: MUX_DRSelect
        Port Map (
            input0 => Instruction(20 downto 16),
            input1 => Instruction(15 downto 11),
            sel => DRSelect_X,
            output => MUX_DR_out(4 downto 0)
        );

    -- ALU
    ALU_Unit: ALU
        Port Map (
            A => ReadReg1_X,
            B => MUX_ALU_out,
            ALUop => ALUOp_X,
            Result => ALU_Result
        );

    -- ALU Input MUX
    MUX_ALU: MUX_REGorIMM
        Port Map (
            input0 => ReadReg2_X,
            input1 => SignExtended,
            sel => REGorIMM_X,
            output => MUX_ALU_out
        );

    -- Data Memory Address MUX
    MUX_ADDR: MUX_FetchDorI
        Port Map (
            input0 => PC,
            input1 => ALU_Result,
            sel => FetchDorI_X,
            output => MUX_ADDR_out
        );

    -- Data Write MUX
    MUX_MEM: MUX_ALUorMEM
        Port Map (
            input0 => Mem_Bus,
            input1 => ALU_Result,
            sel => ALUorMEM_X,
            output => RegWriteData
        );

    -- Control Unit
    CTRL: Control_Unit
        Port Map (
            CLK => CLK,
            reset => RST,
            instruction => Instruction,
            DRSelect => DRSelect_X,
            REGorIMM => REGorIMM_X,
            ALUorMEM => ALUorMEM_X,
            FetchDorI => FetchDorI_X,
            RegWrite => RegWrite_X,
            MemCS => MemCS_X,
            MemWrite => MemWrite_X,
            pc_write => pc_write_X,
				rst => rst_X,
            ALUOp => ALUOp_X
        );

    -- Sign-Extend Immediate
    SIGN_EXT: Sign_Extend
        Port Map (
            imm_in => Instruction(15 downto 0),
            imm_out => SignExtended
        );

    -- Memory Control Signals
    ADDR <= MUX_ADDR_out;
    CS <= MemCS_X;
    WE <= MemWrite_X;
    -- Mem_Bus <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; -- Default to Z unless writing

    process(CLK)
    begin
    if rising_edge(CLK) then
        -- If Chip Select (CS) and Write Enable (WE) are asserted, drive Mem_Bus
        if MemCS_X = '1' and MemWrite_X = '1' then
            Mem_Bus <= ReadReg2_X; -- Drive Mem_Bus with the data to be written to memory
        else
            Mem_Bus <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; -- Default to high-impedance
        end if;
    end if;
end process;

end Behavioral;
