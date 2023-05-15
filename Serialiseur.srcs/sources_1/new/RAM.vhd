library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
generic (
    constant ram_depth : natural := 4096;
    constant ram_width : natural := 8;
    constant addr_width : natural := 12
        );
  Port 
    ( 
  BI_DATA : inout STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0); -- One line of Data in the ram
  addr : in STD_LOGIC_VECTOR (addr_width-1 DOWNTO 0); -- address on the ram
  R_W : in STD_LOGIC; --Read/Write signal (1: read / 0:write)
  Reset : in STD_LOGIC; --Reset signal
  clk : in STD_LOGIC; --clock
  nCS : in STD_LOGIC -- chip select(active on 0!!)
    );
end RAM;

architecture Behavioral of RAM is
 
    type RAM is array (0 to ram_depth-1) of std_logic_vector(ram_width-1 downto 0); -- declare a new type named RAM 
    signal ram_data : RAM := (others =>(others => '0'));  --initialize a ram called ram_data of RAM type full of zeros
    signal store_val_out: STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0); -- One line of Data in the ram

begin

    MEM_WRITE: process (clk, addr, nCS, R_W, BI_DATA, Reset)
        begin
        if (Reset ='1') then
            ram_data <= (others => (others => '0'));
        elsif (rising_edge(clk)) then
            if (nCS = '0' and  R_W = '0') then
                ram_data(to_integer(unsigned(addr))) <= BI_DATA;
            end if;
        end if;
    end process;

    -- Haute impedance
    BI_DATA <= store_val_out when (nCS = '0' and R_W = '1') else (others=>'Z');

    MEM_READ: process (clk, addr, nCS, R_W, ram_data, BI_DATA) 
        begin
        if (rising_edge(clk)) then
            if (nCS = '0' and  R_W = '1') then
                store_val_out <= ram_data(to_integer(unsigned(addr)));
            else
                store_val_out <= (others=>'0');
            end if;
        end if;
    end process;

end Behavioral;