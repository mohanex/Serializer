library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SERIAL is
  generic(
    constant out_width : natural := 1; -- 1 bit en sortie
    constant in_width : natural := 8 -- 1 octet en entree
        );
        
  Port ( 
  data_in : inout STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- byte en entree
  data_out : out STD_LOGIC; -- bits en sortie
  Load : in STD_LOGIC; -- Load Select
  Start : in STD_LOGIC; -- Start/Stop control
  READY : out STD_LOGIC; -- bit de status (READY)
  clk : in STD_LOGIC -- Clock 100MHz
  );
end SERIAL;

architecture Behavioral of SERIAL is
    signal s_stock : STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- vector to store the input data from ram
    
begin
   process(clk,Start)
   variable count : natural range 0 to in_width-1 := 0; -- counter 0 --> 7
    begin
        READY <= '1';
        if Load = '1' then --check if loading is ON
            s_stock <= data_in;
            count := 0;
        end if;
        if rising_edge(clk) then
            if Start = '1' then --check if starting to initialize is ON
                if Load = '0' then --check if loading is OFF (Loading must be off to start serialazation)
                    READY <= '0'; -- toggle off the readiness of the serializer
                    while count<in_width loop --while the counter is minor than 8
                        data_out <= s_stock(count); --take every single bit of the byte and output it
                        count := count+1; -- counter incrementation
                    end loop;
                    count := 0; -- Reset the counter
                    READY <= '1'; -- toggle on the readiness of the serializer
                end if;
            end if;
        end if;
   end process;
end Behavioral;