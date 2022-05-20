library ieee;
use ieee.std_logic_1164.all;
 
entity MUX is
  port (
    i_Select : in  std_logic;
    i_Data1  : in  std_logic;
    i_Data2  : in  std_logic;
    o_Data   : out std_logic
    );
end entity MUX;
 
architecture RTL of MUX is
begin

  -- Alternatively:
  with i_Select select
    o_Data <=
    i_Data1 when '0',
    i_Data2 when others;
   
end architecture RTL;