create or replace procedure 
    oldestTeacher(num in number) is
    tid teacher.t_id%type;
    tname teacher.t_name%type;
    tdept teacher.t_dept%type;
    tsal teacher.t_salary%type;
    tdob teacher.t_dob%type;

    cursor c is select * from teacher where t_dob = (select min(t_dob) from teacher);
    begin
        open c;

        dbms_output.put_line('Teacher(s) having maximum age');
        dbms_output.put_line('--------------------------');
        loop
            fetch c into tid, tname, tdept, tsal, tdob;
                if(c%notfound) then 
                    close c;
                    exit;
                end if;

                
                dbms_output.put_line('ID: ' || tid);
                dbms_output.put_line('Name: ' || tname);
                dbms_output.put_line('DEPT: ' || tdept);
                dbms_output.put_line('Salary: ' || tsal);
                dbms_output.put_line('DOB: ' || tdob);
                dbms_output.put_line('--------------------------');
        end loop;

        exception
            when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No record found!');
end;
/