library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_SERIAL is
        generic
        (
            constant out_width : natural := 1; -- 1 bit en sortie
            constant in_width : natural := 8 -- 1 octet en entree
    );
end tb_SERIAL;

architecture Behavioral of tb_SERIAL is
    component SERIALIZER is
        generic(
            constant out_width : natural := 1; -- 1 bit en sortie
            constant in_width : natural := 8 -- 1 octet en entree
                );
                
        Port ( 
          data_in : in STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- byte en entree
          data_out : out STD_LOGIC; -- bits en sortie
          Load : in STD_LOGIC; -- Load Select
          Start : in STD_LOGIC; -- Start/Stop control
          READY : out STD_LOGIC; -- bit de status (READY)
          clk : in STD_LOGIC -- Clock 100MHz
        );
    end component SERIALIZER;

    signal s_data_in : STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- byte en entree
    signal s_data_out : STD_LOGIC; -- bits en sortie
    signal s_Load : STD_LOGIC; -- Load Select
    signal s_Start : STD_LOGIC; -- Start/Stop control
    signal s_READY : STD_LOGIC; -- bit de status (READY)
    signal s_clk : STD_LOGIC; -- Clock 100MHz

    constant period : time := 20ns;

begin
    DUT : SERIALIZER
        port map(
            data_in => s_data_in,
            data_out => s_data_out,
            Load => s_Load,
            Start => s_Start,
            READY => s_READY,
            clk => s_clk
        );
    process 
        begin
            wait for period;
            s_data_in <="10101010";
            wait for period;

            s_Load <= '1';
     end process;
end Behavioral;
