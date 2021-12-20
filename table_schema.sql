CREATE TABLE DEPARTMENTS(
DEPT_NO VARCHAR(20) PRIMARY KEY,
DEPT_NAME VARCHAR ( 50 )  NOT NULL
);

CREATE TABLE TITLES(
TITLE_ID VARCHAR(20) PRIMARY KEY,
TITLE VARCHAR ( 50 )  NOT NULL
);
	
CREATE TABLE EMPLOYEES(
EMP_NO SERIAL PRIMARY KEY,
EMP_TITLE VARCHAR(20) NOT NULL,
FOREIGN KEY (EMP_TITLE) REFERENCES TITLES(TITLE_ID),
BIRTH_DATE DATE NOT NULL,
FIRST_NAME VARCHAR ( 50 ) NOT NULL,
LAST_NAME  VARCHAR ( 50 ) NOT NULL,
SEX VARCHAR (1)NOT NULL,
HIRE_DATE DATE NOT NULL
);

CREATE TABLE DEPT_EMP(
EMP_NO INTEGER NOT NULL,
FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO),
DEPT_NO VARCHAR(20)  NOT NULL,
FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENTS(DEPT_NO),
PRIMARY KEY(EMP_NO,DEPT_NO)
);
	
CREATE TABLE DEPT_MANAGER(
DEPT_NO VARCHAR(20)  NOT NULL,
FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENTS(DEPT_NO),
EMP_NO INTEGER NOT NULL,
FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO),
PRIMARY KEY(DEPT_NO,EMP_NO)
);

CREATE TABLE SALARIES(
EMP_NO INTEGER NOT NULL,
FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO),
SALARY INTEGER NOT NULL
);

