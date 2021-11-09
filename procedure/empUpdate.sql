-- only id
CREATE OR REPLACE PROCEDURE 
    adjust_salary_id(
        in_employee_id IN emp.emp_id%TYPE,
        in_percent IN NUMBER
    ) IS
    BEGIN
        UPDATE emp
        SET esal = esal + esal * in_percent / 100
        WHERE eid = in_employee_id;
END;

-- only dept
CREATE OR REPLACE PROCEDURE 
    adjust_salary_dept(
        in_employee_dept IN emp.emp_dept%type,
        in_percent IN NUMBER
    ) IS
    BEGIN
        -- update employee's salary
        UPDATE emp
        SET emp_salary = emp_salary + emp_salary * in_percent / 100
        WHERE emp_dept = in_employee_dept;
END;

-- both dept and id
CREATE OR REPLACE PROCEDURE 
    adjust_salary_id_dept(
        in_employee_id IN emp.emp_id%type,
        in_employee_dept IN emp.emp_dept%type,
        in_percent IN NUMBER
    ) IS
    BEGIN
        -- update employee's salary
        UPDATE emp
        SET emp_salary = emp_salary + emp_salary * in_percent / 100
        WHERE emp_dept = in_employee_dept AND emp_id = in_employee_id;
END;




-- EXECUTE adjust_salary('E01',15);



-- Q. What will happen if we pass a negative value number in case of percentage?
-- A. Salary will be decremented by that percentage.