set serveroutput on
set verify off

declare
a number;
flag number:=0;

begin
a := &a;
for i in 2..(a/2)
loop
if (mod(a,i)=0) then
flag :=1;
--break;
end if;
end loop;

if (flag = 0) then
dbms_output.put_line('No entered is Prime');
else
dbms_output.put_line('No entered is NOT Not Prime');
end if;
end;
/