SET SERVEROUTPUT ON

DECLARE
v_max_gpa number(3,2);
v_numstudents number(4);
v_lname students.lname%type;
v_major students.major%type;

BEGIN
select max(gpa) into v_max_gpa
from students;
DBMS_OUTPUT.PUT_LINE ('The highest GPA is '||v_max_gpa);
select count(sid) into v_numstudents
from students
where gpa = v_max_gpa;
IF v_numstudents > 1 then
DBMS_OUTPUT.PUT_LINE ('There are '||v_numstudents||' with that GPA');
ELSE
select lname, major into v_lname, v_major
from students
where gpa=v_max_gpa;
DBMS_OUTPUT.PUT_LINE ('The student name is '||v_lname);
DBMS_OUTPUT.PUT_LINE ('The student major is '||v_major);
END IF;
END;
/

SET SERVEROUTPUT ON
DECLARE
v_max_gpa number(3,2);
v_numstudents number(4);
v_lname students.lname%type;
v_major students.major%type;

BEGIN
select max(gpa) into v_max_gpa
from students;
DBMS_OUTPUT.PUT_LINE ('The highest GPA is '||v_max_gpa);
select count(sid) into v_numstudents
from students
where gpa = v_max_gpa;
IF v_numstudents > 1 then
DBMS_OUTPUT.PUT_LINE ('There are '||v_numstudents||' with that GPA');
ELSE
select lname, major into v_lname, v_major
from students
where gpa=v_max_gpa;
DBMS_OUTPUT.PUT_LINE ('The student name is '||v_lname);
DBMS_OUTPUT.PUT_LINE ('The student major is '||v_major);
END IF;
END;
/