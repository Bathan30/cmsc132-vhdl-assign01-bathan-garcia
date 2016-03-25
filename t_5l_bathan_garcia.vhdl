-------------------------------------------------------------------------------
-- File Name: t-5l_bathan_garcia.vhdl
-- Program Description: 
-- A program that that have an IN buzzer to determine if someone entered a storage
-- and a Out buzzer to determine if someone went out of the storage. A total of
-- three farm storages and two buzzers each. 
-------------------------------------------------------------------------------

-- Package Definition for Global Constants
library IEEE; use IEEE.std_logic_1164.all;
package STATE_CONSTANTS is
	constant STATE_BITS: integer := 1; -- number of bits in state
	constant S0: std_logic := '0'; -- states
	constant S1: std_logic := '1';
end package;
-------------------------------------------------------------------------------

-- Library Statements
library IEEE; use IEEE.std_logic_1164.all;
use work.STATE_CONSTANTS.all;

-- Entity Definition
entity t_5l_bathan_garcia is
	port (state: out std_logic;	-- current state of state machine
	 reset_n: in std_logic; -- active-low reset signal
	 clk: in std_logic; -- clock signal
	 a: in std_logic;	-- a, b, and c are the in_buzzers
	 b: in std_logic;
	 c: in std_logic;	-- d, e, and f are the out_buzzers 
	 d: in std_logic;
	 e: in std_logic;
	 f: in std_logic
	 ); -- the signal data input
	 		  			
end entity t_5l_bathan_garcia;

architecture t_5l_bathan_garcia of t_5l_bathan_garcia is
	signal internal_state: std_logic;

begin
	state <= internal_state;
	
	next_state: process(reset_n, clk) is
	begin
		if(reset_n = '0') then		-- asynchronous reset
			internal_state <= '0';
		elsif rising_edge(clk) then	-- on positive clock edge
			case internal_state is 
				when S0 =>
					-- a, b, c, d, e and f = 0
					if (a='0' and b='0' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					-- d, e and f = 0
					elsif(a='0' and b='0' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='1' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='0' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='1' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='0' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='1' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='1' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					-- a, b, and c = 0
					elsif(a='0' and b='0' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '0';
					-- a = 1, either d, e or f is 1
					elsif(a='1' and b='0' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- b = 1, either d, e or f is 1
					elsif(a='0' and b='1' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- c = 1, either d, e or f is 1
					elsif(a='0' and b='0' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- a and c = 1, either d, e or f is 1
					elsif(a='1' and b='0' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- a and b = 1, either d, e or f is 1
					elsif(a='1' and b='1' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- b and c = 1, either d, e or f is 1
					elsif(a='0' and b='1' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- a, b and c = 1, either d, e or f is 1
					elsif(a='1' and b='1' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					end if;
				when S1 =>
					-- a, b, c, d, e and f = 0
					if (a='0' and b='0' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					-- d, e and f = 0
					elsif(a='0' and b='0' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='1' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='0' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='1' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='0' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='1' and c='0' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='1' and b='1' and c='1' and d='0' and e='0' and f='0') then
						internal_state <= '0';
					-- a, b, and c = 0
					elsif(a='0' and b='0' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '0';
					elsif(a='0' and b='0' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '0';
					-- a = 1, either d, e or f is 1
					elsif(a='1' and b='0' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- b = 1, either d, e or f is 1
					elsif(a='0' and b='1' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- c = 1, either d, e or f is 1
					elsif(a='0' and b='0' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='0' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- a and c = 1, either d, e or f is 1
					elsif(a='1' and b='0' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='0' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- a and b = 1, either d, e or f is 1
					elsif(a='1' and b='1' and c='0' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='0' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- b and c = 1, either d, e or f is 1
					elsif(a='0' and b='1' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='0' and b='1' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					-- a, b and c = 1, either d, e or f is 1
					elsif(a='1' and b='1' and c='1' and d='1' and e='0' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='0' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='0' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='0' and e='1' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='1' and e='1' and f='0') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='1' and e='0' and f='1') then
						internal_state <= '1';
					elsif(a='1' and b='1' and c='1' and d='1' and e='1' and f='1') then
						internal_state <= '1';
					end if;
				when others =>
						internal_state <= 'X';
			end case;
		end if;
	end process;
end architecture t_5l_bathan_garcia;
