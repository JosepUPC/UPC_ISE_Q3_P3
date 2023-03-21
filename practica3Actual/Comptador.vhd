----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:25:15 03/21/2023 
-- Design Name: 
-- Module Name:    Comptador - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comptador is
Port (		enable_load_p2s : in  STD_LOGIC;
				clk : in STD_LOGIC;
           salida : out  STD_LOGIC);
end Comptador;

architecture Beh_comp of Comptador is
	signal suma: std_logic_vector(3 downto 0);
begin
	suma<="1001";
	
	process(clk)
	begin
		if (clk'event and clk='1') then
			if(suma<="1001") then
			salida<='1';
			suma<="0000";
			elsif(enable_load_p2s='1')then
				suma <= suma + "0001";
				salida <= '0';
			end if;
		end if;
	end process;

end Beh_comp;

