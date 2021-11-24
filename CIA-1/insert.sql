set serveroutput on
set verify off

declare
    exp exception;
    n squares.num%type := &n;
    sq squares.num_sq%type;

    cursor c is select * from squares;

begin
    if n < 1 then 
        raise exp;
    end if;

    dbms_output.put_line('Inserting records...');

    for i in 1 .. n
    loop 
        insert into squares values(i, i*i); 
    end loop;

    dbms_output.put_line('Showing records...');
    dbms_output.put_line('Number | Square');
    dbms_output.put_line('---------------');

    open c;

    loop
    fetch c into n, sq;
        exit when c%notfound;

        dbms_output.put_line(n || '      | ' || sq);
    end loop;
    close c;

exception
  when exp then DBMS_OUTPUT.PUT_LINE('Please enter a positive integer!');

end;
/