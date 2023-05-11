----------------------------------------------------------------------------------
-- Company: SIRENTest
-- Engineer: 
-- 
-- Create Date: 10.05.2023 15:08:24
-- Design Name: 
-- Module Name: tb_RAM - Behavioral
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

entity tb_RAM is
end tb_RAM;

architecture Behavioral of tb_RAM is

    -- Component declaration for the RAM module
    component RAM is
        generic (
            constant ram_width : natural := 8;
            constant addr_width : natural := 12
        );
        Port (
            data   : INOUT STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0);
            addr   : in STD_LOGIC_VECTOR (addr_width-1 DOWNTO 0);
            R_W    : in STD_LOGIC;
            Reset  : in STD_LOGIC;
            clk    : in STD_LOGIC;
            CS     : in STD_LOGIC
        );
    end component RAM;

    -- signaux
    constant ram_width : natural := 8;
    constant addr_width : natural := 12;
    signal s_data   : STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0);
    signal s_addr   : STD_LOGIC_VECTOR (addr_width-1 DOWNTO 0);
    signal s_R_W    : STD_LOGIC;
    signal s_reset  : STD_LOGIC;
    signal s_clk    : STD_LOGIC := '0';
    signal s_CS     : STD_LOGIC;

begin
    uut: RAM
        port map (
            data   => s_data,
            addr   => s_addr,
            R_W    => s_R_W,
            Reset  => s_reset,
            clk    => s_clk,
            CS     => s_CS
        );

    process
    begin
        while now < 1000 ns loop
            s_clk <= '0';
            wait for 5 ns;
            s_clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process ;

    tb_simulation: process
    begin
        -- Initialize signals
        s_reset <= '1';
        s_R_W <= '0';
        s_CS <= '0';
        s_addr <= (others => '0');
        s_data <= (others => '0');
        wait for 10 ns;

        -- Test write operation
        s_reset <= '0';
        s_R_W <= '0';
        s_CS <= '0';
        s_addr <= "000000000001"; -- Set the address to write
        s_data <= "10101010"; -- Set the data to be written

        wait for 20 ns; -- Wait for write operation to complete

        -- Test read operation
        s_R_W <= '1';
        s_CS <= '0';
        s_addr <= "000000000001"; -- Set the address to read

        wait for 10 ns; -- Wait for read operation to complete

        -- Test write operation
        s_reset <= '0';
        s_R_W <= '0';
        s_CS <= '0';
        s_addr <= "000000001111"; -- Set the address to write
        s_data <= "11111111"; -- Set the data to be written

        wait for 20 ns; -- Wait for write operation to complete

        -- Test read operation
        s_R_W <= '1';
        s_CS <= '0';
        s_addr <= "000000001111"; -- Set the address to read

        wait for 10 ns; -- Wait for read operation to complete

        -- Test write operation
        s_reset <= '0';
        s_R_W <= '0';
        s_CS <= '0';
        s_addr <= "000011001111"; -- Set the address to write
        s_data <= "10111111"; -- Set the data to be written

        wait for 20 ns; -- Wait for write operation to complete

        -- Test read operation
        s_R_W <= '1';
        s_CS <= '0';
        s_addr <= "000011001111"; -- Set the address to read

        wait for 10 ns; -- Wait for read operation to complete

        --TEST BUT WITH SOME MISCONFIGURATION
        s_reset <= '0';
        s_R_W <= '0';
        s_CS <= '1';
        s_addr <= "000011001110"; -- Set the address to write
        s_data <= "10111110"; -- Set the data to be written

        wait for 20 ns; -- Wait for write operation to complete

        -- Test read operation
        s_R_W <= '1';
        s_CS <= '0';
        s_addr <= "000011001110"; -- Set the address to read

        wait for 10 ns; -- Wait for read operation to complete

        wait;
    end process tb_simulation;
end Behavioral;