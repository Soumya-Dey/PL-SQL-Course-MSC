CREATE OR REPLACE PROCEDURE Sum1(a IN number, b IN number) IS
c number;
BEGIN
c := a+b;
dbms_output.put_line('Sum of two nos= '|| c);
END Sum1;



//Calling the procedure



set serveroutput on;
set verify off;



DECLARE
x number;
y number;
BEGIN
x := &x;
y := &y;
Sum1(x,y);



END;