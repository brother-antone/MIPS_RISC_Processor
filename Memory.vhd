library IEEE;
use IEEE.STD_Logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory is
	Port(
		CS		: in std_logic;
		WE		: in std_logic;
		CLK	: in std_logic;
		reset : in std_logic;
		ADDR	: in std_logic_vector(31 downto 0);
		Mem_bus : inout std_logic_vector(31 downto 0)
		);
		
end entity;

architecture Behavioral of Memory is

	type memory is array (0 to 127) of std_logic_vector(31 downto 0);
	
	signal mem: memory := (
        0 => "00000000000000000000000000000000",
	1 => "00100000000000010000000000000110",
        2 => "00110100000000100000000000010010",
        3 => "00000000001000100001100000100000",
        4 => "00000000001000100010100000100010",
        5 => "00000000001000100011000000100100",
        6 => "00000000001000100011100000100101",
        7 => "10001100000010100000000001000100",
        8 => "10101100000000110000000001000000",
        9 => "10101100000001010000000001000001",
        10 => "10001100000010000000000001000000",
	68 => "11111111111111111111111111111111",
        others => (others => '0')  -- Initialize the rest to 0
    );

begin
	process(CLK,reset)
	begin
		if reset = '1' then
			mem <= (others => (others => '0'));
			Mem_bus <= (others => 'Z');
		
		elsif rising_edge(CLK) then
			if CS = '1' then
				if WE = '1' then
					mem(to_integer(unsigned(ADDR(6 downto 0)))) <= Mem_bus;
					Mem_bus <= (others => 'Z');
				
				else
					Mem_bus <= mem(to_integer(unsigned(ADDR(6 downto 0))));
				end if;
			
			else
				Mem_bus <= (others => 'Z');
			end if;
		end if;
	end process;
end Behavioral;
			
			
