library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity FSM is
    Port ( 
    
    data_ram : inout std_logic_vector(7 DOWNTO 0);
    addr_ram : out std_logic_vector(11 DOWNTO 0);
    R_W_ram : out STD_LOGIC;
    reset_ram : out STD_LOGIC;
    CS_ram : out STD_LOGIC;

    data_serial : out std_logic_vector(7 DOWNTO 0);
    start_serial : out STD_LOGIC;
    CS_serial : out STD_LOGIC;
    stop_serial : out std_logic;


    clk : in std_logic;
    reset : in STD_LOGIC;
    start : in std_logic
    
    );
end FSM;

architecture Behavioral of FSM is
    type FSM_Status is (IDLE, Recherche, Reception, Envoi, Incrementation);
    signal state,next_state : FSM_Status;
begin
    -- Registers for data storage
    signal fifo : std_logic_vector(7 downto 0) := (others => '0');
    variable data_counter : integer range 0 to 4096 := 0;
    data_serial <= fifo(0);

    process(clk) is
        begin
            if rising_edge(Clk) then
                if reset = '1' then
                    State <= IDLE;
                    addr_ram <= (others => '0');

                elsif rising_edge(clk) then
                    state <= next_state;

                    case State is
                        when IDLE =>
                        if reset = '0' then
                            next_state <= Recherche;
                        else
                            next_state <= IDLE;
                        end if;


                        when IDLE => Recherche
                            R_W_ram <= '1';
                            CS_ram <= '0';
                            addr_ram <= std_logic_vector( to_unsigned( data_counter, addr_ram'length)); -- convert my data counter to std_logic_vector (4096)10=(1000000000000)2 par exemple
                            next_state <= ;


                    end case;
                end if;
            end if;
    end process;

end Behavioral;