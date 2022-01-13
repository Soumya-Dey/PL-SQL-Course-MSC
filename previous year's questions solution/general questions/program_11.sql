-- Write a PL/SQL program to check whether a given number is divisible by 5 or not. 
-- If the number is divisible by 5 then find the square of that number; 
-- if the number is divisible by 2 then find the square root of it else find the cube of that number.

declare
	n number;
	sqr number;
	cube number;
	sqr_root number(5, 2);
	rem number;

begin
	n:=&n;
	
    -- div by 5

    if (MOD(n, 5) = 0 and MOD(n, 2) = 0) then
 		sqr := n * n;
		dbms_output.put_line('square -> ' || sqr || ' and square root -> ' || sqrt(n));   
	elsif (MOD(n, 5) = 0 ) then
		sqr := n * n;
		dbms_output.put_line('square -> ' || sqr);
	elsif (mod(n, 2)  = 0) then
		dbms_output.put_line('square root -> ' || sqrt(n));
	else 
		dbms_output.put_line('cube -> ' ||n*n*n);
	end if;
end;
/