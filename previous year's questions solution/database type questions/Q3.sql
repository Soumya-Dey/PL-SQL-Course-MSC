create table Sailors
(
	sid char(4),
	sname varchar(10),
	rating number(3),
	age number(3),
	constraint Sailor_PK primary key(sid)
);

insert into Sailors values('S001', 'Sherpa', 80, 32);
insert into Sailors values('S002', 'Thukpa', 70, 24);
insert into Sailors values('S003', 'Papa', 60, 36);
insert into Sailors values('S004', 'Mapa', 90, 42);
insert into Sailors values('S005', 'Chapa', 91, 32);

create table Boats
(
	bid char(4),
	bname varchar(10),
	colour varchar(10),
	constraint Boats_PK primary key(bid)
);

insert into Boats values('B001', 'Boat1', 'Black');
insert into Boats values('B002', 'Boat2', 'Blue');
insert into Boats values('B003', 'Boat3', 'Yello');
insert into Boats values('B004', 'Boat4', 'Black');
insert into Boats values('B005', 'Boat5', 'Orange');
insert into Boats values('B006', 'Boat6', 'White');

create table Reserves
(
	sid char(4),
	bid char(4),
	day varchar(10),
	constraint Sailor_FK foreign key(sid) references Sailors,
	constraint Boats_FK foreign key(bid) references Boats
);

insert into Reserves values('S001', 'B001', 'Wednesday');
insert into Reserves values('S001', 'B002', 'Thursday');
insert into Reserves values('S003', 'B005', 'Wednesday');
insert into Reserves values('S002', 'B001', 'Sunday');
insert into Reserves values('S005', 'B004', 'Friday');
insert into Reserves values('S001', 'B006', 'Tuesday');

a(i) (select * from Sailors natural join Boats natural join Reserves where colour='Black') 
intersect (select * from Sailors natural join Boats natural join Reserves where colour='White');
a(ii) select sname from Sailors where rating = (select max(rating) from Sailors) and (sname <> 'Sherpa');

set serveroutput on;
set verify off;
declare
	sid1 Sailors.sid%type;
	sname1 Sailors.sname%type;
	rating1 Sailors.rating%type;
	minage Sailors.age%type;
	age1 Sailors.age%type;
	cursor c is select sid, sname, rating, age from Sailors;
begin
	select age into minage from Sailors where age = (select min(age) from Sailors);
	open c;
	fetch c into sid1, sname1, rating1, age1;
	while c%found loop
		if (age1 = minage)then
			dbms_output.put_line(sid1 || ',' || sname1 || ',' || rating1 || ',' || age1);
		end if;
		fetch c into sid1, sname1, rating1, age1;
	end loop;
EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such Sailors!'); 
   	WHEN others THEN 
      dbms_output.put_line('Error!'); 	
end;
/