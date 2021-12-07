create table teacher(
    t_id int,
    t_name varchar(10),
    t_dept varchar(20),
    t_salary int,
    t_dob date,
    primary key(t_id)
);

insert into teacher values(1, 'Teacher 01', 'Computer Science', 52000, '01-JAN-1987');
insert into teacher values(2, 'Teacher 02', 'Physics', 45000, '14-DEC-1990');
insert into teacher values(3, 'Teacher 03', 'English', 65000, '01-APR-1971');
insert into teacher values(4, 'Teacher 04', 'Mathematics', 55000, '22-FEB-1982');
insert into teacher values(5, 'Teacher 05', 'Chemistry', 35000, '09-SEP-1999');
insert into teacher values(6, 'Teacher 06', 'Computer Science', 63000, '01-APR-1971');