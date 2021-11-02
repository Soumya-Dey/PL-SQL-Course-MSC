set serveroutput on
set verify off

declare
  e_id emp.emp_id%type := 5;

  cursor c is 
  select emp_id, emp_name, emp_salary from emp 
  where emp_id = e_id
  for update;

begin
    for c_record in c loop
        update emp
        set emp_salary = emp_salary + (emp_salary / 10); 
    end loop;

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/