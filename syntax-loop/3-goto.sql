set serveroutput on

BEGIN
FOR i IN 1..5 LOOP
dbms_output.put_line(i);
IF i=4 THEN
GOTO label1;
END IF;
END LOOP;
<<label1>>
DBMS_OUTPUT.PUT_LINE('khela sesh');
END;
/