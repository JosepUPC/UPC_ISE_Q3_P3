----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:54:39 03/11/2013 
-- Design Name: 
-- Module Name:    Rising_edge_VHDL - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF_VHDL is
    Port ( clk : in  STD_LOGIC;
           d : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC);
end DFF_VHDL;

architecture Behavioral of DFF_VHDL is

begin

process(clk,reset)
begin
	if clk'event and clk='1' then
		if (reset='1') then
			q<='0';
		else
			q <= d;
		end if;
	else null;
	end if;

end process;

end Behavioral;

