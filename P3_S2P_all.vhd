library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity S2P_all is
    Port ( dout : in STD_LOGIC;
    enable_s2p in STD_LOGIC;: 
    enable_buffer_s2p : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    data_ADC_L : out STD_LOGIC_VECTOR (19 downto 0);
    data_ADC_R : out STD_LOGIC_VECTOR (19 downto 0));

end S2P_all;

architecture S2P_all_beh of S2P_all is

    SIGNAL S_data_s2p: STD_LOGIC_VECTOR(63 downto 0);

    COMPONENT S2P_buffer
    PORT(
         data_s2p : IN  std_logic_vector(63 downto 0);
         enable_buffer_s2p : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         data_ADC_L : OUT  std_logic_vector(19 downto 0);
         data_ADC_R : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;

    COMPONENT P3_S2P
    PORT(
         clk : IN  std_logic;
         dout : IN  std_logic;
         enable_s2p : IN  std_logic;
         reset : IN  std_logic;
         data_s2p : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;

    begin

    S2P_all_C1: P3_S2P PORT MAP (
          clk => clk,
          dout => dout,
          enable_s2p => enable_s2p,
          reset => reset,
          data_s2p => S_data_s2p
    );

    S2P_all_C2: S2P_buffer PORT MAP (
          data_s2p => S_data_s2p,
          enable_buffer_s2p => enable_buffer_s2p,
          reset => reset,
          clk => clk,
          data_ADC_L => data_ADC_L,
          data_ADC_R => data_ADC_R
    );

end S2P_all_beh;

