set serveroutput on

declare
  max_sal number;
  min_sal number;
  avg_sal number;

  cursor c is select max(t_salary), min(t_salary), avg(t_salary) from teacher;

begin
  open c;
  fetch c into max_sal, min_sal, avg_sal;

  dbms_output.put_line('Maximum Salary: ' || max_sal);
  dbms_output.put_line('Minimum Salary: ' || min_sal);
  dbms_output.put_line('Average Salary: ' || avg_sal);
  close c;

end;
/