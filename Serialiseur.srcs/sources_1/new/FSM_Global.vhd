library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity G_FSM is
    Port ( start_mesure : in std_logic;            -- signal de déclenchement de la mesure
           detection_temps_ecoule : in std_logic;  -- détéction du temps de mesure écoulé (1s par defaut)
           clk : in STD_LOGIC;                     -- clk systeme du FPGA à 100 Mhz
           enable_peripheriques : out STD_LOGIC;   -- signal de sortie d'enable de la FSM (contrôle l'enable des périphériques)
           reset_peripheriques  : out std_logic;   -- signal de sortie de reset de la FSM (contrôle le reset des périphériques)
           reset : in STD_LOGIC);
end G_FSM;

architecture Behavioral of G_FSM is

begin


end Behavioral;
