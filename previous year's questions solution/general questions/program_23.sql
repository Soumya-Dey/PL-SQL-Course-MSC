-- Write a PL/SQL code to reverse an input string.

declare
	str varchar(30);
	str_rev varchar(30);
	len number;
begin
	str := '&str';

	len := Length(str);

	for i in reverse 1 .. len loop
		str_rev := str_rev || Substr(str, i, 1);
	end loop;

	dbms_output.put_line('Reverse of string ' || ' is ' || str_rev);
end;
/
