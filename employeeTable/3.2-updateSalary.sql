set serveroutput on
set verify off

declare
  e_id emp.emp_id%type := 5;
  e_salary emp.emp_salary%type;

  cursor c is 
  select emp_salary from emp 
  where emp_id = e_id;

begin
    open c;
    fetch c into e_salary;

    update emp 
    set emp_salary = e_salary + (e_salary / 10) 
    where emp_id = e_id;

    close c;

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/