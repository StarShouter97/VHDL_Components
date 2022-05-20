Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY CLK_DVI IS
	PORT(CLK_I: in std_logic;
		  RST  : in std_logic;
		  CLK_O: out std_logic);
END CLK_DVI;

ARCHITECTURE DATA_FLOW OF CLK_DVI IS

	signal clk_temp: std_logic := '0';

BEGIN

	process(CLK_I, RST)
		variable counter: integer := 1;
	begin
		if(RST = '1') then
			counter := 0;
			clk_temp <= '0';
		elsif(counter < 5) then
			counter := counter + 1;
		else
			clk_temp <= not clk_temp;
			counter := 1;
		end if;
	end process;
	CLK_O <= clk_temp;
END DATA_FLOW;