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
        generic (
            constant ram_width : natural := 8;
            constant addr_width : natural := 12
        );
end tb_RAM;

architecture Behavioral of tb_RAM is

    -- Component declaration for the RAM module
    component RAM is
        generic (
            constant ram_width : natural := 8;
            constant addr_width : natural := 12
        );
        Port (
            BI_DATA   : inout STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0); -- One line of Data in the ram
            addr   : in STD_LOGIC_VECTOR (addr_width-1 DOWNTO 0);
            R_W    : in STD_LOGIC;
            Reset  : in STD_LOGIC;
            clk    : in STD_LOGIC;
            nCS     : in STD_LOGIC
        );
    end component RAM;

    -- signaux
    signal s_BI_DATA : STD_LOGIC_VECTOR (ram_width-1 DOWNTO 0);
    signal s_addr   : STD_LOGIC_VECTOR (addr_width-1 DOWNTO 0);
    signal s_R_W    : STD_LOGIC;
    signal s_reset  : STD_LOGIC;
    signal s_clk    : STD_LOGIC := '0';
    signal s_CS     : STD_LOGIC;

    constant period : time := 20 ns;

begin
    DUT: RAM
        port map (
            BI_DATA => s_BI_DATA,
            addr   => s_addr,
            R_W    => s_R_W,
            Reset  => s_reset,
            clk    => s_clk,
            nCS     => s_CS
        );

    s_clk <= not s_clk after period/2;

    process
        begin
            -- Initialize signals and ram
            wait for period;

            s_addr <= "000000000001";
            s_BI_DATA <="11111111";
            s_reset <= '0';
            s_R_W <= '0';
            s_CS <= '0';
            wait for period;

            s_CS <= '1';
            s_BI_DATA <="ZZZZZZZZ";
            wait for period;

            s_addr <= "000000000001";
            s_reset <= '0';
            s_R_W <= '1';
            s_CS <= '0';
            wait for period;

            s_addr <= "000000000011";
            s_BI_DATA <="11111110";
            s_reset <= '0';
            s_R_W <= '0';
            s_CS <= '0';
            wait for period;

            s_CS <= '1';
            s_BI_DATA <="ZZZZZZZZ";
            wait for period;

            s_addr <= "000000000011";
            s_reset <= '0';
            s_R_W <= '1';
            s_CS <= '0';
            wait for period;

            -- TRY TO RESET
            s_reset <= '1';
            wait for period;

            s_addr <= "000000000011";
            s_reset <= '0';
            s_R_W <= '1';
            s_CS <= '0';
            wait for period;

            s_addr <= "000000000001";
            s_reset <= '0';
            s_R_W <= '1';
            s_CS <= '0';
            wait for period;
            
    end process;
end Behavioral;