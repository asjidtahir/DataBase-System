--Database Created First
create database person;
--Then use it
use person
create table users(
    user_id int(8) not null primary key,
    username varchar(15) not null,
    password varchar(5) not null,
    email varchar(30) not null,
    salary int(8) not null
);

--Insert the data 
insert into users value(1,'abc123','def321','abc123@yahoo.com',3000);
insert into users value(2,'xyz789','asd123','xyz789@@yahoo.com',3000);

create table summary(
    id tinyint(1) not null primary key,
    total_users tinyint(2) not null,
    yahoo tinyint (1) not null,
    hotmail tinyint(1) not null,
    gmail tinyint(1) not null
);

insert into summary values(1,2,1,0,1);


--Task1
DELIMITER $$
CREATE PROCEDURE TASK1()
BEGIN
INSERT INTO SUMMARY VALUES (2,4,2,0,5);
END$$

CALL TASK1$$
SELECT * FROM SUMMARY$$

--Task2
CREATE PROCEDURE TASK3()
BEGIN
INSERT INTO USERS VALUES(4, 'BILAL','HELLOWORLD','IBI@GMAIL.COM',5000);
END$$

CALL TASK3$$
SELECT * FROM USERS$$

--Task3

SELECT MIN(SALARY) FROM USERS;
$$

--Task4
SELECT AVG(SALARY) FROM USERS;
$$

--Task5
CREATE PROCEDURE MINMAX()
BEGIN
SELECT MIN(SALARY) FROM USERS;
SELECT MAX(salary) FROM USERS;
END$$
CALL MINMAX$$

--Task6
Delimiter $$
create trigger task7a after insert
on person.users
for each row begin
insert into person.summary (TOTAL_USER) values (NEW.user_id);
end$$

insert into users (username,password,email) values ('ibrar','abc123','ibrar@gmail.com')$$
select * from users$$
select * from summary$$


insert into users (username,password,email) values ('rajput','fast123','fast@gmail.com')$$
select * from users$$
select * from summary$$




