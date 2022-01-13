
-- Write a PL/SQL code to check whether a given number is a 
-- palindrome or not. The number should be taken as an input from the user.


declare
	n number;
	m number;
	temp number:=0;
	rem number;

begin
	n:=&n;
	m:=n;
	
	while n>0
	loop
		rem:=mod(n,10);
		temp:=(temp*10)+rem;
		n:=trunc(n/10);
	end loop; 
	
	if m = temp
	then
		dbms_output.put_line('Yes ' || m || ' is palindrom');
	else
		dbms_output.put_line('No ' || m || ' is not palindrom');
	end if;
end;
/

