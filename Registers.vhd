library IEEE;
use IEEE.STD_Logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Registers is
	Port(	
		CLK				: in std_logic;
		reset				: in std_logic;
		RegW				: in std_logic;
		SR1				: in std_logic_vector(4 downto 0);
		SR2				: in std_logic_vector(4 downto 0);
		DR			 		: in std_logic_vector(4 downto 0);
		Reg_In			: in std_logic_vector(31 downto 0);
		ReadReg1			: out std_logic_vector(31 downto 0);
		ReadReg2 		: out std_logic_vector(31 downto 0)
		);
end Registers;

architecture Behavioral of Registers is
	
	type registers is array (0 to 31) of std_logic_vector(31 downto 0);
	
	signal reg: registers:= (others => (others => '0'));
	
begin
	ReadReg1 <= reg(to_integer(unsigned(SR1)));
	ReadReg2 <= reg(to_integer(unsigned(SR2)));
	
	process(CLK, reset)
	begin
		if reset = '1' then
			reg <= (others => (others => '0'));
		elsif rising_edge(CLK) then
			if RegW = '1' then
				reg(to_integer(unsigned(DR))) <= Reg_In;
			end if;
		end if;
	end process;
end Behavioral;