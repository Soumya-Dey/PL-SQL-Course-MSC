set serveroutput on

DECLARE
i number;
BEGIN
LOOP
dbms_output.put_line('Hello');
i:=i+1;
EXIT WHEN i>5;
END LOOP;
END;
/