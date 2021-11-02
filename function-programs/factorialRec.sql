create or replace function factorial(n number) 
return number is fact number := 1;

begin
    if n == 0 then 
        return 1;
    else 
        return factorial(n * factorial(n-1));
    end if;

end;
/