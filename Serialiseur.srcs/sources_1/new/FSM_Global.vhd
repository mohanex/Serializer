library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity G_FSM is
    Port ( start_mesure : in std_logic;            -- signal de d�clenchement de la mesure
           detection_temps_ecoule : in std_logic;  -- d�t�ction du temps de mesure �coul� (1s par defaut)
           clk : in STD_LOGIC;                     -- clk systeme du FPGA � 100 Mhz
           enable_peripheriques : out STD_LOGIC;   -- signal de sortie d'enable de la FSM (contr�le l'enable des p�riph�riques)
           reset_peripheriques  : out std_logic;   -- signal de sortie de reset de la FSM (contr�le le reset des p�riph�riques)
           reset : in STD_LOGIC);
end G_FSM;

architecture Behavioral of G_FSM is

begin


end Behavioral;
