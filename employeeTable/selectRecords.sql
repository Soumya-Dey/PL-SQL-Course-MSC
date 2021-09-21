set serveroutput on
set verify off

declare
  e_name emp.emp_name%type;
  e_dept emp.emp_dept%type;
  e_salary emp.emp_salary%type;

begin
    select emp_name, emp_dept, emp_salary 
    into e_name, e_dept, e_salary 
    from (
        select emp_name, emp_dept, emp_salary, dense_rank()
        over(order by emp_salary desc) ranking from emp
    )
    where ranking = &n;

    DBMS_OUTPUT.PUT_LINE('Emplyee Details: ');
    DBMS_OUTPUT.PUT_LINE('Name: '||e_name);
    DBMS_OUTPUT.PUT_LINE('Department: '||e_dept);
    DBMS_OUTPUT.PUT_LINE('Salary: '||e_salary);

end;
/