library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CompleteMIPS is
    Port(
        CLK, reset : in std_logic
    );
end CompleteMIPS;


architecture Behavioral of CompleteMIPS is

    -- Component Declarations
    component MIPS
        Port(
            CLK, RST : in std_logic;
            ADDR : out std_logic_vector(31 downto 0);
            CS, WE : out std_logic;
            Mem_Bus : inout std_logic_vector(31 downto 0)
        );
    end component;

    component Memory
        Port(
            CS, WE, CLK, reset : in std_logic;
            ADDR : in std_logic_vector(31 downto 0);
            Mem_Bus : inout std_logic_vector(31 downto 0)
        );
    end component;

    -- Signal Declarations
    signal ADDR_X : std_logic_vector(31 downto 0);
    signal CS_X, WE_X : std_logic;
    signal Mem_Bus_X : std_logic_vector(31 downto 0);

begin

    -- MIPS Instance
    CPU: MIPS
        Port Map (
            CLK => CLK,
            RST => reset,
            ADDR => ADDR_X,
            CS => CS_X,
            WE => WE_X,
            Mem_Bus => Mem_Bus_X
        );

    -- Memory Instance
    MEM: Memory
        Port Map (
            CS => CS_X,
            WE => WE_X,
            CLK => CLK,
	    reset => reset,
            ADDR => ADDR_X,
            Mem_Bus => Mem_Bus_X
        );



end Behavioral;
