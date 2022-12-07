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