set serveroutput on
set verify off

declare
	num number := &num;
	m number;
	s number := 0;
	r number;
	len number;

begin
	m := num;

	while num > 0
	loop
		r := mod(num, 10);
        s := s * 10 + r;
		-- s := s + power(r, 3);
		num := trunc(num / 10);
	end loop;
	
	if m = s
	then
		dbms_output.put_line(m || ' is an Palindrom Number');
	else
		dbms_output.put_line(m || ' is not an Palindrom Number');
	end if;
	
end;
/
