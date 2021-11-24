-- [03:02] KAUSHIK GOSWAMI
-- Create a table employee having the following fieldsemployee(eid, ename, basic, city)where eid is the primary key, ename is mandatory,
-- basic is a number and should be between 10k and 1 lakh.
-- city can be any one of the following Kolkata, Mumbai, Bangalore,
-- or Chennai.

-- [03:02] KAUSHIK GOSWAMI
-- 2. Insert at least 5 records in the table

-- [03:02] KAUSHIK GOSWAMI
-- Using PL/SQL create a cursor to access the records.
-- Calculate the DA, PF, NET, and GROSS salary of the employees and
-- display it in the console.

-- [03:03] KAUSHIK GOSWAMI
-- Using PL/SQL create a cursor to access the records.
-- First give the following increments to employees based on the
-- city there are in.
-- Kolkata -> 10% raise
-- Mumbai -> 15% raise
-- Bangalore -> 15% raise
-- Chennai -> 10% raise

-- [03:05] KAUSHIK GOSWAMI
-- The components DA,Pf,NET,and GROSS are calculated as follows: 


-- [03:05] KAUSHIK GOSWAMI
-- DA = 125 % of Basic

-- [03:05] KAUSHIK GOSWAMI
-- PF = 12 % of Basic

-- [03:07] KAUSHIK GOSWAMI
-- Gross = Basic + DA + PF 

-- [03:07] KAUSHIK GOSWAMI
-- Net = Gross - PF

set serveroutput on
set verify off

declare
  e_name emp.emp_name%type;
  e_basic emp.emp_basic%type;
  da number;
  pf number;
  net number;
  gross number;

  cursor c is SELECT emp_name, emp_basic FROM emp;

begin
    open c;

    dbms_output.put_line('NAME   | BASIC | DA    | PF   | GROSS | NET');

    loop
    fetch c into e_name, e_basic;
        if(c%notfound) then 
            close c;
            exit;
        end if;

        da := e_basic*1.25;
        pf := e_basic*0.12;
        gross := e_basic + da + pf;
        net := gross - pf;
        dbms_output.put_line(e_name || ' | ' || e_basic || ' | ' || da || ' | ' || pf || ' | ' || gross || ' | ' || net);
    end loop;

exception
  when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('No employee found!');

end;
/