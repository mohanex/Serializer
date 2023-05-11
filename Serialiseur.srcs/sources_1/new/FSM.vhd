library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity FSM is
    Port ( 
    
    data_ram : in std_logic_vector(7 DOWNTO 0);
    addr_ram : out std_logic_vector(11 DOWNTO 0);
    R_W_ram : out STD_LOGIC;
    reset_ram : out STD_LOGIC;
    CS_ram : out STD_LOGIC;

    data_serial : out std_logic_vector(7 DOWNTO 0);
    start_serial : out STD_LOGIC;
    CS_serial : out STD_LOGIC;
    stop_serial : in std_logic;


    clk : in std_logic;
    reset : in STD_LOGIC;
    start : in std_logic
    
    );
end FSM;

architecture Behavioral of FSM is
    type FSM_Status is (IDLE, Recherche, Reception, Envoi, Incrementation);
    signal state,next_state : FSM_Status;
    signal fifo : std_logic_vector(7 downto 0) := (others => '0');

begin
    -- Registers for data storage

    process(clk) is
        variable data_counter : integer range 0 to 4096 := 0;
        begin
            data_serial <= fifo;
            if rising_edge(Clk) then
                if reset = '1' then
                    State <= IDLE;
                    addr_ram <= (others => '0');

                else
                    state <= next_state;

                    case State is
                        when IDLE =>
                        if reset = '0' then
                            next_state <= Recherche;
                            data_counter := 0;
                        else
                            next_state <= IDLE;
                        end if;

                        when Recherche =>
                        if reset = '0' then
                            R_W_ram <= '1'; --read mode on ram
                            CS_ram <= '0';  --chip select on ram
                            reset_ram <= '0'; --NoRES ram
                            addr_ram <= std_logic_vector( to_unsigned( data_counter, addr_ram'length)); -- convert my data counter to std_logic_vector (4096)10=(1000000000000)2 par exemple
                            next_state <= Reception;
                        else
                            next_state <= IDLE;
                        end if;

                        when Reception =>
                        if reset = '0' then
                            fifo <= data_ram; --stock data coming from ram into the fifo
                            if stop_serial='1' then --check if serlializer block is READY to receive
                                next_state <= Envoi;
                            end if;
                        else
                            next_state <= IDLE;
                        end if;

                        when Envoi => 
                        if reset = '0' then
                            data_serial <= fifo; --transfer the content of fifo into the input of serializer block
                            start_serial <= '1';
                            CS_serial <= '0';
                            next_state <= Incrementation;
                        else
                            next_state <= IDLE;
                        end if;


                        when Incrementation => 
                        if reset = '0' then
                            if data_counter >= 4096 then
                                next_state <= IDLE;
                            end if;

                            data_counter := data_counter+1;
                            next_state <= Recherche;

                        else
                            next_state <= IDLE;
                        end if;

                    end case;
                end if;
            end if;
    end process;
end Behavioral;