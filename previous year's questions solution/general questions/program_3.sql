-- Using PL/SQL implement the functions 
-- ADD, SUB, DIVIDE and MULTP in a single program, on 
-- two values taken as an input from the user.


create or replace function s(x number, y number)
return number
is
	s number;
begin
	s := x + y;
return s;
end;
/

create or replace function SUB_TWO(x number, y number)
return number
is
	sub_two number;
begin
	sub_two := x - y;
	return sub_two;
end;
/

create or replace function MULTP(x number, y number)
return number
is
	mul number;
begin
	mul := x * y;
	return mul;
end;
/

create or replace function DIVIDE(x number, y number)
return number
is
	div number;
begin
	div := x / y;
	return div;
end;
/


DECLARE 
	num1 number;
	num2 number;

begin
	num1 := &num1;
	num2 := &num2;
	
	dbms_output.put_line('SUM of ' || num1 || ' and ' || num2 || ' is ' || s(num1, num2));
	dbms_output.put_line('Subtractoin of ' || num1 || ' and ' || num2 || ' is ' || SUB_TWO(num1, num2));
	dbms_output.put_line('Divide of ' || num1 || ' and ' || num2 || ' is ' || DIVIDE(num1, num2));
	dbms_output.put_line('Multiplaction of ' || num1 || ' and ' || num2 || ' is ' || MULTP(num1, num2));
end;
/