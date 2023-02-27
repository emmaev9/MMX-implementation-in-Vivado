----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2022 03:45:07 PM
-- Design Name: 
-- Module Name: SSDCounter_test - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSDCounter_test is
--  Port ( );
end SSDCounter_test;

architecture Behavioral of SSDCounter_test is
component SSDCounter
  Port (CLK: in std_logic;
        button: in std_logic;
        reset: in std_logic;
        countOut: out std_logic_vector(1 downto 0));
end component;
signal CLK:  std_logic;
signal button: std_logic;
signal reset: std_logic;
signal countOut: std_logic_vector(1 downto 0);


begin
    p: SSDCounter port map(CLK=>CLK, button=>button, reset=>reset, countOut=>countOut);
    process
    begin
        CLK <= '1';
        wait for 10 ns;
        CLK <= '0';
        wait for 10 ns;
    end process;
    
    process
    begin
        button <= '0'; wait for 20 ns;
        button <= '1'; wait for 20 ns;
    end process;
    
    process
    begin
        reset <= '0';
        wait for 200 ns;
        reset <= '1';
        wait for 10 ns;
     end process;
end Behavioral;
