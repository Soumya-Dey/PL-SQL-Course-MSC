-- Write a PL/SQL code to create a table called Number which will store all the positive numbers from 21 to a given range (n) in the following way:
-- No Type
-- ---------- -------------------
-- 21 Odd
-- 22 Even
-- 23 Odd
-- 24 Even
-- .. ……
-- And so on... (Where No and Type are the attributes of the table Number).The input ‘n’ should be provided 
-- by the user. Use exception handling is case of an invalid input.

create table type(
	no number,
	type varchar(20)
);

declare
	n number;
	kind varchar(20);
	e exception;
begin
	n := &n;
	if n < 21 then
		raise e;
	end if;
	for i in 21 .. n loop
		if mod(i, 2) = 0 then
			kind := 'Even';
		else
			kind := 'Odd';
		end if;

		insert into type(no, type)
		values(i, kind);
	end loop;

exception
	when e then 
		dbms_output.put_line('Invalid input');
end;
/