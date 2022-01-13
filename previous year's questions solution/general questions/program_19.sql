-- Write a PL/SQL code to check whether a given number is a perfect number or not

declare
	num number;
	sum1 number := 0;
begin
	num := &num;


	for i in 1 .. num-1 loop
		if mod(num, i) = 0 then
			sum1 := sum1 + i;
		end if;
	end loop;

	if sum1 = num then
		dbms_output.put_line('Yes ' || num || ' is perfect number');
	else
		dbms_output.put_line('No ' || num || ' is not perfect number');
	end if;
end;
/