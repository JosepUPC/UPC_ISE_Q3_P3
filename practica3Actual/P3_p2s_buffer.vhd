----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:22 03/21/2023 
-- Design Name: 
-- Module Name:    P3_p2s_buffer - Behavioral 
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

entity P3_p2s_buffer is
	Port (
        enable_load_p2s : in STD_LOGIC;
        dDL_in : in STD_LOGIC_VECTOR (19 downto 0);
        dDR_in : in STD_LOGIC_VECTOR (19 downto 0);
		  clk : in STD_LOGIC;
		  dDL_out : out STD_LOGIC_VECTOR (19 downto 0);
        dDR_out: out STD_LOGIC_VECTOR (19 downto 0));
end P3_p2s_buffer;

architecture Ppb_beh of P3_p2s_buffer is

	signal dDL_mid: STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal dDR_mid: STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal total: STD_LOGIC;
	
	COMPONENT Comptador
    Port ( enable_load_p2s : in  STD_LOGIC;
           salida : out  STD_LOGIC;
			  clk : in STD_LOGIC);
    end COMPONENT;

begin
	P3_buffer_C1: Comptador PORT MAP (
          enable_load_p2s => enable_load_p2s,
			 clk => clk,
          salida => total);
	 
	 process(clk)
	 
	 begin
		if (clk'event and clk='1') then
			if(total='1') then
				dDL_mid<=dDL_in;
				dDR_mid<=dDR_in;
			else
				dDL_mid<=dDL_mid;
				dDR_mid<=dDR_mid;
			end if;
		end if;	
	 end process;
	 
dDL_out <= dDL_mid;
dDR_out <= dDR_mid;

end Ppb_beh;

