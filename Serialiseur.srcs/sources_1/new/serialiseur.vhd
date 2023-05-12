library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
  
--microblaze

entity SERIAL is
  generic(
    constant out_width : natural := 1; -- 1 bit en sortie
    constant in_width : natural := 8 -- 1 octet en entree
    );
        
  Port ( 
  data_in : in STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- byte en entree
  Start : in STD_LOGIC; -- Start/Stop control
  clk : in STD_LOGIC; -- Clock 100MHz
  data_out : out STD_LOGIC; -- bits en sortie
  nCS : in STD_LOGIC;
  READY : out STD_LOGIC -- bit de status (READY)
  );
end SERIAL;

architecture Behavioral of SERIAL is
    signal s_stock : STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- vector to store the input data from ram
    signal s_READY : STD_LOGIC := '1';

begin
   process(clk)
    variable count : natural range 0 to in_width-1; -- counter 0 --> 7
    begin
        if (s_READY = '1' and nCS ='0') then -- check if loading is ON and serializer is ready for reception
            s_stock <= data_in;
            count := 0;
            s_READY <= '0'; -- toggle off the readiness of the serializer
        elsif rising_edge(clk) then
            if (Start = '1' and nCS ='0') then --check if starting to initialize is ON
                if (count<in_width) then --while the counter is minor than 8
                    data_out <= s_stock(count); --take every single bit of the byte and output it
                    count := count+1; -- counter incrementation
                elsif (count>=in_width) then
                    s_READY <= '1'; -- toggle on the readiness of the serializer
                    count := 0; -- Reset the counter
                end if;
            end if;
        end if;
   end process;

   READY <= s_READY;

end Behavioral;

--if Load = '0' then --check if loading is OFF (Loading must be off to start serialezation)