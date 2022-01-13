-- Write a PL/SQL program which will 
-- find the sum, average and standard deviation of first ‘n’ numbers, 
-- where n is supplied by the user. 
-- The range of n should be within 10 to 100, throw an exception if an invalid range is supplied.

declare
	sum1 number := 0;
	avg1 number;
	std number := 0;
	n number;
	c number := 1;
	e exception;
begin
	n := &n;

	if n < 10 or n > 100 then
		raise e;
	end if;

	for i in 1 .. n loop
		sum1 := sum1 + i;
		c := c + 1;
	end loop;
	c := c - 1; 
	avg1 := sum1 / c;

	for i in 1 .. n loop
		std := std +( power((i - avg1), 2));
	end loop;
	std := std / c;
	std := power(std, 0.5);

	dbms_output.put_line('Sum from 1 to ' || n || ' is ' || sum1);
	dbms_output.put_line('avg1 from 1 to ' || n || ' is ' || avg1);
	dbms_output.put_line('std from 1 to ' || n || ' is ' || std);

exception
	when e then
		dbms_output.put_line('Out of range');
end;
/	