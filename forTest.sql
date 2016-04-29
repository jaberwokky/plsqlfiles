create table student(stud_id number not null, name varchar2(25) not null, address varchar2(50), graduation date);

INSERT INTO student VALUES(101, 'Smith'); -- нет

INSERT INTO student VALUES(101, '100 Main Street', '17-JUN-99', 'Smith'); -- нет

INSERT INTO test VALUES(101, 'Smith', '100 Main Street', '17-JUN-99'); -- нет, не та база

INSERT INTO student (stud_id,address,gradulation) VALUES(101, 'Smith', '100 Main Street', '17-JUN-99'); -- нет, too many values

INSERT INTO student (stud_id,address,name,graduation) VALUES(101, '100 Main Street', 'Smith', '17-JUN-99'); -- норм, но в тесте опечатка -- лишняя скобка

create table random_numbers(id number, value number);

insert into random_numbers(id, value)
select level as id,
  trunc(dbms_random.value(0,5)) as value
  from dual
  connect by level <= 100;

create table random_numbers1(id number, value1 number, value2 number, value3 number);

insert into random_numbers1(id, value1, value2, value3)
select level as id,
  trunc(dbms_random.value(0,5)) as value1,
  trunc(dbms_random.value(10,15)) as value2,
  trunc(dbms_random.value(100,105)) as value3
  from dual
  connect by level <= 100;

select sum(value)
from random_numbers
where value>=3;

select sum(value1 + value2 + value3)
from random_numbers1
where value1 > 3;



CREATE TABLE ord_details
(ord_no NUMERIC(2) PRIMARY KEY,
item_no NUMERIC (3) PRIMARY KEY,
ord_date DATE NOT NULL); -- два ключа, нельзя


CREATE TABLE ord_details
(ord_no NUMERIC(2) UNIQUE NOT NULL,
item_no NUMERIC (3),
ord_date DATE NOT NULL); -- норм (но в тесте опечатка, стоит запятая)


CREATE TABLE ord_details
(ord_no NUMERIC(2),
item_no NUMERIC (3),
ord_date DATE DEFAULT NOT NULL,
CONSTRAINT ord_uq UNIQUE (ord_no),
CONSTRAINT ord_pk PRIMARY KEY (ord_no)); -- нет

CREATE TABLE ord_details1
(ord_no NUMERIC(2),
item_no NUMERIC (3),
ord_date DATE NOT NULL,
CONSTRAINT ord_pk PRIMARY KEY (ord_no, item_no)); -- норм


create table table1(a1 number, a2 number, c1 number, c2 number);

insert into table1
select 5, 5, 5, 5
from dual
union all
select 5, 5, 8, 6
from dual
union all
select 5, 5, 3, 7
from dual
union all
select 2, 3, null, 7
from dual
union all
select 4, null, null, null
from dual;

select *
from table1;

commit;

create table table2(b1 number, b2 number, c1 number, c2 number);

insert into table2
select 5, 5, 5, 5
from dual
union all
select 1, 2, 5, 6
from dual
union all
select 3, 8, 5, 5
from dual
union all
select 3, 8, 5, 5
from dual
union all
select 8, 8, 8, 8
from dual
union all
select 3, null, null, 5
from dual
union all
select 3, null, null, 5
from dual;

select *
from table2;

commit;

select *
from table1
right outer join table2
on a2 = b1
and a1 < b2;

select *
from table1;

select *
from table2;

select *
from table1
natural full outer join table2;

select level
from dual
connect by level<100;


WITH data AS (
  SELECT /*+ MATERIALIZE */ level AS id
  FROM   dual
  CONNECT BY level <= 10
)
SELECT rownum AS id
FROM   data, data, data;

