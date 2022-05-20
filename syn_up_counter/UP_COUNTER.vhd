Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY UP_COUNTER IS
	generic(N: natural := 4);
	port(COUNT_UP : IN std_logic_vector(N-1 downto 0);
		  CLK      : IN std_logic;
		  LOAD     : IN std_logic;
		  RST      : IN std_logic;
		  COUNT_OUT: OUT std_logic_vector(N downto 0));
END UP_COUNTER;

ARCHITECTURE DATA_FLOW OF UP_COUNTER IS

	signal count_temp: std_logic_vector(N downto 0);

BEGIN
	process(CLK)
		begin
			if(rising_edge(CLK)) then
				if(RST = '0') then
					count_temp <= (others => '0');
				elsif(LOAD = '1') then
					count_temp <= '0' & COUNT_UP;
				else
					count_temp <= count_temp + 1;
				end if;
			end if;
	end process;
	COUNT_OUT <= count_temp;
END DATA_FLOW;