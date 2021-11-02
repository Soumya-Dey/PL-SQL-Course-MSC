set serveroutput on

declare
  e_id emp.emp_id%type := 4;
  e_name emp.emp_name%type;

begin
  select emp_name
  into e_name
  from emp
  where emp_id = e_id;

  DBMS_OUTPUT.PUT_LINE('Employee Name with id 4: '||e_name);

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/