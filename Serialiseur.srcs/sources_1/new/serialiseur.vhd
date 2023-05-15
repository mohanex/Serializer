library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
  
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
  nCS : in STD_LOGIC; -- not chipselect
  READY : out STD_LOGIC -- status bit (READY)
  );
end SERIAL;

architecture Behavioral of SERIAL is
    signal s_stock : STD_LOGIC_VECTOR (in_width-1 DOWNTO 0) := (others => '0'); -- vector to store the input data from ram
    signal s_READY : STD_LOGIC := '1';
    signal s_count : integer range 0 to in_width-1;
    signal s_data_out : STD_LOGIC;
begin
   SERIALIZING : process(clk, Start)
    variable count : integer range 0 to in_width-1; -- counter 0 --> 7
    begin
        if (rising_edge(clk) and (s_READY = '1' and nCS ='0')) then -- check if loading is ON and serializer is ready for reception
            s_stock <= data_in;
            count := 0;
            --s_count <= count;
            s_READY <= '0'; -- toggle off the readiness of the serializer
            data_out <= 'Z';
            
        elsif (rising_edge(clk) and (Start = '1' and nCS ='0')) then --check if starting to initialize is ON
                if (count<in_width) then --while the counter is minor than 8
                    data_out <= s_stock(count); --take every single bit of the byte and output it
                    --s_data_out <= s_stock(count); --take every single bit of the byte and output it
                    count := count+1; -- counter incrementation
                    --s_count <= count;
                elsif (count=in_width) then
                    data_out <= 'Z';
                    s_READY <= '1'; -- toggle on the readiness of the serializer
                end if;
        end if;
   end process;

   READY <= s_READY;
   --data_out <= s_stock(s_count) when(Start='1' and nCS='0') else 'Z';

end Behavioral;