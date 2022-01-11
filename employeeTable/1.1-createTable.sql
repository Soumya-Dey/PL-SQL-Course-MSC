create table emp(
    emp_id int,
    emp_name varchar(10),
    emp_dept varchar(16),
    emp_salary int
);

insert into emp values(1, 'emp 01', 'Engineering', 23000);
insert into emp values(2, 'emp 02', 'HR', 54000);
insert into emp values(3, 'emp 03', 'Hardware', 36000);
insert into emp values(4, 'emp 04', 'Sales', 28000);
insert into emp values(5, 'emp 05', 'Marketing', 43000);
insert into emp values(5, 'emp 06', 'Sales', 37000);
insert into emp values(6, 'emp 07', 'Marketing', 40000);
insert into emp values(7, 'emp 08', 'Marketing', 20000);

create table manager(
    manager_id int,
    manager_name varchar(30),
    primary key(manager_id)
);

insert into manager values(1, 'Philip Pancras');
insert into manager values(2, 'Lissa Gail');
insert into manager values(3, 'Cherry Warner');
insert into manager values(4, 'Zac Hamilton');
insert into manager values(5, 'Elliot Carmen');

alter table emp add m_id int references manager(manager_id);

update emp set m_id = 5 where emp_id = 1;
update emp set m_id = 1 where emp_id = 2;
update emp set m_id = 4 where emp_id = 3;
update emp set m_id = 3 where emp_id = 4;
update emp set m_id = 2 where emp_id = 5;