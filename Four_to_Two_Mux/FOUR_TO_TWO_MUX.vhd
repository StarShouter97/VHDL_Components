Library IEEE;
use IEEE.std_logic_1164.all;

ENTITY FOUR_TO_TWO_MUX IS
	PORT(SELECT_lINE: IN std_logic_vector(1 downto 0);
		  DATA_LINE  : IN std_logic_vector(3 downto 0);
		  OUTPUT     : OUT std_logic);
END FOUR_TO_TWO_MUX;

ARCHITECTURE DATA_FLOW OF FOUR_TO_TWO_MUX IS

BEGIN

	with SELECT_lINE select
    OUTPUT <= DATA_LINE(0) when "00",
				  DATA_LINE(1) when "01",
              DATA_LINE(2) when "10",
              DATA_LINE(3) when others;

END DATA_FLOW;