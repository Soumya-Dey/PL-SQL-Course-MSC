-- Write a PL/SQL code to check whether a given number is a prime or not. 
-- The number should be taken as an input from the user.


declare
n number;			
i number;		
temp number;	

begin
	n := &n;				
	temp := 1;
	for i in 2..n/2
		loop
			if mod(n, i) = 0
			then
				temp := 0;
				exit;
			end if;
		end loop;

		if temp = 1
		then
			dbms_output.put_line('Yes ' || n || ' is prime');
		else
			dbms_output.put_line('Yes ' || n || ' is not prime');
		end if;
end;		
/