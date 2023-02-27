----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2022 02:19:22 PM
-- Design Name: 
-- Module Name: TFullAdder - Behavioral
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

entity TFullAdder is
 -- Port (A: in );
end TFullAdder;

architecture Behavioral of TFullAdder is
component FullAdder 
    Port ( x,y: in std_logic;
           cin: in std_logic;
           cout: out std_logic;
           s: out std_logic;
           enable: in std_logic);
end component;
signal x,y: std_logic;
signal cin: std_logic;
signal cout: std_logic;
signal s: std_logic;
signal enable: std_logic;
begin
    p: FullAdder port map (x,y,cin,cout,s,enable);
    process
    begin
        x<='1';
        y<='0';
        cin <= '1';
        enable <= '1';
        wait for 50 ns;
        
        x<='1';
         y<='1';
                cin <= '1';
                enable <= '1';
                wait for 50 ns;
                
                   enable <= '0';
                             wait for 50 ns;
      end process;   
                
                
        


end Behavioral;
