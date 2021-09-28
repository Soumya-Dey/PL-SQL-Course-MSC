set serveroutput on
set verify off

declare
  c_id customer.customer_id%type;
  c_name customer.customer_name%type;
  c_age customer.customer_age%type;
  c_salary customer.customer_salary%type;
  c_da customer.customer_da%type;
  c_total customer.customer_total%type;

  cursor c is select customer_id, customer_name, customer_age, customer_salary, customer_da, customer_total from customer;

begin
  dbms_output.put_line('ID, NAME, AGE, SALARY, DA, TOTAL');
    open c;

    loop
    fetch c into c_id, c_name, c_age, c_salary, c_da, c_total;
        exit when c%notfound;

        if(c_salary > 50000) then
            c_da := c_salary * (30/100);
            c_total := c_salary + c_da;

            update customer set 
            customer_da = c_da, 
            customer_total = c_total
            where customer_id = c_id;
        end if;

        dbms_output.put_line(c_id || ', ' || c_name || ', ' || c_age || ', ' || c_salary || ', ' || c_da || ', ' || c_total);
    end loop;
    close c;

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/