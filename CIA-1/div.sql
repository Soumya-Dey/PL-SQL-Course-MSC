set serveroutput on
set verify off

declare
	n number := &n;

begin
    if mod(n, 5) = 0 and mod(n, 2) = 0 then
        dbms_output.put_line('Square of ' || n || ' = ' || n*n);
        dbms_output.put_line('Square root of ' || n || ' = ' || sqrt(n));
	elsif mod(n, 5) = 0 then
		dbms_output.put_line('Square of ' || n || ' = ' || n*n);
	elsif mod(n, 2) = 0 then
		dbms_output.put_line('Square root of ' || n || ' = ' || sqrt(n));
    else 
        dbms_output.put_line('Cube of ' || n || ' = ' || n*n*n);
	end if;
end;
/
