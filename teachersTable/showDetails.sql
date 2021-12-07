set serveroutput on
set verify off

declare
  tid teacher.t_id%type := &tid;
  tname teacher.t_name%type;
  tdept teacher.t_dept%type;
  tsal teacher.t_salary%type;
  tdob teacher.t_dob%type;

  cursor c is select * from teacher where t_id = tid;

begin
  open c;

  dbms_output.put_line('Teacher details');
  dbms_output.put_line('--------------------------');

    fetch c into tid, tname, tdept, tsal, tdob;
        
    dbms_output.put_line('ID: ' || tid);
    dbms_output.put_line('Name: ' || tname);
    dbms_output.put_line('DEPT: ' || tdept);
    dbms_output.put_line('Salary: ' || tsal);
    dbms_output.put_line('DOB: ' || tdob);
    dbms_output.put_line('--------------------------');

    close c;

    exception
        when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');
        when TOO_MANY_ROWS then DBMS_OUTPUT.PUT_LINE('Too many rows!');

end;
/