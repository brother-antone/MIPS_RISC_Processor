library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC_Counter is
	Port(
		CLK		: in std_logic;
		reset 	: in std_logic;
		next_pc	: in std_logic_vector(31 downto 0);
		pc_write	: in std_logic;
		pc_out	: out std_logic_vector(31 downto 0)
		);
		
end entity;

architecture Behavioral of PC_Counter is

	signal pc_reg : std_logic_vector(31 downto 0) := (others => '0');

begin
	process(CLK, reset)
	begin
		if reset = '1' then
			pc_reg <= (others => '0');
		
		elsif rising_edge(CLK) then
			if pc_write = '1' then
				pc_reg <= "00" & next_pc(31 downto 2);
				
			end if;
		end if;
	end process;
	
	pc_out <= pc_reg;
end Behavioral;
		
		