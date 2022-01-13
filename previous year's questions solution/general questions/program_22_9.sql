
-- Write a PL/SQL code to store the first n positive integers along with their squares in an already created table. 
-- „n‟ should be taken as an input. The program will also display the content of the table.

CREATE TABLE squares(
	num INT PRIMARY KEY,
    sq INT);

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE 
	n INT;
	s INT;
    i INT;
    e exception;
	CURSOR cur IS
		SELECT num, sq FROM squares;
BEGIN
	n :=&n;
    if (n < 0 ) THEN 
        raise e;
    ELSE 
        FOR i in 1 .. n LOOP
            s:=i*i;
            INSERT INTO squares VALUES(i, s);	
        END LOOP;
    

        dbms_output.put_line('i' || ' -> ' || 'sq');
        OPEN cur;
        LOOP
            FETCH cur INTO i, s;
            EXIT WHEN cur%NOTFOUND;
            dbms_output.put_line(i || ' -> ' || s);
        END LOOP;
        CLOSE cur;

    END IF;

exception
	when e then
		dbms_output.put_line('negtive value not allowed');
END;
/