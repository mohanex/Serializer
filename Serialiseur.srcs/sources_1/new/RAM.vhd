----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 11:52:02
-- Design Name: 
-- Module Name: Top_FPGA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
generic (
    constant ram_depth : natural := 4096;
    constant ram_width : natural := 8;
    constant addr_width : natural := 12
        );
  Port ( 
  
  data_out   : out STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0); -- One line of Data in the ram
  data_in   : in STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0); -- One line of Data in the ram
  addr : in STD_LOGIC_VECTOR (addr_width-1 DOWNTO 0); -- address on the ram
  R_W : in STD_LOGIC; --Read/Write signal (1: read / 0:write)
  Reset : in STD_LOGIC; --Reset signal
  clk : in STD_LOGIC; --clock
  nCS : in STD_LOGIC -- chip select(active on 0!!)

  );
end RAM;

architecture Behavioral of RAM is
 
    type RAM is array (0 to ram_depth-1) of std_logic_vector(ram_width-1 downto 0); -- declare a new type named RAM 
    signal ram_data : RAM := (others => "00000000");  --initialize a ram called ram_data of RAM type full of zeros

begin
    process(clk,Reset,nCS)
        begin
        if (Reset = '1') then 
            ram_data <= (others => "00000000"); -- clear the ram
        elsif (rising_edge(clk)) then
            if (nCS = '0') then -- check the chipselect
                if (R_W = '0') then -- check if its write
                    ram_data(to_integer(unsigned(addr))) <= data_in; -- put data into memory onto the adrress given
                end if;
            end if;
        end if;
    end process;
    data_out <= ram_data(to_integer(unsigned(addr))); -- pull out data from memory adrress given to data out
end Behavioral;

--initlizing from file 
--type RamType is array(0 to 7) of bit_vector(31 downto 0);
--impure function InitRamFromFile (RamFileName : in string) return RamType is
--FILE RamFile : text is in RamFileName;
--variable RamFileLine : line;
--variable RAM : RamType;
--begin
--for I in RamType'range loop
--readline (RamFile, RamFileLine);
--read (RamFileLine, RAM(I));
--end loop;
--return RAM;
--end function;
--signal RAM : RamType := InitRamFromFile("rams_20c.data"); 