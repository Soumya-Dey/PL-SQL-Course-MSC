create or replace function maxOf2(n1 number, n2 number) 
return number is max number := 0;

begin
    if n1 >= n2 then
        return n1;
    else 
        return n2;
    end if;

end;
/