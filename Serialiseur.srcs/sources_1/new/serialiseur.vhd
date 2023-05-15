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
  Write : in STD_LOGIC; -- Write control
  clk : in STD_LOGIC; -- Clock 100MHz
  data_out : out STD_LOGIC; -- bits en sortie
  nCS : in STD_LOGIC; -- not chipselect
  READY : out STD_LOGIC -- status bit (READY)
  );
end SERIAL;

architecture Behavioral of SERIAL is
    signal s_stock : STD_LOGIC_VECTOR (in_width-1 DOWNTO 0) := (others => '0'); -- vector to store the input data from ram
    signal s_READY : STD_LOGIC := '1';
    
begin
   SERIALIZING : process(clk, Write)
    variable count : integer range 0 to in_width-1; -- counter 0 --> 7
    begin
        if(nCS ='0') then
            if (rising_edge(clk) and s_READY = '1' and Write='1') then -- check if loading is ON and serializer is ready for reception
                s_stock <= data_in; -- save data in in the internal signal
                count := 0; -- initialize counter
                s_READY <= '0'; -- toggle off the readiness of the serializer
                data_out <= 'Z'; -- High impedance 
                
            elsif (rising_edge(clk) and Write = '0') then --check if Start command is given
                while (count<s_stock'length) loop --while the counter is minor than 8
                    data_out <= s_stock(count); --take every single bit of the byte and output it
                    count := count+1; -- counter incrementation
                end loop;
                data_out <= 'Z';
                s_READY <= '1'; -- toggle on the readiness of the serializer
            end if;
        end if;
   end process;

   READY <= s_READY;
   --data_out <= s_stock(s_count) when(Write='1' and nCS='0') else 'Z';

end Behavioral;