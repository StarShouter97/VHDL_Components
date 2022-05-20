
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY ONE_BIT_SUBTRACTOR IS
	PORT( A	 : IN  std_logic;
			B	 : IN  std_logic;
			BIN : IN  std_logic;
			SOUT: OUT std_logic;
			BOUT: OUT std_logic);
END ONE_BIT_SUBTRACTOR;

ARCHITECTURE DATA_FLOW OF ONE_BIT_SUBTRACTOR IS

BEGIN

--operation result
SOUT <= (not A and not B and BIN) or (not A and B and not BIN) or 
		  (A and not B and not BIN) or (A and B and BIN);

--carry of the operation
BOUT <= (not A and BIN) or (not A and B) or (B and BIN);

END DATA_FLOW;		