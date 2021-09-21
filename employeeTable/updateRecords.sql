SET SERVEROUTPUT ON

Declare
v_employee emp%rowtype;

Begin
select *
into v_employee
from emp
where emp_id = 65284;

update emp
set emp_salary = v_employee.emp_salary + 1000
where emp_id = v_employee.emp_id;
End;
/