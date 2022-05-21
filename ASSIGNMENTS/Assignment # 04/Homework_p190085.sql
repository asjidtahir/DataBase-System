--1):
select hotelname from hotel where hotelname LIKE '__t%' order by hotelname desc;
--12):
select roomno from hotel natural join room where city='London';
--10):
select guestname from hotel natural join booking natural join guest where hotelname='Watergate';
--6):
select hotelname from hotel natural join room where type='double' AND type='family';
--7):
select * from hotel natural join room where type='single' AND type='double';
select hotelname from hotel natural join room where type='single' AND type='double';
--OR
select * from hotel natural join room where type!='family';
--9):
select type, price from hotel natural join room where hotelname='Grosvenor';
--11):
select hotelname from hotel natural join room where roomno >2;
--8):
select hotelname,hotelno,type from hotel natural join room where price < 40.00 AND type='double' OR type='family' order by
price asc;
--4):
select roomno, hotelno, hotelname from hotel natural join room natural join booking where datefrom AND dateto BETWEEN 
'2004-01-01' AND '2010-01-01';
--3):
select hotelno, hotelname, price from hotel natural join room order by price desc LIMIT 1,1;
--5):
select roomno, hotelno,hotelname from hotel natural join room natural join booking where type='single' order by price
desc limit 2,1;
--2):
SELECT * from hotel natural join booking natural join guest WHERE guestname LIKE "%Tony%" or guestname Like "%Farrel%" and 
 guestaddress= '12 Park Pl Glasgow' or guestaddress='6 Achray St, Glasgow';