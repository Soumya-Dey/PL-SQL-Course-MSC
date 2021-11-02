create table emp(
    emp_id int,
    emp_name varchar(30),
    emp_dept varchar(30),
    emp_salary int,
    primary key(emp_id)
);

insert into emp values(1, 'Alexandro Dare', 'Engineering', 23000);
insert into emp values(2, 'Birdie Brakus', 'Design', 54000);
insert into emp values(3, 'Sigmund Hills', 'Hardware', 36000);
insert into emp values(4, 'Cora Baumbach', 'Sales', 28000);
insert into emp values(5, 'Kay Mann', 'Marketing', 43000);

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