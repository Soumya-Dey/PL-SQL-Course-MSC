-- Create a table emp (eid, ename,esal,edoj)
-- Using PL/SQL Cursor display the seniority of all the employees, for eg. if the doj is after 2010 
-- it will display the employee is JUNIOR, if the doj is before 2010 it will display THE EMPLOYEE 
-- IS SENIOR

set serveroutput on
set verify off

declare
  e_name emp.emp_name%type;
  e_doj emp.doj%type;

  cursor c is SELECT emp_name, doj FROM emp;

begin
    open c;

    loop
    fetch c into e_name, e_doj;
        if(c%notfound) then 
            close c;
            exit;
        end if;

        -- dbms_output.put_line(e_doj);
        if(e_doj >= to_date('01-JAN-2010')) then
            dbms_output.put_line(e_name || ' is JUNIOR [' || e_doj || ']');
        else 
            dbms_output.put_line(e_name || ' is SENIOR [' || e_doj || ']');
        end if;
    end loop;

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/