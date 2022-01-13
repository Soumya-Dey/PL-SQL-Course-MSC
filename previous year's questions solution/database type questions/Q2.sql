/*
Program no      : 2
Author          : Gyan
Question        :

Create the following tables and insert suitable records in them maintaining integrity constraints:
Suppliers ( sid, sname, address)
Parts ( pid, pname,color)
Catalog ( sid, pid, cost)
1. Insert at least 6 records in each table. Make proper validation such that every pid must begin with ‘PI’, the price range of all the items is from Rs.500/- to Rs.25000/-.
2. Write a PL/SQL code using Cursor to list the 3rd maximum price from the Catalog table.
3. Write a function to which will take the pid as an input (from the Parts table) and list the details of the product with that given pid.
4. Implement one built-in and one user-defined Exception.
*/

CREATE TABLE Suppliers(
    sid VARCHAR(10) PRIMARY KEY,
    sname VARCHAR(10),
    address VARCHAR(10),
    CHECK(sid LIKE 'S%')
);
-- ALTER TABLE Suppliers
-- ADD CONSTRAINT CK_Table_SID CHECK (
--    sid like 'S%'
-- );

CREATE TABLE Parts(
    pid VARCHAR(10) PRIMARY KEY,
    pname VARCHAR(10),
    color VARCHAR(10),
    CHECK(pid LIKE 'PI%')
);

CREATE TABLE Catalog01(
    sid VARCHAR(10),
    pid VARCHAR(10),
    cost NUMBER,
    CONSTRAINT fks FOREIGN KEY (sid) REFERENCES Suppliers(sid),
    CONSTRAINT fkp FOREIGN KEY (pid) REFERENCES Parts(pid),
    CHECK(cost >= 500 and cost <= 25000)
);

INSERT INTO Suppliers VALUES('S1', 'Alex', 'Kolkata');
INSERT INTO Suppliers VALUES('S2', 'John', 'Mumbai');
INSERT INTO Suppliers VALUES('S3', 'Paul', 'Delhi');
INSERT INTO Suppliers VALUES('S4', 'Tony', 'Pune');
INSERT INTO Suppliers VALUES('S5', 'Scott', 'Delhi');
INSERT INTO Suppliers VALUES('S6', 'James', 'Kolkata');

INSERT INTO Parts VALUES('PI1', 'Pen', 'Red');
INSERT INTO Parts VALUES('PI2', 'Paper', 'White');
INSERT INTO Parts VALUES('PI3', 'Ink', 'Blue');
INSERT INTO Parts VALUES('PI4', 'Pencil', 'Gray');
INSERT INTO Parts VALUES('PI5', 'Book', 'Red');
INSERT INTO Parts VALUES('PI6', 'Copy', 'White');

INSERT INTO Catalog01 VALUES('S1', 'PI1', 2500);
INSERT INTO Catalog01 VALUES('S1', 'PI2', 5000);
INSERT INTO Catalog01 VALUES('S2', 'PI3', 1000);
INSERT INTO Catalog01 VALUES('S2', 'PI4', 1400);
INSERT INTO Catalog01 VALUES('S3', 'PI1', 6700);
INSERT INTO Catalog01 VALUES('S3', 'PI4', 3400);
INSERT INTO Catalog01 VALUES('S4', 'PI1', 8900);
INSERT INTO Catalog01 VALUES('S4', 'PI4', 1400);
INSERT INTO Catalog01 VALUES('S5', 'PI3', 6700);
INSERT INTO Catalog01 VALUES('S4', 'PI6', 1450);
INSERT INTO Catalog01 VALUES('S5', 'PI5', 8950);

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    INVALID_ID EXCEPTION;

    id Parts.pid%type;
    p Parts%rowtype;

    cnt NUMBER;
    cat Catalog01%rowtype;
    c_sid Catalog01.sid%type;
    c_pid Catalog01.pid%type;
    c_cost Catalog01.cost%type;
    rnum NUMBER;
    CURSOR cur IS
     SELECT * FROM Catalog01 ORDER BY cost DESC ;

    CURSOR cur2 IS
    SELECT *
    FROM (select Catalog01.*, rownum rnum from
                (select * from Catalog01 ORDER BY cost DESC) Catalog01
        where rownum <= 3 )
    WHERE rnum >= 3;

    cursor cur3 is
    select *  
    from (
        select Catalog01.*, dense_rank()
        over(order by cost desc) ranking from Catalog01
    )
    where ranking = 3;

BEGIN
    --2. Write a PL/SQL code using Cursor to list the 3rd maximum price from the Catalog table.
    -- Done by Gyan
    cnt:=0;
    OPEN cur;
    LOOP
        FETCH cur into cat;
        EXIT WHEN  cur%notfound;
        cnt:= cnt + 1;
        IF (cnt = 3 )THEN
            dbms_output.put_line('3rd max price = ' || cat.cost);
            --EXIT;
        END IF;
    END LOOP;

    --2. Write a PL/SQL code using Cursor to list the 3rd maximum price from the Catalog table.
    -- Done by Me [Better solution]
    OPEN cur2;
    FETCH cur2 into c_sid, c_pid, c_cost, rnum;
    IF cur2%notfound THEN
    RAISE NO_DATA_FOUND;
    END IF;
    dbms_output.put_line('3rd max price = ' || c_sid || ' ' || c_pid || ' ' || c_cost);

    -- Done by Me [Best solution]
    OPEN cur3;
    FETCH cur3 into c_sid, c_pid, c_cost, rnum;
    IF cur3%notfound THEN
    RAISE NO_DATA_FOUND;
    END IF;
    dbms_output.put_line('3rd max price = ' || c_sid || ' ' || c_pid || ' ' || c_cost);

    -- Same thing done without cursor
    SELECT *
    into c_sid, c_pid, c_cost, rnum 
    FROM (select Catalog01.*, rownum rnum from
                (select * from Catalog01 ORDER BY cost DESC) Catalog01
        where rownum <= 3 )
    WHERE rnum >= 3;
    dbms_output.put_line('3rd max price = ' || c_sid || ' ' || c_pid || ' ' || c_cost);

    --3. Write a function to which will take the pid as an input (from the Parts table) 
    --   and list the details of the product with that given pid.
    id:=&p_id;
    IF id NOT LIKE 'PI%' THEN
        RAISE INVALID_ID;
    END IF;

    SELECT * INTO p
    FROM Parts WHERE pid = id;
    dbms_output.put_line('pid = ' || p.pid || ' name = ' || p.pname || ' color = ' || p.color);

    --4. Implement one built-in and one user-defined Exception.
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('record not found! ');
        WHEN INVALID_ID THEN
            dbms_output.put_line('id invalid!');
END;
/