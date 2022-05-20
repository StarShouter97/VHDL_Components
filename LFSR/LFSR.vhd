library ieee;
use ieee.std_logic_1164.all;
 
entity LFSR is
  generic (
    g_Num_Bits : integer := 4
    );
  port (
    i_Clk    : in std_logic;
    i_Enable : in std_logic;
 
    -- Optional Seed Value
    i_Seed_DV   : in std_logic;
    i_Seed_Data : in std_logic_vector(g_Num_Bits-1 downto 0);
     
    o_LFSR_Data : out std_logic_vector(g_Num_Bits-1 downto 0);
    o_LFSR_Done : out std_logic
    );
end entity LFSR;
 
architecture RTL of LFSR is
 
  signal r_LFSR : std_logic_vector(g_Num_Bits downto 1) := (others => '0');
  signal w_XNOR : std_logic;
   
begin
 
  -- Purpose: Load up LFSR with Seed if Data Valid (DV) pulse is detected.
  -- Othewise just run LFSR when enabled.
  p_LFSR : process (i_Clk) is
  begin
    if rising_edge(i_Clk) then
      if i_Enable = '1' then
        if i_Seed_DV = '1' then
          r_LFSR <= i_Seed_Data;
        else
          r_LFSR <= r_LFSR(r_LFSR'left-1 downto 1) & w_XNOR;
        end if;
      end if;
    end if;
  end process p_LFSR; 
 
  -- Create Feedback Polynomials.  Based on Application Note:
  -- http://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
  g_LFSR_3 : if g_Num_Bits = 3 generate
    w_XNOR <= r_LFSR(3) xnor r_LFSR(2);
  end generate g_LFSR_3;
 
  g_LFSR_4 : if g_Num_Bits = 4 generate
    w_XNOR <= r_LFSR(4) xnor r_LFSR(3);
  end generate g_LFSR_4;
  
  o_LFSR_Data <= r_LFSR(r_LFSR'left downto 1);
  o_LFSR_Done <= '1' when r_LFSR(r_LFSR'left downto 1) = i_Seed_Data else '0';
   
end architecture RTL;