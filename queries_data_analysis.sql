--Data Analysis - Queries

--1.List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT E.EMP_NO,E.LAST_NAME,E.FIRST_NAME,E.SEX,S.SALARY 
FROM EMPLOYEES E, SALARIES S
WHERE E.EMP_NO = S.EMP_NO

--2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT FIRST_NAME,LAST_NAME,HIRE_DATE 
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE)=1986

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT DM.DEPT_NO,D.DEPT_NAME,DM.EMP_NO,E.FIRST_NAME,E.LAST_NAME
FROM DEPT_MANAGER DM,DEPARTMENTS D,EMPLOYEES E
WHERE D.DEPT_NO = DM.DEPT_NO AND
	  E.EMP_NO = DM.EMP_NO

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT E.EMP_NO,E.FIRST_NAME,E.LAST_NAME,D.DEPT_NAME 
FROM EMPLOYEES E , DEPARTMENTS D, DEPT_EMP DEPT
WHERE E.EMP_NO = DEPT.EMP_NO
AND DEPT.DEPT_NO = D.DEPT_NO

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT FIRST_NAME,LAST_NAME,SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
AND LAST_NAME LIKE 'B%'

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT E.EMP_NO,E.FIRST_NAME,E.LAST_NAME,D.DEPT_NAME 
FROM EMPLOYEES E , DEPARTMENTS D, DEPT_EMP DEPT
WHERE E.EMP_NO = DEPT.EMP_NO
AND DEPT.DEPT_NO = D.DEPT_NO
AND D.DEPT_NAME = (SELECT DEPT_NAME FROM DEPARTMENTS WHERE DEPT_NAME = 'Sales')

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT E.EMP_NO,E.FIRST_NAME,E.LAST_NAME,D.DEPT_NAME 
FROM EMPLOYEES E , DEPARTMENTS D, DEPT_EMP DEPT
WHERE E.EMP_NO = DEPT.EMP_NO
AND DEPT.DEPT_NO = D.DEPT_NO
AND ((D.DEPT_NAME =  'Sales') OR  (D.DEPT_NAME =  'Development'))

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT LAST_NAME,COUNT(EMP_NO)AS FREQ_COUNT_EMP_LASTNAME
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY LAST_NAME DESC




