CREATE TABLE EMPLOYEES(
    EMP_NO INT NOT NULL PRIMARY KEY,
    BIRTH_DATE DATE,
    FIRST_NAME VARCHAR(14),
    LAST_NAME VARCHAR(26),
    SEX ENUM("M","F"),
    HIRE_DATE DATE
);

CREATE TABLE TITLES(
    EMP_NO INT,
    INDEX(EMP_NO),
    TITLE VARCHAR(50) PRIMARY KEY,
    FROM_DATE DATE NOT NULL,
    TO_DATE DATE NOT NULL,
    CONSTRAINT FK_TITLES FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO)
);

CREATE TABLE SALARIES(
    EMP_NO INT,
    INDEX(EMP_NO),
    SALARY INT,
    FROM_DATE DATE NOT NULL,
    TO_DATE DATE NOT NULL, 
    CONSTRAINT PK_SALARIES PRIMARY KEY(FROM_DATE,TO_DATE),
    CONSTRAINT FK_SALARIES FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO)

);

CREATE TABLE DEPT_EMP(
    EMP_NO INT,
    INDEX(EMP_NO),
    DEPT_NO CHAR(4) NOT NULL PRIMARY KEY,
    FROM_DATE DATE NOT NULL,
    TO_DATE DATE NOT NULL,
    CONSTRAINT FK_DEPT_EMP FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO)
);


CREATE TABLE DEPT_MANAGER(
    DEPT_NO CHAR(4) NOT NULL PRIMARY KEY,
    EMP_NO INT,
    INDEX(EMP_NO),
    FROM_DATE DATE,
    TO_DATE DATE,
    CONSTRAINT FK_DEPT_MANAGER FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO)
);

CREATE TABLE DEPARTMENTS(
    DEPT_NO CHAR(4),
    INDEX(DEPT_NO),
    DEPT_NAME VARCHAR(40),
    CONSTRAINT FK_DEPARTMENTS FOREIGN KEY (DEPT_NO) REFERENCES DEPT_MANAGER(DEPT_NO)
);


