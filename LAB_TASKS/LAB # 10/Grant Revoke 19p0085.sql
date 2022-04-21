--LABTASKS
--1)
--Create user with my name
create user 'asjid'@'localhost' identifed by 'ajj';
--To login to second terminal asjid 
--mysql -u asjid -p
show databases;
--2a)
GRANT ALL PRIVILEGES ON 19p0085_asjidtahir.* TO 'asjid'@'localhost';
--2b)
select * from themepark;
update themepark SET PARK_NAME='AJJI' where PARK_CODE='dgsgd';
--2c)
--To access view
GRANT ALL PRIVILEGES ON 19p0085_asjidtahir.empfr1 TO 'asjid'@'localhost';
select * from empfr1;
--2d)
GRANT CREATE on *.* to 'asjid'@'localhost';
create database test_DB;
--3)
revoke select on 19p0085_asjidtahir.empfr1 from 'asjid'@'localhost';
--4a)
--I can use themepark database.
select * from themepark;
insert into themepark values('FR1005','Ajjiland','Lahore','PK');
select * from themepark;
insert into themepark values('FR1006','Ibrarland','Islamabad','P');
commit;
select * from themepark; 
rollback;
select * from themepark; --Roll back command not work because we used commit command to save our insertion data.
--ROLLBACK Task
--4b)
insert into themepark values('FR1099','Omiland','Lhr','k');
select * from themepark; 
--4c)
update themepark SET PARK_NAME='DEMO' where PARK_CODE='FR1001';
--4d)
rollback;
select * from themepark; 
--4e)
insert into themepark values ('ab2222','luminus','Sheikhupura','AB');
insert into themepark values ('ab333','stadum','sialkot','CD');
update themepark set park_name='shumalia' where park_code='FR1001';
delete from themepark where park_code='dgsgd';
savepoint s1;
select * from themepark;
--4f)
insert into themepark values ('ab4444','minipark','Karachi','DD');
insert into themepark values ('ab5555','forest','Islamabad','EE');
rollback to s1;
select * from themepark;






