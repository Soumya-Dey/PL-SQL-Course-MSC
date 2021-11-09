CREATE OR REPLACE PROCEDURE square(x IN OUT number) IS
BEGIN
x := x * x;
END square;

set serveroutput on;
set verify off;

DECLARE
x number;
BEGIN
x := &x;
square(x);
dbms_output.put_line('Square = '|| x);

END;