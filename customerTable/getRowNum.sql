set serveroutput on

declare
  total_rows number(4);

begin
  update customer
  set customer_salary = customer_salary + 100;

  if sql%notfound then
    DBMS_OUTPUT.PUT_LINE('records not found');
  elsif sql%found then
    total_rows := sql%rowcount;
    DBMS_OUTPUT.PUT_LINE(total_rows || ' rows');
  end if;

end;
/