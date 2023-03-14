library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P3_codec is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        bckin : in STD_LOGIC;
        ircin : in STD_LOGIC;
        dout : in STD_LOGIC;
        din : out STD_LOGIC
    );
end P3_codec;

architecture P3_codec_Beh of P3_codec is

    SIGNAL  S_enable_s2p, 
            S_enable_buffer_s2p, 
            S_enable_load_p2s, 
            S_enable_shift_p2s: STD_LOGIC;
    SIGNAL  S_data_ADC_L,
            S_data_ADC_R: STD_LOGIC_VECTOR (19 downto 0);

    COMPONENT S2P_all
        Port ( dout : in STD_LOGIC;
            enable_s2p in STD_LOGIC;: 
            enable_buffer_s2p : in STD_LOGIC;
            reset : in STD_LOGIC;
            clk : in STD_LOGIC;
            data_ADC_L : out STD_LOGIC_VECTOR (19 downto 0);
            data_ADC_R : out STD_LOGIC_VECTOR (19 downto 0)
            );
    end COMPONENT;

    COMPONENT P3_uc
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
    end COMPONENT;

    COMPONENT P3_p2s_core
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            enable_load_p2s : in STD_LOGIC;
            enable_shift_p2s : in STD_LOGIC;
            data_DAC_L : in STD_LOGIC_VECTOR (19 downto 0);
            data_DAC_R : in STD_LOGIC_VECTOR (19 downto 0);
            din : out STD_LOGIC
        );
    end COMPONENT;

    begin
    
    P3_codec_C1: S2P_all PORT MAP (
          dout => dout,
          clk => clk,
          reset => reset,
          enable_s2p => S_enable_s2p,
          enable_buffer_s2p => S_enable_buffer_s2p,
          data_ADC_L => S_data_ADC_L,
          data_ADC_R => S_data_ADC_R
    );
    
    P3_codec_C2: P3_uc PORT MAP (
          clk => clk,
          reset => reset,
          bckin => bckin,
          ircin => ircin,
          enable_s2p => S_enable_s2p,
          enable_buffer_s2p => S_enable_buffer_s2p,
          enable_load_p2s => S_enable_load_p2s,
          enable_shift_p2s => S_enable_shift_p2s,
    );

    P3_codec_C3: P3_p2s_core PORT MAP (
          clk => clk,
          reset => reset,
          enable_load_p2s => S_enable_load_p2s,
          enable_shift_p2s => S_enable_shift_p2s,
          data_DAC_L => S_data_ADC_L,
          data_DAC_R => S_data_ADC_R,
          din => din
    );

end P3_codec_Beh;