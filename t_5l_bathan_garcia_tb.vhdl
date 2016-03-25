-------------------------------------------------------------------------------
-- File Name: t_5l_bathan_garcia_tb.vhdl
-- Program Description: Test Bench for homework
-------------------------------------------------------------------------------

-- Library Statements
library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.STATE_CONSTANTS.all;

-- Entity Definition
entity t_5l_bathan_garcia_tb is
	constant PERIOD1: time := 100 ns; -- clock period
end entity t_5l_bathan_garcia_tb;

architecture t_5l_bathan_garcia_tb of t_5l_bathan_garcia_tb is	-- data output from the state machine
	signal state: std_logic;-- the current state	
	signal reset_n: std_logic; -- active-low reset signal
	signal clk: std_logic := '0'; -- clock signal (init. to 0)
	signal a: std_logic;	-- input data for the state machine		
	signal b: std_logic;
	signal c: std_logic;	-- input data for the state machine		
	signal d: std_logic;
	signal e: std_logic;	-- input data for the state machine		
	signal f: std_logic;
	-- Component declaration
	component t_5l_bathan_garcia is
		 port (state: out std_logic;-- current state of state machine
		 reset_n: in std_logic; -- active-low reset signal
	 	 clk: in std_logic; -- clock signal
	 	 a: in std_logic;	-- a, b, and c are the in_buzzers
		 b: in std_logic;
		 c: in std_logic;	-- d, e, and f are the out_buzzers 
		 d: in std_logic;
		 e: in std_logic;
		 f: in std_logic); -- the signal data input			  				
	end component t_5l_bathan_garcia;

	-- Error checking and reporting procedure
	procedure check_state
		(expected_state: std_logic;
		actual_state: std_logic;
		error_count: inout integer) is
	begin
		-- check if expected_state is the same as actual_state
		assert(expected_state = actual_state)
			report "ERROR: Expected state (" &
				std_logic'image(expected_state) & ") /= actual (" &
				std_logic'image(actual_state) &
				") at time " & time'image(now);

			-- increment error_count (state)
			if(expected_state/=actual_state) then
				error_count := error_count + 1;
			end if;
	end procedure check_state;

begin	-- begin main body of the jk architecture
	-- instantiate the unit under test
	t_5l_bathan_garcia_1: component t_5l_bathan_garcia port map(state,reset_n,clk,a,b,c,d,e,f);

	-- generate a LOW pulse for reset_n
	reset_n <= '1','0' after (PERIOD1 / 4),
			   '1' after (PERIOD1 + PERIOD1/4);

	-- generate an input clock with a period of PERIOD1
	-- negate the clock
	-- note: assume clk has been initialized to '0' above
	clock: clk <= not clk after (PERIOD1/2);

	-- main process: generate test vectors and check results
	main: process is
		variable error_count: integer := 0; -- number of simulation errors
	begin
		report "Start simulation.";
		a <= '0';
		b <= '0';
		c <= '0';
		d <= '0';
		e <= '0';
		f <= '0';
		wait for PERIOD1;
		check_state('0',state,error_count);
		
		a <= '1';
		b <= '1';
		c <= '1';
		d <= '1';
		e <= '1';
		f <= '1';
		wait for PERIOD1;
		check_state('1',state,error_count);
		
		a <= '0';
		b <= '0';
		c <= '0';
		d <= '0';
		e <= '0';
		f <= '1';		
		wait for PERIOD1;
		check_state('0',state,error_count);
		
		a <= '1';
		b <= '0';
		c <= '0';
		d <= '0';
		e <= '0';
		f <= '1';		
		wait for PERIOD1;
		check_state('1',state,error_count);
		
		
		a <= '1';
		b <= '0';
		c <= '0';
		d <= '0';
		e <= '0';
		f <= '0';		
		wait for PERIOD1;
		check_state('0',state,error_count);
		
		a <= '1';
		b <= '0';
		c <= '0';
		d <= '1';
		e <= '0';
		f <= '1';		
		wait for PERIOD1;
		check_state('1',state,error_count);
		
		a <= '0';
		b <= '1';
		c <= '1';
		d <= '1';
		e <= '0';
		f <= '1';		
		wait for PERIOD1;
		check_state('1',state,error_count);
		
			
		-- check if there are errors
		if(error_count=0) then
			report "Simulation completed with NO errors.";
		else
			report "ERROR: There were " &
					integer'image(error_count) & " errors.";
		end if;

		wait;		-- halt this process (note: simulation
	end process main; -- continues due to clk assignment statement)
end architecture t_5l_bathan_garcia_tb;
