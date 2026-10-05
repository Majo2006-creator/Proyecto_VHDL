library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_adder_2bit is
end entity tb_adder_2bit;

architecture Behavioral of tb_adder_2bit is

    signal A     : std_logic_vector(1 downto 0);
    signal B     : std_logic_vector(1 downto 0);
    signal SUM   : std_logic_vector(1 downto 0);
    signal CARRY : std_logic;

begin

    DUT: entity work.adder_2bit
        port map(
            A     => A,
            B     => B,
            SUM   => SUM,
            CARRY => CARRY
        );

    stimulus: process
    begin

        -- 00 + 00 = 000
        A <= "00";
        B <= "00";
        wait for 10 ns;

        assert (SUM = "00" and CARRY = '0')
            report "ERROR: 00 + 00"
            severity error;

        -- 01 + 01 = 010
        A <= "01";
        B <= "01";
        wait for 10 ns;

        assert (SUM = "10" and CARRY = '0')
            report "ERROR: 01 + 01"
            severity error;

        -- 01 + 10 = 011
        A <= "01";
        B <= "10";
        wait for 10 ns;

        assert (SUM = "11" and CARRY = '0')
            report "ERROR: 01 + 10"
            severity error;

        -- 10 + 10 = 100
        A <= "10";
        B <= "10";
        wait for 10 ns;

        assert (SUM = "00" and CARRY = '1')
            report "ERROR: 10 + 10"
            severity error;

        -- 11 + 01 = 100
        A <= "11";
        B <= "01";
        wait for 10 ns;

        assert (SUM = "00" and CARRY = '1')
            report "ERROR: 11 + 01"
            severity error;

        -- 11 + 11 = 110
        A <= "11";
        B <= "11";
        wait for 10 ns;

        assert (SUM = "10" and CARRY = '1')
            report "ERROR: 11 + 11"
            severity error;

        report "Simulacion del sumador finalizada correctamente."
            severity note;

        wait;

    end process;

end architecture Behavioral;
