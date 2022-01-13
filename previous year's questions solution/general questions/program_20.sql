-- Write a PL/SQL program to check whether an input positive number is even or odd. 
-- If the number is odd, square the number and add it to the cube of that number, 
-- if the number is even find the square root of that number. 
-- Use Exception handling in case of an invalid input is given.



declare 
	n number;
	e exception;
	result number;
begin
	n := &n;

	if n < 0 then
		raise e;
	end if;

	if mod(n, 2) = 0 then
		dbms_output.put_line('The number is even so Squre root of ' || n || ' is ' || power(n, 0.5));
	else
		result := power(n, 2) + power(n, 3);
		dbms_output.put_line('The number is odd so result is ' || result );
	end if;
exception
	when e then
		dbms_output.put_line('Negative number is not allowed');
end;
/

