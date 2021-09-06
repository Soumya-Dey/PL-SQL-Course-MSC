set serveroutput on

declare
  e_id NUMBER := &e_id;
  e_name VARCHAR2(255);
  e_dept VARCHAR2(255);
  e_salary NUMBER;

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