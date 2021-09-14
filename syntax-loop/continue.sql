set serveroutput on

DECLARE
no NUMBER := 0;
BEGIN
FOR i IN 1 .. 5 LOOP
IF i = 4 THEN
CONTINUE;
END IF;
DBMS_OUTPUT.PUT_LINE('Iteration : ' || i);
END LOOP;
END;
/