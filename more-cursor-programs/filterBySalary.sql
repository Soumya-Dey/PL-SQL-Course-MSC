set serveroutput on
set verify off

declare
  emp_id employee.emp_id%type;
  first_name employee.first_name%type;
  salary employee.salary%type;

  cursor c is select emp_id, first_name, salary from employee;

begin
    dbms_output.put_line('ID, NAME, SALARY');
    open c;

    loop
    fetch c into emp_id, first_name, salary;
        if(c%notfound) then 
            close c;
            exit;
        end if;


        if(salary > 10000) then
            dbms_output.put_line(emp_id || ', ' || first_name || ', ' || salary);
        else 
            dbms_output.put_line(first_name || '''s salary is less than 10000 [' || salary || ']');
        end if;
    end loop;

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/