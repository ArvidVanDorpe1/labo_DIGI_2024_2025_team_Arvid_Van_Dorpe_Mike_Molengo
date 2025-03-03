--------------------------------------------
-- Module Name: tutorial
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity tutorial Is
port (
    swt : in STD_LOGIC_VECTOR(7 downto 0);   -- Ingang schakelaars
    led : out STD_LOGIC_VECTOR(7 downto 0);  -- Uitgang LEDs
    JA  : out STD_LOGIC_VECTOR(6 downto 0);   -- Uitgang naar PMOD JA[6:0]
    JB : in std_logic_vector(3 downto 0)
    
);
end tutorial;

Architecture behavior of tutorial Is

Signal led_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

begin
    led <= led_int;  -- LEDs koppelen aan interne signalen

    -- LED-logica met input functie
    led_int(0) <= not(JB(0)); --inverteer JB0
    led_int(1) <= JB(1) and not(JB(2)); -- and poort
    led_int(3) <= JB(2) and JB(3); -- and poort
    led_int(2) <= led_int(1) or led_int(3); -- or

    -- LED-logica met switches
    --led_int(0) <= not(swt(0));
    --led_int(1) <= swt(1) and not(swt(2));
    --led_int(3) <= swt(2) and swt(3);
    --led_int(2) <= led_int(1) or led_int(3);
    --led_int(7 downto 4) <= swt(7 downto 4);

    -- JA PMOD-uitgangen koppelen
    JA(0) <= swt(0);      -- Directe koppeling van schakelaars
    JA(1) <= swt(1);
    JA(2) <= swt(2);
    JA(3) <= swt(3);
    JA(4) <= led_int(0); -- Output van LED-logica naar PMOD
    JA(5) <= led_int(1);
    JA(6) <= led_int(2);

end behavior;
