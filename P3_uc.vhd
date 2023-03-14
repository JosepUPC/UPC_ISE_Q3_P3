library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P3_uc is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        bckin : in STD_LOGIC;
        ircin : in STD_LOGIC;
        enable_s2p : out STD_LOGIC;
        enable_buffer_s2p : out STD_LOGIC;
        enable_load_p2s : out STD_LOGIC;
        enable_shift_p2s : out STD_LOGIC
    );
end P3_uc;

architecture P3_uc_Beh of P3_uc is

    COMPONENT Falling_edge_VHDL
    Port ( clk : in  STD_LOGIC;
           entrada : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC);
    end COMPONENT;

    COMPONENT Rising_edge_VHDL
    Port ( clk : in  STD_LOGIC;
           entrada : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC);
    end COMPONENT;

    begin
    
    P3_uc_C1: Falling_edge_VHDL PORT MAP (
          clk => clk,
          salida => enable_s2p,
          reset => reset,
          entrada => bckin
    );
    
    P3_uc_C2: Rising_edge_VHDL PORT MAP (
          clk => clk,
          salida => enable_buffer_s2p,
          reset => reset,
          entrada => lrcin
    );

    P3_uc_C3: Rising_edge_VHDL PORT MAP (
          clk => clk,
          salida => enable_load_p2s,
          reset => reset,
          entrada => lrcin
    );

    P3_uc_C4: Rising_edge_VHDL PORT MAP (
          clk => clk,
          salida => enable_shift_p2s,
          reset => reset,
          entrada => bckin
    );

end P3_uc_Beh;