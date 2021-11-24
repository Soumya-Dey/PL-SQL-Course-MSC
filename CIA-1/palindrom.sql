set serveroutput on
set verify off

declare
	n number := &n;
	m number;
	temp number := 0;
	rem number;

begin
	m := n;
	
	while n > 0
	loop
		rem := mod(n,10);
		temp := (temp * 10) + rem;
		n := trunc(n / 10);
	end loop;
	
	if m = temp then
		dbms_output.put_line(m || ' is Palindrome.');
	else
		dbms_output.put_line(m || ' is not Palindrome.');
	end if;
end;
/
