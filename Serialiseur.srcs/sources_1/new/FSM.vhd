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
    reset : in STD_LOGIC
    
    );
end FSM;

architecture Behavioral of FSM is
    type FSM_Status is (idle, Recherche, Reception, Incrementation);
    signal status : FSM_Status;
begin
    process(clk) is
        begin
            if rising_edge(Clk) then
                if reset = '1' then
                    State <= idle;
                elsif rising_edge(clk) then

                    case State is
                        when <state_name> =>
                            <set_outputs_for_this_state_here>
                            if <state_change_condition_is_true> then
                                State <= <next_state_name>;
                            end if;
                        ...
                    end case;
                end if;
            end if;
    end process;

end Behavioral;
