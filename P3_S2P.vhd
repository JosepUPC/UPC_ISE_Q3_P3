library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P3_S2P is
    Port ( clk : in STD_LOGIC;
    dout : in STD_LOGIC;
    enable_s2p : in STD_LOGIC;
    reset : in STD_LOGIC;
    data_s2p: out STD_LOGIC_VECTOR (63 downto 0));
end P3_S2P;

architecture P3_S2P_beh of P3_S2P is

signal reg_int : std_logic_vector(63 downto 0);

begin

    process(clk, reset)
        begin
            if reset = '1' then
                reg_int <= (others => '0');
            else
                if (clk'event and clk='1') then
                    if enable_s2p = '1' then
                        reg_int <= reg_int(62 downto 0) & dout;
                    end if;
                end if;
            end if;
    end process;
    data_s2p <= reg_int;

end P3_S2P_beh;