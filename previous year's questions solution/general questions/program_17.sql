-- Write a PL/SQL program to multiply the digits of a positive number. 
-- The number should be of at least 3 digits. Use proper exception handling in case of an invalid input.

declare
	n number;
	s number:=1;
	r number;
	len number;
	m number;
	e1 exception;
	e2 exception;

begin
	n := &n;
	m := n;

	len := length(to_char(n));

	if len < 3 then
		raise e1;
	elsif n < 0 then
		raise e2;
	end if;

	
	while n>0
	loop
		r := mod(n , 10);
		s := s * r;
		n := trunc(n / 10);
	end loop;
	
	
	dbms_output.put_line('digit multiplaction of ' || m || ' is ' || s);


exception
	when e1 then
		dbms_output.put_line('Length is short');
	when e2 then
		dbms_output.put_line('Negative is not allowed');	
end;