CREATE TABLE WORKER(WORKER_ID int NOT NULL PRIMARY KEY ,FIRST_NAME VARCHAR(100),LAST_NAME VARCHAR(100),SALARY INT, JOINING_DATE DATE,DEPARTMENT VARCHAR(100))
INSERT INTO WORKER(
WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
VALUES
        (001, 'Monika', 'Arora', 100000, '14-02-20', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11', 'Admin')
SELECT * FROM WORKER		
CREATE TABLE BONUS(WORKER_REF_ID INT,BONUS_DATE DATE,BONUS_AMOUNT INT)
INSERT INTO BONUS( 
WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT)
VALUES
        (001,'16-02-20',5000),
		(002,'16-06-11',3000),
		(003,'16-02-20',4000),
		(001,'16-02-20',4500),
		(002,'16-06-11',3500)
SELECT * FROM BONUS		
CREATE TABLE TITLE (
WORKER_REF_ID INT,WORKER_TITLE VARCHAR(100),AFFECTED_FROM DATE,FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID))
INSERT INTO TITLE(
WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)
VALUES
 (001, 'Manager', '2016-02-20'),
 (002, 'Executive', '2016-06-11'),
 (008, 'Executive', '2016-06-11'),
 (005, 'Manager', '2016-06-11'),
 (004, 'Asst. Manager', '2016-06-11'),
 (007, 'Executive', '2016-06-11'),
 (006, 'Lead', '2016-06-11'),
 (003, 'Lead', '2016-06-11')
 SELECT * FROM TITLE
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT * FROM TITLE
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM WORKER
-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT distinct DEPARTMENT FROM WORKER
-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select SUBSTRING(FIRST_NAME,1,3) FROM WORKER 
-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,binary 'a') from WORKER where FIRST_NAME='Amitabh'
-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(FIRST_NAME) FROM WORKER
-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT)FROM WORKER
-- Q-8.Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT LENGTH(DEPARTMENT) FROM WORKER 
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER 
-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM WORKER
-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER 
ORDER BY FIRST_NAME ASC
-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC , DEPARTMENT DESC
-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME in ('Vipul','Satish')
-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name not in ('Vipul','Satish')
-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where department='Admin'
Select * from Worker where DEPARTMENT like 'Admin%'
-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like '%a%'
-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like '%a'
-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where first_name like '_____h'
-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000
-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(department) FROM WORKER WHERE department='Admin'
-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT FIRST_NAME,LAST_NAME,SALARY FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000
-- OR
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker WHERE Salary BETWEEN 50000 AND 100000
-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(WORKER_ID) NO_OF_WORKERS FROM WORKER 
GROUP BY DEPARTMENT
ORDER BY NO_OF_WORKERS DESC
-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager')
-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1
-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0
-- Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0
-- Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker
-- Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone)
-- Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Worker
MINUS
SELECT * FROM Title
-- Q-31. Write an SQL query to show the current date and time.
SELECT NOW()
-- Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker order by salary desc limit 10
-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT 5
-- Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 )
--  Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID
-- Q-36. Write an SQL query to show the second highest salary from a table.
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker)
-- Q-37. Write an SQL query to show one row twice in results from a table.
select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR'
-- Q-38. Write an SQL query to fetch intersecting records of two tables
select * from worker
intersect
select * from workerclone
-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker
where worker_id <= (select count(worker_id)/2 from  worker)
-- Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select department,count(worker_id) as  worker from worker
group by department 
having count(worker_id)<5
--  Q-41. Write an SQL query to show all departments along with the number of people in there.
select department,count(department) as  worker from worker
group by department 
-- Q-42. Write an SQL query to show the last record from a table.
select * from worker where worker_id= (select max(worker_id) from worker)
-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id= (select min(worker_id) from worker)
-- Q-44. Write an SQL query to fetch the last five records from a table.
select * from worker where worker_id <=5 
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5
-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary
--  Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc
-- Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc
-- Q-48. Write an SQL query to fetch nth(8) max salaries from a table.
SELECT distinct Salary from worker a WHERE 8 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc
-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT
-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker)
 