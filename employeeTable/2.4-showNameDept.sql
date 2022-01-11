set serveroutput on

declare
  e_id emp.emp_id%type := 2;
  e_name emp.emp_name%type;
  e_dept emp.emp_dept%type;

begin
  select emp_name, emp_dept
  into e_name, e_dept
  from emp
  where emp_id = e_id;

  DBMS_OUTPUT.PUT_LINE('Employee Name with id 2: '|| e_name);
  DBMS_OUTPUT.PUT_LINE('Employee Department with id 2: '|| e_dept);

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/