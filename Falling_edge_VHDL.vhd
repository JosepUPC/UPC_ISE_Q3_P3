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

entity Falling_edge_VHDL is
    Port ( clk : in  STD_LOGIC;
           entrada : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC);
end Falling_edge_VHDL;

architecture Behavioral of Falling_edge_VHDL is

COMPONENT DFF_VHDL
	Port ( clk : in  STD_LOGIC;
           d : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC);
END COMPONENT;

SIGNAL q0,q1 : STD_LOGIC;
SIGNAL temp: STD_LOGIC;

begin

D0 : DFF_VHDL port map (clk,entrada,reset,q0);
D1 : DFF_VHDL port map (clk,q0,reset,q1);

temp <= ( not q0) and (q1);

salida <= temp;

end Behavioral;