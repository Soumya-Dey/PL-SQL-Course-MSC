set serveroutput on
set verify off

declare
  num number := &num;
  f number := 1;

begin
  for i in 2..num
  loop
    f := f*i;
  end loop;

  dbms_output.put_line('Factorial: ' || f);

end;
/