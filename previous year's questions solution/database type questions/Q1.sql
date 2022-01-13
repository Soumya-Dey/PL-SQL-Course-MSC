/*
Create the following table using SQL for an Entrance Exam. Keep a constraint check so that the marks should be within the range 1-100
Student ( Sroll,Sname,Sdept,SMarks,Edob)
Using PL/SQL implement the following:
a) Count the number of Students.
b) Find the maximum and minimum marks obtained.
c) List the details of the student having the maximum age.
d) Write a procedure/function to input the Sroll of a Student and return the Student details.
e) Write the code for the Exceptions TOO_MANY_ROWS and NO_DATA_FOUND.
*/

CREATE TABLE Entrance(
    Sroll NUMBER PRIMARY KEY,
    Sname VARCHAR(15),
    Sdept VARCHAR(10),
    SMarks NUMBER,
    Sdob DATE,
    CHECK (SMarks >= 1 AND SMarks <= 100)
);
ALTER TABLE Entrance
ADD CONSTRAINT CK_Table_Column_Range CHECK (
   SMarks >= 1 AND SMarks <= 100 --Inclusive
);

INSERT INTO Entrance VALUES(1, 'Ram', 'cse', 99, DATE '2000-02-06');
INSERT INTO Entrance VALUES(2, 'Shyam', 'it', 45, DATE '2001-10-14');
INSERT INTO Entrance VALUES(3, 'Bob', 'me', 77, DATE '1999-03-12');
INSERT INTO Entrance VALUES(4, 'Alice', 'cse', 88, DATE '2000-03-24');
INSERT INTO Entrance VALUES(5, 'Sal', 'ce', 90, DATE '2001-04-06');
INSERT INTO Entrance VALUES(6, 'Chester', 'phy', 99, DATE '2000-11-16');
INSERT INTO Entrance VALUES(7, 'Harry', 'ce', 78, DATE '1999-07-17');
INSERT INTO Entrance VALUES(8, 'Joe', 'phy', 80, DATE '2001-08-04');
INSERT INTO Entrance VALUES(9, 'Alex', 'it', 85, DATE '1999-12-23');

SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE dispStd(x IN NUMBER) IS
stud Entrance%rowtype;
BEGIN
    SELECT * 
    INTO stud
    FROM Entrance
    WHERE Sroll = x;
    dbms_output.put_line('Student info');
    dbms_output.put_line('ID = ' || stud.Sroll || ' Name = ' || stud.Sname || ' Dept = ' || stud.Sdept || ' Marks = ' || stud.SMarks || ' Dob = ' || stud.Sdob);
    
    --5. Implement the Exceptions TOO_MANY_ROWS and NO_DATA_FOUND.
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('too many rows');
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Student not found');   
END;
/

DECLARE 
    c NUMBER;
    d Entrance.Sdept%type;
    min_marks NUMBER;
    max_marks NUMBER;
    avg_marks NUMBER;
    stud Entrance%rowtype;

    CURSOR cur IS
        (SELECT Sroll, Sname, Sdept, SMarks, Sdob  FROM Entrance
        WHERE Sdob = (SELECT MIN(Sdob) FROM Entrance));
BEGIN
    --1. Count the number of Students.
    SELECT COUNT(Sroll) INTO c FROM Entrance;
    dbms_output.put_line('no of Students  = ' || c);

    --2. Find the maximum and minimum marks obtained.
    SELECT MIN(SMarks), MAX(SMarks), AVG(SMarks)
    INTO min_marks, max_marks, avg_marks
    FROM Entrance;

    dbms_output.put_line('min marks      = ' || min_marks);
    dbms_output.put_line('max marks      = ' || max_marks);
    dbms_output.put_line('avg marks      = ' || avg_marks );

    --3. List the details of the student having the maximum age.
    dbms_output.put_line('Oldest student info');
    OPEN cur;
    LOOP 
        FETCH cur INTO stud;
        EXIT WHEN cur%notfound;
        dbms_output.put_line('ID = ' || stud.Sroll || ' Name = ' || stud.Sname || ' Dept = ' || stud.Sdept || ' Marks = ' || stud.SMarks || ' Dob = ' || stud.Sdob);
    END LOOP;
    CLOSE cur; 

    --4. Write a procedure/function to input the Sroll of a Student and return the Student details.
    c:=&enter_roll_no;
    dispStd(c);
END;
/