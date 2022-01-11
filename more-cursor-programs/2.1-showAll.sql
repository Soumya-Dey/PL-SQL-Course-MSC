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

        dbms_output.put_line(emp_id || ', ' || first_name || ', ' || salary);

        -- if(salary > 50000) then
        --     c_da := c_salary * (30/100);
        --     c_total := c_salary + c_da;

        --     update customer set 
        --     customer_da = c_da, 
        --     customer_total = c_total
        --     where customer_id = c_id;
        -- end if;
    end loop;

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/