-- Write a PL/SQL program to check
-- whether a given number is an Armstrong number or not. The number should be taken as an input from the user.

declare
	n number;
	s number:=0;
	r number;
	len number;
	m number;

begin
	n := &n;
	m := n;

	len := length(to_char(n));
	
	while n>0
	loop
		r := mod(n , 10);
		s := s + power(r , len);
		n := trunc(n / 10);
	end loop;
	
	if m = s
	then
		dbms_output.put_line('Yes ' || m || ' is Armstrong');
	else
		dbms_output.put_line('No ' || m || ' is not Armstrong');
	end if;
	
end;
