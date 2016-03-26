-- Created by Joseph Matthew R. Marcos
library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_alarm is
    -- constants
    constant DELAY: time := 10 ns;
end entity tb_alarm;

architecture tb of tb_alarm is
    signal inA, inB, inC: std_logic;
    signal outA, outB, outC: std_logic;
    signal alarm: std_logic;

    component alarm is
        -- ports
        port(
            alarm: out std_logic;
            inA: in std_logic;
            inB: in std_logic;
            inC: in std_logic;
            outA: in std_logic;
            outB: in std_logic;
            outC: in std_logic
        );
    end component alarm;

begin
    UUT: component alarm port map(
        alarm, inA, inB, inC, outA, outB, outC
    );

    main: process is
        variable temp: unsigned(5 downto 0);
        variable expected_alarm: std_logic;
        variable error_count: integer := 0;

    begin
        report "Start simulation.";

        for count in 0 to 63 loop

            temp := TO_UNSIGNED(count, 6);
            -- set input values from temp
            inA  <= std_logic(temp(5));
            inB  <= std_logic(temp(4));
            inC  <= std_logic(temp(3));
            outA <= std_logic(temp(2));
            outB <= std_logic(temp(1));
            outC <= std_logic(temp(0));

            -- for case 0
            if(count = 0) then
                expected_alarm := '0'
            else
                -- set expected encoded base on value of count
                if(count = 1) then expected_alarm := '1';
                elsif(count < 4) then expected_alarm := '1';
                elsif(count < 8) then expected_alarm := '1';
                elsif(count < 16) then expected_alarm := '1';
                elsif(count < 32) then expected_alarm := '1';
                elsif(count < 64) then expected_alarm := '1';
                elsif(count < 128) then expected_alarm := '1';
                else expected_encoded := '0';
                end if;
            end if;

            wait for DELAY;

            -- assert the test case
            assert((expected_valid = valid) and (expected_encoded = encoded))
                report "ERROR: Expected valid " & std_logic'image(expected_valid) & " and encoded " & std_logic'image(expected_encoded(1)) & std_logic'image(expected_encoded(0)) & " at time " & time'image(now);

            -- increment error_count on error
            if((expected_valid /= valid) or (expected_encoded /= encoded)) then
                error_count := error_count + 1;
            end if;
        end loop;

        wait for DELAY;

        -- display errors if any
        assert(error_count = 0)
            report "ERROR: There were " & integer'image(error_count) & " errors!";

        -- display no errors if none
        if(error_count = 0) then
            report "Simulation completed with NO errors.";
        end if;

        wait;
    end process;
end architecture tb;
