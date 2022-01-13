-- Write a PL/SQL program which will accept two different strings from the user. Using Oracle string functions do the following:
-- (i) Find the length of each string.
-- (ii) concatenate the strings.
-- (iii) change the case of the strings.


DECLARE 
	str1 varchar(30);
	str2 varchar(30);
	concat varchar(60);
begin
	str1 := '&str1';
	str2 := '&str2';
	
	dbms_output.put_line('Lenght of string ' || str1 || ' is ' || LENGTH(str1));
	dbms_output.put_line('Lenght of string ' || str2 || ' is ' || LENGTH(str2));

	concat := str1 || ' ' || str2;

	dbms_output.put_line('Concatenate of string ' || str1 || ' and ' || str2 || ' is ' || concat);

	dbms_output.put_line('Change the case to upper ' || upper(str1));
	dbms_output.put_line('Change the case to upper ' || upper(str2));
	
end;
/