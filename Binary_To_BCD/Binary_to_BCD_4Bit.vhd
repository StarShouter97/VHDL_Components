library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity Binary_to_BCD_4Bit is
  generic (
    g_INPUT_WIDTH    : INTEGER := 4;
    g_DECIMAL_DIGITS : INTEGER := 2
    );
  port (
    i_Clock  : in  STD_LOGIC;
    i_Binary : in  STD_LOGIC_VECTOR(g_INPUT_WIDTH-1 downto 0);
	 SEG_ON   : out STD_LOGIC_VECTOR(g_DECIMAL_DIGITS-1 downto 0);
    o_SEG    : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity Binary_to_BCD_4Bit;
 
architecture rtl of Binary_to_BCD_4Bit is

   component Blink_LED is
       port(
		      Clk  : in  STD_LOGIC;
            LED  : out STD_LOGIC
		    );
   end component;		 
  
  
   component Seven_seg is
       port( 
		      Binary_input  : in  STD_LOGIC_VECTOR(3 downto 0);
		      Enable_Button : in  STD_LOGIC;
		      Enable        : out STD_LOGIC_VECTOR(1 downto 0);
		      SEG           : out STD_LOGIC_VECTOR(6 downto 0)
		    );
	end component;
	
	--signal  temp : STD_LOGIC_VECTOR(3 downto 0);
   --signal  bcd  : UNSIGNED(7 downto 0) := (others => '0');
	
	
	signal o_BCD      : STD_LOGIC_VECTOR(3 downto 0);
	signal SEG_LED    : STD_LOGIC_VECTOR(6 downto 0);
	signal SEG_MUX    : STD_LOGIC;
	signal SEG_SLC    : STD_LOGIC;
	signal BCD_in     : STD_LOGIC_VECTOR(3 downto 0);
   
begin

Counter : Blink_LED
   port map(
	          Clk  => i_Clock,
             LED  => SEG_MUX
   );


i_Seven_seg_DEC : Seven_seg
   port map (
             Binary_input  => o_BCD,
		       Enable_Button => SEG_SLC,
		       Enable        => SEG_ON,
		       SEG           => o_SEG
   );



Double_dabble:process (i_Clock)
 
  variable temp : STD_LOGIC_VECTOR (3 downto 0);
  variable bcd : UNSIGNED (7 downto 0) := (others => '0');
 
begin

  bcd              := (others => '0');
  temp(3 downto 0) := not i_Binary;
 
 for i in 0 to 3 loop
 
 if bcd(3 downto 0) > 4 then 
      bcd(3 downto 0) := bcd(3 downto 0) + 3;
 end if;
      
 if bcd(7 downto 4) > 4 then 
      bcd(7 downto 4) := bcd(7 downto 4) + 3;
 end if;
 
 bcd  := bcd(6 downto 0) & temp(3);
 temp := temp(2 downto 0) & '0';
 
 end loop;
 
 if (bcd(7 downto 4) > 0) and (SEG_MUX = '1') then
      o_BCD <= STD_LOGIC_VECTOR(bcd(7 downto 4));
		SEG_SLC <= '1';
 else
      o_BCD   <= STD_LOGIC_VECTOR(bcd(3 downto 0));
      SEG_SLC <= '0';
 end if;
 
end process Double_Dabble;

  
end architecture rtl;
