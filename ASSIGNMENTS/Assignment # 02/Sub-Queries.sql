--Question no 01:
--Display the employee who got the maximum salary.
select * from emp 
where salary = (select Max(salary) from emp);


--Question no 02:
--Display the employees who are working in Sales department.
--FOR DISPLAYING EMPLOYESS NAME
select ename from emp e , dept d
where e.deptno = d.deptno AND d.dname = 'sales';
--FOR DISPLAYING ALL DETAILS OF EMPLOYEES
select * from emp e , dept d
where e.deptno = d.deptno AND d.dname = 'sales';


--Question no 03:
--Display the employees who are working in “New York”.
select * from emp
where deptno = (select deptno from dept where location = 'New York');



--Question no 04:
--Find out no. of employees working in “Sales” department.
select count(*) from emp natural join dept
where dname=(select dname from dept where
dname='sales');




--Question no 05:
--List out the employees who earn more than every employee in department 30.
select * from emp
where salary > ALL (select salary from emp where deptno = '30');



--Question no 06:
--List out the employees who earn more than the lowest salary in department 30.
select * from emp 
where salary > Any (select salary from emp where deptno = '30');





