set serveroutput on

declare
  total_rows number(4);

  cursor c is select count(*) from teacher;

begin
  open c;
  fetch c into total_rows;

  dbms_output.put_line('Total Teachers');
  dbms_output.put_line('---------------');
  dbms_output.put_line(total_rows || ' teachers');
  close c;

end;
/