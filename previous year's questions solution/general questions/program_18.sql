-- Write a PL/SQL code to check whether a given string is a palindrome or not. 
-- The string should be taken as an input from the user.

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

	if str_rev = str then
		dbms_output.put_line('Yes ' || str || ' is palindrome');
	else
		dbms_output.put_line('No ' || str || ' is not palindrome');
	end if;
end;
/
