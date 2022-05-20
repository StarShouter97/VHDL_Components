Library IEEE;
use IEEE.std_logic_1164.all;

ENTITY FOUR_BIT_SHIFT_REGISTER IS
	PORT(D	  : IN std_logic_vector(3 downto 0);
		  DIN   : IN std_logic;
		  LOAD  : IN std_logic;
		  CLK   : IN std_logic;
		  ENABLE: IN std_logic;
		  RESET : IN std_logic;
		  Q     : OUT std_logic_vector(3 downto 0));
END FOUR_BIT_SHIFT_REGISTER;

ARCHITECTURE DATA_FLOW OF FOUR_BIT_SHIFT_REGISTER IS

signal Q_Temp: std_logic_vector(3 downto 0);

BEGIN

	process(CLK, RESET)
	begin

		if(RESET = '0') then
			Q <= "0000";
		elsif(rising_edge(CLK)) then
			if(LOAD ='1') then
				Q_Temp <= D;
			elsif(ENABLE = '1') then
				Q_Temp <= DIN & Q_Temp(3 downto 1);
			end if;
		end if;
			
		Q(3 downto 0) <= Q_Temp(3 downto 0);
		
	end process;

END DATA_FLOW;