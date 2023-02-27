library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
  Port (SW: in std_logic_vector(12 downto 0);
        AddSel: out std_logic_vector(7 downto 0);
        ShiftSel: out std_logic_vector(7 downto 0);
        RegASel: out std_logic_vector(2 downto 0);
        RegBSel: out std_logic_vector(2 downto 0);
        RegWrite: out std_logic;
        RegWriteSel: out std_logic_vector(2 downto 0);
        instruction: out std_logic_vector(2 downto 0);
        aluSrcB: out std_logic;
        ROMsel: out std_logic_vector(2 downto 0)
        );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
    process(SW)
    begin
        
        AddSel <= "00000000";
        ShiftSel <= "00000000";
        RegASel <= "000";
        RegBSel <= "001";
        RegWrite <= '0';
        RegWriteSel <= "000";
        instruction <= "000";
        aluSrcB <= '0';
        ROMsel <= "000";
        case SW is
            when "0000000000001" => --addb  SW0
                regASel <= "000";
                regBSel <= "001";
                AddSel <= "00000000";
                RegWrite <= '1';
                RegWriteSel <= "011";
                instruction <= "000";
                
            when "0000000000010" => --addw  sw1
                regASel <= "000";
                regBSel <= "001";
                AddSel <= "01010101";
                RegWrite <= '1';
                RegWriteSel <= "011";
                 instruction <= "000";
                
            when "0000000000100" => --addd   sw2
                 regASel <= "000";
                 regBSel <= "001";
                 AddSel <= "01110111";
                 RegWrite <= '1';
                 RegWriteSel <= "011";
                  instruction <= "000";
                 
            when "0000000001000" => --addq sw3
                 regASel <= "000";
                 regBSel <= "001";
                 AddSel <= "11111111";
                 RegWrite <= '1';
                 RegWriteSel <= "011";
                  instruction <= "000";
                 
            when "0000000010000" => --movd sw4
                 regASel <= "000";
                 regBSel <= "001";
                 aluSrcB <= '1';
                 instruction <= "101";
                 ROMSel <= "000";
                 regWrite <= '1';
                 regWriteSel <= "000";
                 
            when "0000000100000" => --pmaddwd sw5
                regASel <= "000";
                regBSel <= "001";
                instruction <= "010";
                regWrite <= '1';
                regWriteSel <= "000";
                
            when "0000001000000" => --pcmpeqw sw6
                regASel <= "000";
                regBSel <= "001";
                instruction <= "100";
                regWrite <= '1';
                regWriteSel <= "000";
                
            when "0000010000000" => --pand sw7
                regASel <= "000";
                regBSel <= "001";
                instruction <= "001";
                regWrite <= '1';
                regWriteSel <= "011";
            
            when "0000100000000" => --psrab sw8
                regASel <= "000";
                regBSel <= "010";
                instruction <= "011";
                regWrite <= '1';
                regWriteSel <= "000";
                shiftSel <= "11111111";
                
            when "0001000000000" => --psrad sw9
                regASel <= "000";
                regBSel <= "010";
                instruction <= "011";
                regWrite <= '1';
                regWriteSel <= "000";
                shiftSel <= "10101010";
                
            when "0010000000000" => --psraw sw10
                regASel <= "000";
                regBSel <= "010";
                instruction <= "011";
                regWrite <= '1';
                regWriteSel <= "000";
                shiftSel <= "10001000";
                
            when "0100000000000" => --psraq sw11
                regASel <= "000";
                regBSel <= "010";
                instruction <= "011";
                regWrite <= '1';
                regWriteSel <= "000";
                shiftSel <= "10000000";
                
            when "1000000000000" =>-- sw12
                regASel <= "011";
                regWrite <= '0';
            when others =>   
                   AddSel <= "00000000";
                   ShiftSel <= "00000000";
                   RegASel <= "000";
                   RegBSel <= "001";
                   RegWrite <= '0';
                   RegWriteSel <= "000";
                   instruction <= "000";
                   aluSrcB <= '0';
                   ROMsel <= "000";
        end case;
    end process;


end Behavioral;
