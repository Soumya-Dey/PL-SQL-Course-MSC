set serveroutput on

declare
  e_id emp.emp_id%type := &e_id;
  e_name emp.emp_name%type;
  e_dept emp.emp_dept%type;
  e_salary emp.emp_salary%type;

begin
  select emp_name, emp_dept, emp_salary
  into e_name, e_dept, e_salary
  from emp
  where emp_id = e_id;

  DBMS_OUTPUT.PUT_LINE('Emplyee Details: ');
  DBMS_OUTPUT.PUT_LINE('Name: '||e_name);
  DBMS_OUTPUT.PUT_LINE('Department: '||e_dept);
  DBMS_OUTPUT.PUT_LINE('Salary: '||e_salary);

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/