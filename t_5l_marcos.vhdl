-- Created by Joseph Matthew R. Marcos

library IEEE; use IEEE.std_logic_1164.all;

entity t_5l_marcos is
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
end entity t_5l_marcos;

architecture t_5l_marcos of t_5l_marcos is
begin
    process (inA, inB, inC, outA, outB, outC) is
    begin
        alarm <= (inA or inB or inC) and (outA or outB or outC);
    end process;
end architecture t_5l_marcos;
