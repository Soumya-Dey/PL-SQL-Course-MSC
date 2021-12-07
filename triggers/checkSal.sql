CREATE OR REPLACE TRIGGER CheckSal
BEFORE
INSERT OR UPDATE ON emp
FOR EACH ROW
BEGIN
IF :new.esal>75000 THEN
raise_application_error(-20001, 'Emp Salary should not be greater than 75k');
END IF;
END;