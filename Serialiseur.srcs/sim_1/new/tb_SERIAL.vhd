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
    component SERIAL is
        generic(
            constant out_width : natural := 1; -- 1 bit en sortie
            constant in_width : natural := 8 -- 1 octet en entree
                );
        Port ( 
          data_in : in STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- byte en entree
          data_out : out STD_LOGIC; -- bits en sortie
          Start : in STD_LOGIC; -- Start/Stop control
          nCS : in STD_LOGIC;
          READY : out STD_LOGIC; -- bit de status (READY)
          clk : in STD_LOGIC -- Clock 100MHz
        );
    end component SERIAL;

    -- signaux
    signal s_data_in : STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- byte en entree
    signal s_data_out : STD_LOGIC; -- bits en sortie
    signal s_Start : STD_LOGIC; -- Start/Stop control
    signal s_READY : STD_LOGIC; -- bit de status (READY)
    signal s_clk : STD_LOGIC := '0' ; -- Clock 100MHz
    signal s_nCS :  STD_LOGIC;

    constant period : time := 20ns;

begin
    DUT : SERIAL
        port map(
            data_in => s_data_in,
            data_out => s_data_out,
            Start => s_Start,
            READY => s_READY,
            nCS => s_nCS,
            clk => s_clk
        );

    s_clk <= not s_clk after period/2;

    process 
        begin
            wait for period;

            s_Start <= '0';
            s_nCS <= '0';
            s_data_in <="10101010";
            wait for period;

            
            s_Start <= '1';
            s_nCS <= '0';
            wait for period*8;

            s_Start <= '0';
            s_nCS <= '0';
            s_data_in <="00011000";
            wait for period;

            s_Start <= '1';
            s_nCS <= '0';
            wait for period*8;






    end process;

end Behavioral;