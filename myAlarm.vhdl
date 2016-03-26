-- Created by Joseph Matthew R. Marcos

library IEEE; use IEEE.std_logic_1164.all;

entity myAlarm is
    -- declare ports
    port(
        alarm: out std_logic;

        inA: in std_logic;
        inB: in std_logic;
        inC: in std_logic;

        outA: in std_logic;
        outB: in std_logic;
        outC: in std_logic
    );
end entity myAlarm;

architecture myAlarm of myAlarm is
begin
    process (inA, inB, inC, outA, outB, outC) is
    begin
        alarm <= (inA or inB or inC) and (outA or outB or outC);
    end process;
end architecture myAlarm;
