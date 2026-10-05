library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator2bit is
    port(
        A  : in  std_logic_vector(1 downto 0);
        B  : in  std_logic_vector(1 downto 0);
        GT : out std_logic;
        EQ : out std_logic;
        LT : out std_logic
    );
end entity comparator2bit;

architecture Behavioral of comparator2bit is
begin

    process(A, B)
    begin

        GT <= '0';
        EQ <= '0';
        LT <= '0';

        if unsigned(A) > unsigned(B) then
            GT <= '1';

        elsif unsigned(A) = unsigned(B) then
            EQ <= '1';

        else
            LT <= '1';

        end if;

    end process;

end architecture Behavioral;
