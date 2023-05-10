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
generic(
    constant ram_depth : natural := 4096;
    constant ram_width : natural := 8;
    constant addr_width : natural := 12
        );
  Port ( 
  
  data   : INOUT STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0);
  addr : in STD_LOGIC_VECTOR (addr_width-1 DOWNTO 0);
  R_W : in STD_LOGIC;
  Reset : in STD_LOGIC;
  clk : in STD_LOGIC; 
  CS : in STD_LOGIC

  );
end RAM;

architecture Behavioral of RAM is

 
type ram_type is array (0 to ram_depth - 1) of std_logic_vector(ram_width - 1 downto 0);
    signal ram_data : ram_type := (others => (others => '0'));
begin
    process(clk,Reset)
        begin
        if rising_edge(clk) then
            if reset = '1' then 
                ram_data <= (others => (others => '0'));
            elsif CS = '0' then
                if R_W = '1' then
                    data <= ram_data(to_integer(unsigned(addr)));
                elsif R_W = '0' then
                    ram_data(to_integer(unsigned(addr))) <= data;
                end if;
             end if;
        end if;
    end process;
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