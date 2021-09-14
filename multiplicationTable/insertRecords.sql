set serveroutput on

declare
    n number := &n;

begin
    for i in 1..10
    loop
    insert into multi_tab values(n, i, n*i);
    end loop;

end;
/