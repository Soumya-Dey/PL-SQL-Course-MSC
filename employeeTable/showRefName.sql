set serveroutput on

declare
  e_id emp.emp_id%type := 3;
  e_name emp.emp_name%type;
  m_name manager.manager_name%type;

begin
  select emp.emp_name, manager.manager_name
  into e_name, m_name
  from emp inner join manager
  on emp.m_id = manager.manager_id
  where emp_id = e_id;

  DBMS_OUTPUT.PUT_LINE('Employee Name with id 3: '|| e_name);
  DBMS_OUTPUT.PUT_LINE('Manager Name of the Emplyee with id 3: '|| m_name);

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/