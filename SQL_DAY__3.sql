

-- sql day 3
USE emp_db;

-- CRUD Operations:
-- CREATE READ, , UPDATE , DELETE

-- create table table_name(columns datatypes)

-- read data:
-- select * from table_name -- entire table 
-- select column_name from table name -- all rows of selected columns

-- update data
-- update table_name set column_name = 'new_value'
-- update table_name set column_name = 'new_value' where condition

-- delete data
-- delete from table_name
-- delete from table_name where condition

-- trucate table
-- truncate table tbale_name
-- where no not allowed with truncate 

-- alter table
-- alter table table_name add column / modify column/ drop column 
-- alter table table_name rename column old_column_name to new_column_name

/*
read data from multipkle table / filter the data / sort the data / select distinct rows/
limit / create group of data / calculate aggeragate values 
*/

-- SQL Clauses

-- Order by Clause
-- To sort the values 
-- default sorting is ascending
-- Use desc keyword to sort the data in descending order 

SELECT * FROM emp_data;

SELECT * FROM emp_data ORDER BY loc;
SELECT * FROM emp_data ORDER BY loc DESC , dept_id;

SELECT * FROM emp_data ORDER BY loc DESC , dept_id DESC;

-- Distinct 
-- To fetch the unique values of columns or unique rows

SELECT loc FROM emp_data;
SELECT DISTINCT loc FROM emp_data; -- unique values of loc columns 
SELECT DISTINCT loc FROM emp_data; -- unique values of loc columns 
SELECT DISTINCT dept_id FROM emp_data; -- unique values of loc columns 

INSERT INTO emp VALUES (1004 ,'dhiraj',30000, 'mumbai'),
					   (1005,'ashish',90000,'chennai');
                       
SELECT DISTINCT * FROM emp;          -- unique rows from table         

-- create table from another table 
-- delete duplicate rows 

CREATE TABLE emp_bkp AS SELECT DISTINCT * FROM emp; 
SELECT * FROM emp_bkp;

SELECT * FROM emp;
TRUNCATE TABLE emp;

INSERT INTO emp SELECT * FROM emp_bkp; -- forst inner query will execute and the outer query will execute 

----------------------------------------------------------------------------------------------------------
-- limit : limit the number of rows in the output based on its index value 
-- limit(offset , no of rows to read )
-- offset (no of rows to skip , default offset value is 0)

SELECT * FROM emp_data;
SELECT * FROM emp_data LIMIT 5;

SELECT * FROM emp_data ORDER BY salary DESC LIMIT 5; -- sort the data and use the limit 
SELECT * FROM emp_data LIMIT 10;

-- skip 9 rows and read 11 rows after that ( record number from 10 to 20)
SELECT * FROM emp_data LIMIT 9,11;

-- read rows from 25 to 30
SELECT * FROM emp_data LIMIT 24,6;

-- 10th row
SELECT * FROM emp_data LIMIT 9,1;

-- 17th row
SELECT * FROM emp_data LIMIT 16,1;

-- nth row
-- select * from emp_data limit n-1,1;

-- 7th highest slary using limit
SELECT * FROM emp_data ORDER BY salary DESC LIMIT 6,1;

SELECT * FROM emp ORDER BY salary DESC;
INSERT INTO emp VALUE ( 1006 , 'sneha' , 70000 , 'pune');
/*
90
80
70
70
50 -- 4th Highest salary 
30
*/

SELECT * FROM emp ORDER BY salary DESC LIMIT 3,1;
SELECT DISTINCT  salary FROM emp ORDER BY salary DESC LIMIT 3,1;


SELECT * FROM emp WHERE salary= 50000;

-- subqueries in where clause
SELECT * FROM emp WHERE salary = (SELECT DISTINCT  salary FROM emp ORDER BY salary DESC LIMIT 3,1);

-- Aggregate functions
-- max , min , sum , count , avg

SELECT * FROM emp_data;
SELECT MIN(salary) FROM emp_data;

SELECT * FROM emp_data WHERE salary =
(SELECT MIN(salary) FROM emp_data);

SELECT MAX(salary) FROM emp_data; -- max salary

SELECT AVG(salary) FROM emp_data; -- Average salary

SELECT SUM(salary) FROM emp_data; -- Average salary 

SELECT COUNT(*) FROM emp_data;
SELECT COUNT(1) FROM emp_data;
SELECT COUNT(0) FROM emp_data;

SELECT COUNT(*) FROM emp_data;-- It will consider null / not null values
-- select count(coumn_name) from emp_data; -- It will consider only non null values 

SELECT * FROM emp;
SELECT COUNT(*) FROM emp; -- All values 
SELECT COUNT(loc) FROM emp; -- Non null values 

INSERT INTO emp VALUE ( null , null , null , null);


select * from placement;

-- list of students cgpa > 5 , no history of backlogs , done any number of internship

select * from placement where 
cgpa > 5 and 
historyofbacklogs =0 and 
Internships > 0;

-- count of these students
select count(*) from placement where 
cgpa > 5 and 
historyofbacklogs =0 and 
Internships > 0;

-- group by : create group of data based on similar values
-- Branch wise count

select branch,count(roll_no) from placement where 
cgpa > 5 and 
historyofbacklogs =0 and 
Internships > 0
group by branch;

-- Where is always applied on row level data 
-- Having clause is only applied on groups of data 
select branch,count(roll_no) from placement where 
cgpa > 5 and 
historyofbacklogs =0 and 
Internships > 0
group by branch
having count(roll_no) < 150;

-- count (rows) from each location
select * from emp_data;
select loc,count(*) from emp_data group by loc;

select loc,gender, count(*),sum(salary),avg(salary) from emp_data group by loc,gender order by loc;