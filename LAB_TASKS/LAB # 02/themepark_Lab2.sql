CREATE TABLE THEMEPARK (
PARK_CODE VARCHAR(10) PRIMARY KEY,
PARK_NAME VARCHAR(35) NOT NULL,
PARK_CITY VARCHAR(50) NOT NULL,
PARK_COUNTRY CHAR(2) NOT NULL);

CREATE TABLE EMPLOYEE (
EMP_NUM NUMERIC(4) PRIMARY KEY,
EMP_TITLE VARCHAR(4),
EMP_LNAME VARCHAR(15) NOT NULL,
EMP_FNAME VARCHAR(15) NOT NULL,
EMP_DOB DATE NOT NULL,


EMP_HIRE_DATE DATE,
EMP_AREA_CODE VARCHAR(4) NOT NULL,
EMP_PHONE VARCHAR(12) NOT NULL,
PARK_CODE VARCHAR(10),
INDEX (PARK_CODE),
CONSTRAINT FK_EMP_PARK FOREIGN KEY(PARK_CODE) REFERENCES
THEMEPARK(PARK_CODE));

CREATE TABLE TICKET (
TICKET_NO NUMERIC(10) PRIMARY KEY,


TICKET_PRICE NUMERIC(4,2) DEFAULT 00.00 NOT NULL,
TICKET_TYPE VARCHAR(10),
PARK_CODE VARCHAR(10),
INDEX (PARK_CODE),
CONSTRAINT FK_TICKET_PARK FOREIGN KEY(PARK_CODE)
REFERENCES THEMEPARK(PARK_CODE));

CREATE TABLE ATTRACTION (
ATTRACT_NO NUMERIC(10) PRIMARY KEY,
ATTRACT_NAME VARCHAR(35),
ATTRACT_AGE NUMERIC(3) DEFAULT 0 NOT NULL,
ATTRACT_CAPACITY NUMERIC(3) NOT NULL,
PARK_CODE VARCHAR(10),
INDEX (PARK_CODE),
CONSTRAINT FK_ATTRACT_PARK FOREIGN KEY(PARK_CODE)
REFERENCES THEMEPARK(PARK_CODE));

CREATE TABLE HOURS (
EMP_NUM NUMERIC(4),
ATTRACT_NO NUMERIC(10),
HOURS_PER_ATTRACT NUMERIC(2) NOT NULL,
HOUR_RATE NUMERIC(4,2) NOT NULL,
DATE_WORKED DATE NOT NULL,
INDEX (EMP_NUM),
INDEX (ATTRACT_NO),
CONSTRAINT PK_HOURS PRIMARY KEY (EMP_NUM, ATTRACT_NO,
DATE_WORKED),
CONSTRAINT FK_HOURS_EMP FOREIGN KEY (EMP_NUM)
REFERENCES EMPLOYEE(EMP_NUM),
CONSTRAINT FK_HOURS_ATTRACT FOREIGN KEY (ATTRACT_NO)
REFERENCES ATTRACTION(ATTRACT_NO));

CREATE TABLE SALES (
TRANSACTION_NO NUMERIC PRIMARY KEY,
PARK_CODE VARCHAR(10),
SALE_DATE DATE NOT NULL,
INDEX (PARK_CODE),
CONSTRAINT FK_SALES_PARK FOREIGN KEY(PARK_CODE)
REFERENCES THEMEPARK(PARK_CODE));

CREATE TABLE SALES_LINE (
TRANSACTION_NO NUMERIC,
LINE_NO NUMERIC(2,0) NOT NULL,
TICKET_NO NUMERIC(10) NOT NULL,
LINE_QTY NUMERIC(4) DEFAULT 0 NOT NULL,
LINE_PRICE NUMERIC(9,2) DEFAULT 0.00 NOT NULL,
INDEX (TRANSACTION_NO),
INDEX (TICKET_NO),
CONSTRAINT PK_SALES_LINE PRIMARY KEY
(TRANSACTION_NO,LINE_NO),
CONSTRAINT FK_SALES_LINE_SALES FOREIGN KEY
(TRANSACTION_NO) REFERENCES SALES(TRANSACTION_NO),
CONSTRAINT FK_SALES_LINE_TICKET FOREIGN KEY (TICKET_NO)
REFERENCES TICKET(TICKET_NO));


INSERT INTO THEMEPARK VALUES ('FR1001','FairyLand','PARIS','FR');
INSERT INTO THEMEPARK VALUES ('UK3452','PleasureLand','STOKE','UK');
INSERT INTO TICKET VALUES (13001,18.99,'Child','FR1001');
INSERT INTO TICKET VALUES (13002,34.99,'Adult','FR1001');
INSERT INTO TICKET VALUES (13003,20.99,'Senior','FR1001');
INSERT INTO TICKET VALUES (88567,22.50,'Child','UK3452');
INSERT INTO TICKET VALUES (88568,42.10,'Adult','UK3452');
INSERT INTO TICKET VALUES (89720,10.99,'Senior','UK3452');


--TASK1

INSERT INTO THEMEPARK VALUES ('AU1001','SkiWorld','AU','UK');
INSERT INTO THEMEPARK VALUES ('GR5001','ROBOLAND','GR','SP');
--TASK2

INSERT INTO EMPLOYEE VALUES ('2049','Mr','Rahat','Nouman','1990-12-20','2015-5-5','7253','502-4934','AU1001');

--TASK3
UPDATE THEMEPARK
SET PARK_NAME ='MiniLand'
WHERE PARK_NAME='SkiWorld';

--Task4

DELETE FROM THEMEPARK
WHERE PARK_NAME='RoboLand';


