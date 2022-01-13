/*
Program no      : 6
Author          : Gyan
Question        : Create the following tables with proper integrity constraints: 

Employee (emp_id, ename, esal, d_id) 
Department (d_id,dname,d_location) 

Every employee id must begin with ‘EMP’,
salary range of an employee should be between 10000 and 100000
departments are located in one of the following locations: Kolkata, Mumbai, Delhi and Chennai. 

  (i) Write a PL/SQL code using Cursor to increase the salary of all the 
        employees of Chennai by 25% and decrease the salaries of employees 
        residing in Kolkata by 10% 
  (ii) Write a procedure/function to input the id (emp_id) of an employee and return the 
        corresponding employee details. 
  (iii) Use proper Exception Handling in case of invalid data input.
*/

CREATE TABLE Department(
    d_id NUMBER PRIMARY KEY,
    dname VARCHAR(10),
    d_location VARCHAR(10),
    CHECK (d_location = 'Kolkata' or d_location = 'Mumbai' or d_location = 'Delhi' or d_location = 'Chennai')
);

CREATE TABLE Employee(
    emp_id VARCHAR(5) PRIMARY KEY,
    ename VARCHAR(15),
    esal NUMBER,
    d_id NUMBER,
    CONSTRAINT FK FOREIGN KEY(d_id) REFERENCES Department(d_id),
    CHECK (emp_id LIKE 'EMP%'),
    CHECK (esal > 10000 and esal < 100000)
);

INSERT INTO Department VALUES(1, 'Comp Sc', 'Kolkata');
INSERT INTO Department VALUES(2, 'Physics', 'Mumbai');
INSERT INTO Department VALUES(3, 'Chemistry', 'Delhi');
INSERT INTO Department VALUES(4, 'English', 'Mumbai');
INSERT INTO Department VALUES(5, 'Biology', 'Kolkata');
INSERT INTO Department VALUES(6, 'Commerce', 'Kolkata');