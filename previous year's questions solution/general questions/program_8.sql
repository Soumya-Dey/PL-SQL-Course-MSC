-- Print the Fibonacci and Non-Fibonacci series 
--till n, 
-- where n is taken as an input from the user.



create or replace function fib_rev(x number)
return number
is
	prevPrev number := 1;
	prev number := 2;
	curr number := 3;
	d number;
	n number := x;

begin
	while n > 0 loop
		prevPrev := prev;
		prev := curr;
		curr := prev + prevPrev;
		n := n - (curr - prev - 1);
	end loop;
	n := n + (curr - prev - 1);

	return prev+n;
end;
/


CREATE OR REPLACE FUNCTION fib (n number) 
RETURN INTEGER IS
BEGIN
	IF (n <= 1) THEN 
		RETURN n;
	ELSE
		RETURN fib(n - 1) + fib(n - 2); 
	END IF;
END fib;
/

DECLARE 
	num number;
	f number;

begin
	num := &value;
	dbms_output.put_line('first ' || num ||' not fibbonaci number  is ');
	for i in 1 .. num loop
		dbms_output.put_line(fib_rev(i));
	end loop;

	dbms_output.put_line('first ' || num ||'  fibbonaci number  is ');
	for i in 0 .. num loop
		dbms_output.put_line(fib(i));
	end loop;
end;
/