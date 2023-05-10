library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SERIAL is
  generic(
    constant out_width : natural := 1; -- 1 bit en sortie
    constant in_width : natural := 8 -- 1 octet en entrée
        );
        
  Port ( 
  data_in : inout STD_LOGIC_VECTOR (in_width-1 DOWNTO 0); -- byte en entrée
  data_out : out STD_LOGIC; -- bits en sortie
  Load : in STD_LOGIC; -- Load Select
  Start : in STD_LOGIC; -- Start/Stop control
  Stop : out STD_LOGIC; -- bit de status
  clk : in STD_LOGIC -- Clock 100MHz
  );
end SERIAL;

architecture Behavioral of SERIAL is
    signal s_stock : STD_LOGIC_VECTOR (in_width-1 DOWNTO 0);
    
begin
   process(clk,Start)
   variable count : natural range 0 to in_width-1 := 0;
    begin
        if Start = '1' then
            if Load = '1' then
                s_stock <= data_in;
                Stop <= '1';
             end if;
        end if;
        if rising_edge(clk) then
            if Start = '1' then 
                if Load = '0' then
                    if count<in_width then
                        data_out <= s_stock(count);
                        count := count+1;
                        Stop <= '0';
                    else 
                        s_stock <= data_in;
                        Stop <= '1';
                        count := 0;
                    end if;
                end if;
            elsif Start = '0' then
                Stop <= '1';
            end if;   
        end if;
   end process;
end Behavioral;