library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparator2bit is
end entity tb_comparator2bit;

architecture Behavioral of tb_comparator2bit is

    signal A  : std_logic_vector(1 downto 0);
    signal B  : std_logic_vector(1 downto 0);

    signal GT : std_logic;
    signal EQ : std_logic;
    signal LT : std_logic;

begin

    DUT: entity work.comparator2bit
        port map(
            A  => A,
            B  => B,
            GT => GT,
            EQ => EQ,
            LT => LT
        );

    stimulus: process
    begin

        -- 00 = 00
        A <= "00";
        B <= "00";
        wait for 10 ns;

        assert (EQ = '1' and GT = '0' and LT = '0')
            report "ERROR: 00 = 00"
            severity error;

        -- 01 > 00
        A <= "01";
        B <= "00";
        wait for 10 ns;

        assert (GT = '1' and EQ = '0' and LT = '0')
            report "ERROR: 01 > 00"
            severity error;

        -- 00 < 01
        A <= "00";
        B <= "01";
        wait for 10 ns;

        assert (LT = '1' and EQ = '0' and GT = '0')
            report "ERROR: 00 < 01"
            severity error;

        -- 10 = 10
        A <= "10";
        B <= "10";
        wait for 10 ns;

        assert (EQ = '1' and GT = '0' and LT = '0')
            report "ERROR: 10 = 10"
            severity error;

        -- 11 > 10
        A <= "11";
        B <= "10";
        wait for 10 ns;

        assert (GT = '1' and EQ = '0' and LT = '0')
            report "ERROR: 11 > 10"
            severity error;

        -- 01 < 11
        A <= "01";
        B <= "11";
        wait for 10 ns;

        assert (LT = '1' and EQ = '0' and GT = '0')
            report "ERROR: 01 < 11"
            severity error;

        report "Simulacion del comparador finalizada correctamente."
            severity note;

        wait;

    end process;

end architecture Behavioral;
