## YOUTUBE LEARNING FOR sql ##
-- ============================
-- 🎯 MySQL Workbench Shortcuts
-- ============================

-- Run/Execute Query:           Ctrl + Enter     
-- Execute Selected Query:      Ctrl + Shift + Enter 
-- New SQL Tab:                 Ctrl + T          
-- Open SQL Script:             Ctrl + O          
-- Save SQL Script:             Ctrl + S          
-- Format SQL Code:             Ctrl + B          
-- Find in Query Editor:        Ctrl + F          
-- Replace in Query Editor:     Ctrl + H          
-- Switch Between Tabs:         Ctrl + Tab       
-- Auto-complete Table/Column:  Ctrl + Space      
-- ================================
-- 📝 Tip: Use Ctrl + Space in Workbench 
-- to auto-complete table or column names.
-- ================================

/*================================  
   SEVERAL WAYS TO CREATE DATABASE
  ================================

Here are several valid ways to create and select a database in MySQL:
### ✅ 1. **Basic (May give error if DB exists)**
```sql
CREATE DATABASE my_database;
USE my_database;
```
---
### ✅ 2. **Safe way (No error if it already exists)**
```sql
CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;
```
---
### ✅ 3. **Drop and recreate (Caution: deletes existing DB)**
```sql
DROP DATABASE IF EXISTS my_database;
CREATE DATABASE my_database;
USE my_database;
*/

show databases ; 

# for creating a database we use=> CREATE DATABASE name_of_database ; #
create database temp1 ;
create database if not exists temp2 ; 
create database college ; 



# for using a database we need USE command => USE database_name; #
USE temp1;


# for removing a database we use=> DROP DATABASE name_of_database ; #
DROP DATABASE temp1 ;
DROP DATABASE temp2 ;
DROP DATABASE college ;

# now create a database for college and create a table.
CREATE DATABASE if not exists college;
use college;

create table student ( Roll_no int primary key , name varchar(50), Age int not null );

# checking data type of any table
  -- Describe table_name or SHOW COLUMNS FROM table_name ;
Describe student ;

# adding data into table student.
-- Way-1
insert into student (roll_no , name , age)  
values ( 1, "AMAN", 26);

-- way-2
insert into student values ( 2, "ASAD", 24);

select * from student ; 

/*
========================================
📘 SQL NOTES: INSERTING VALUES IN TABLE
========================================

-- 1. Insert a single row (all columns, in order)
INSERT INTO student VALUES (101, 'Alice', 20);

-- 2. Insert MULTIPLE row (all columns, in order)
INSERT INTO student VALUES 
(101, 'Alice', 20), 
(103, 'Charlie', 22),
(104, 'Daisy', 23),
(105, 'Ethan', 20);

-- 3. Insert a single row (specify column names)
INSERT INTO student (Roll_no, name, Age) 
VALUES (102, 'Bob', 21);

-- 4. Insert multiple rows at once
INSERT INTO student (Roll_no, name, Age) 
VALUES 
(103, 'Charlie', 22),
(104, 'Daisy', 23),
(105, 'Ethan', 20);

-- View all data in the table
SELECT * FROM student;
*/


# creating a table temp1 and making primary key
create table temp1 (
 id int,
 name varchar(50),
 age int,
 city varchar(20),
 primary key (id)
 );
 
 # CHECKING TABLES
 DESCRIBE TEMP1 ;

 
 #  creating a table temp2 and making combination of two column as primary key
create table temp2 (
 id int,
 name varchar(50),
 age int,
 city varchar(20),
 primary key (id , name)
 );
 
 
 #  creating a table emp with default value of salary 25000
create table emp (
 id int,
 name varchar(50),
 salary int default 25000
 );
select * from emp;

# SHOW ALL TABLES FROM COLLEGE
show tables;

# trying to put values in above table (method-1) 
 insert	 into emp values ( 001 , "nazim khan",35000 );
 
 # inserting multiple rows in above table (method-2) 
 insert	 into emp values 
	(002, 'asad Khan', 25000),
    (003, 'Alice Smith', 30000),
    (004, 'Bob Johnson', 28000),
    (005, 'Charlie Lee',32000);
    
    select * from emp;
    
    -- Inserting multiple rows omitting salary column so that it will take automatically default values
 insert into emp (id,name) values
	(006, 'Diana Prince'),
    (007, 'Ethan Hunt'),
    (008, 'Fiona Glenanne');
select * from emp;

-- Inserting multiple rows with  column specfifc values & using default salary
INSERT INTO emp (id, name, salary) 
VALUES 
    (009, 'NK', DEFAULT),
    (010, 'AS', 30000),
    (011, 'BJ', DEFAULT),
    (012, 'CL', 32000);
    select * from emp ;
    
    
    ## create a new table student1 and insert values.
    create table student1 (
    rollno int,
    name varchar(50),
    marks int,
    grade varchar(3),
    city varchar(15)
    );
     show tables;
     select * from student1;    

-- inserting values 
insert into student1 values(101, "anil",78,"C","Pune");
insert into student1 values 
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi") ;

-- Distinct
--  chck distinct city names
select distinct city from student1;

-- use of WHERE clause
select * from student1 ;
-- find students whose marks are greater than 80
select * from student1 where marks > 80 ;

-- find student names and ciy whose marks are greater than 80
select name , city from student1 where marks > 80 ;

-- find student details whose marks are greater than 80 highest marks on top
select * from student1 where marks > 80 order by marks desc;

-- find students name wh reside in mumbai
select name , city  from student1 where city = "mumbai" ; 

-- find students name wh reside in delhi
select name , city  from student1 where city = "delhi" ; 



-- LIKE operatior in SQL for pattern matching
/*
LIKE   
- The LIKE operator in SQL is used to search for a specified pattern in a column.
- It is commonly used with the WHERE clause to filter data based on partial matches.
- The LIKE operator can be combined with wildcard characters (% or_) to match specific patterns.
Wildcard Characters with LIKE:
	i) Percent (%): Represents zero, one, or more characters.
		For example, 'a%' will match any value starting with  a (e.g., apple, alice , a).
	ii) Underscore (_): Represents a single character.
		For example, 'a__' will match any three-letter word starting with a (e.g., apple, area).
	*/
--  Let's create a simple table named dem_emp and insert some values
	CREATE TABLE dem_emp (
		id INT ,
		name VARCHAR(50),
		email VARCHAR(100),
		department VARCHAR(50) );
        
     INSERT INTO dem_emp (id, name, email, department)
		VALUES
		(1, 'Alice Johnson', 'alice.johnson@example.com', 'HR'),
		(2, 'Bob Smith', 'bob.smith@example.com', 'IT'),
		(3, 'Charlie Brown', 'charlie.brown@company.com', 'Finance'),
		(4, 'David Williams', 'david.williams@example.com', 'IT'),
		(5, 'Eva Green', 'eva.green@example.com', 'Marketing'),
		(6, 'Frank Black', 'frank.black@company.com', 'HR'),
        (6, 'Nazim', 'nazim.khan@gmail.com', 'HR'),
        (7, 'Na zim kh an', 'nk_khan1956@gmail.com', 'IT');
        
     Select * from dem_emp ;
-- ex-1.  Find Employees whose Names Start with "A":
		select  * from dem_emp where name like "a%" ; 
        
-- ex-2. Find Employees whose Email Contains "example": 
select * from dem_emp where email like "%example%" ; 

-- ex-3. Find Employees in the HR Department whose Name Starts with "F":
select * from dem_emp where department = "hr" and name like "f%" ; 


-- ex4. Find Employees with Exactly 5-letter Names:
select * from dem_emp where name like "_____" ; 

            
-- ex5.  Find Employees in the IT Department whose Name Contains "a":
select * from dem_emp where department = "it" and name like "%a%" ; 


            
-- ex6.  Find Employees whose Name Starts with "C" and Ends with "n": 
select * from dem_emp where name like "c%n";

                    
-- Using operators in WHERE clause
  # AND  (to check for both conditions to be true)
  
  -- students who scored more than 80 ad city is delhi
  select * from student1 where marks > 80  and city = "delhi" ;
  
    
  # OR (to check for one of the conditions to be true)
  -- fetch students who scored more than 80 or live in city delhi
  select * from student1 where marks > 80 or city = "delhi" ; 
  
    
  # BETWEEN (selects for a given range)
  -- fetch students details whose scored marks between 80 and 90 
  select * from student1 where marks between 80 and 90 ;  -- it includes both 80 and 90
  
    
# IN (matches any value in the list)  
-- The IN operator in SQL is used to filter records that match any value in a list. --
-- fetch students records who live in delhi , mumbai chennai
select * from student1 where city in ("delhi" , "mumbai" , "chennai") ; 

  #  NOT (to negate the given condition)
  -- fetch students who must not live in chennai and banglore
  select * from student1 where city not in	("chennai" , "banglore") ; 
  
-- LIMIT clause   -(Sets an upper limit on number of (tuples)rows to be returned)
select * from student1 limit 3 ;   -- only 3 records from table student1 
select name,grade from student1 limit 3 ; 
  
--  LIMIT and OFFSET
/* 
1. LIMIT
The LIMIT clause is used to restrict the number of rows returned in the result set.
Syntax ;
SELECT column1, column2, ...
FROM table_name
LIMIT number_of_rows;

2. OFFSET
The OFFSET clause is used to specify the number of rows to skip before starting to return rows.
In MySQL, the OFFSET clause cannot be used by itself. It needs to be combined with LIMIT to specify how many rows to return and where to start.

Syntax
SELECT * FROM table_name 
LIMIT number_of_rows 
OFFSET start_position;
*/

-- Lets create a table and insert values
	CREATE TABLE dem_emp2 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department VARCHAR(50) ) ;
    
    INSERT INTO dem_emp2 (id, name, salary, department)
			VALUES
			(1, 'Alice', 50000, 'HR'),
			(2, 'Bob', 55000, 'Engineering'),
			(3, 'Charlie', 60000, 'Engineering'),
			(4, 'David', 70000, 'Sales'),
			(5, 'Eva', 75000, 'Sales'),
			(6, 'Frank', 80000, 'HR'),
			(7, 'Grace', 85000, 'Engineering'),
			(8, 'Hannah', 90000, 'Sales');
            
select * from dem_emp2 ;

-- ex1. If we want to get the first 3 employees from the employees table: 
select * from dem_emp2 limit 3 ;

-- ex2. If we want to skip the first 3 employees and retrieve the next 3 employees (from row 4 to row 6):
select * from dem_emp2 limit 3  offset 3 ; 
                
-- ex3. If you want to retrieve 3 employees starting from row 5:
select * from dem_emp2 limit 3 offset 4 ; 

-- ORDER BY clause -(To sort in ascending (ASC) or descending order (DESC))
    select * from student1 order by city ;  -- (if nothing mentioned default is ascending)
    select * from student1 order by grade ;
    select name , grade , city from student1  order by grade asc limit 3;
      select name , grade , city from student1  order by grade desc limit 3;
    
-- AGGREGATE FUNCTIONS  -( Aggregare functions perform a calculation on a set of values, and return a single value  ex-COUNT( ) , MAX( ) , MIN( ) , SUM( ) , AVG( ) )
   -- Aggregate function returns Single value--
select max(marks) from student1;
select avg(marks) from student1;
select min(marks) from student1;
select name , max(marks) from student1 ;  -- (this will give error 1140 -Mixing of GROUP columns (MIN(),MAX(),COUNT(),...) with no GROUP columns is illegal if there is no GROUP BY clause.")
SELECT name , marks FROM student1 WHERE marks = (SELECT MAX(marks) FROM student1);  -- (Here we used sub query)

-- GROUP BY clause --
 /* 
 Groups rows that have the same values into summary rows.
 It collects data from multiple records and groups the result by one or more column.
 The GROUP BY clause in SQL requires that all columns in the SELECT statement (other than aggregate functions like COUNT, MAX, SUM, etc.) be included in the GROUP BY clause
 if they are not part of an aggregate function. Otherwise, it will return an error or undefined behavior because SQL needs to know how to handle the name column within each grade.
-- Generally we use group by with some aggregation function--
-- to add order by in Group by , add order by after group by clause and use the column name which is without aggregate for order by --
 */
 -- count number of students in each city 
  -- Normal columns which are part of select statement (i.e in which there is no aggregation) they must be part of group by statement--
 Select city from student1 group by city ;
 select city , avg(marks) from student1;  ## this will create error because avg(marks) will return only single value and city will return more than one value ,
 Select city , avg(marks) from student1 group by city;
 Select city , avg(marks) from student1 group by city order by city ;
  Select city , avg(marks) as avg_marks from student1 group by city order by avg_marks desc ;
  Select city , avg(marks) from student1 group by city order by avg(marks) desc;
 select city , name , count(rollno) from student1 group by city, name ; 
 select name , max(marks) from student1 group by name;  
 select grade , count(name) from student1 group by grade ;
 select grade , count(name) from student1 group by grade order by grade ;
 select grade , count(rollno) from student1 group by grade order by grade ;
 
 ## HAVING CLAUSE  -( Used to apply some condition on columns basis after applying grouping i.e GROUP BY )
 /* aswe know both HAVING and WHERE clause are conditional clause  used for applying condition, 
 But the main difference is that WHERE clause is used to aplly condition on rows basis
 and 
 HAVING clause is used to applly condition on columns basis after group by */
 
-- Question =  Count number of students in each city where max marks above  90
select * from student1 ; 
select city  , count(rollno) from student1 group by city having max(marks) > 90 ;  

## GENERAL ORDER TO WRITE A QUERY
 /*    SELECT  column(s)
       FROM table_name
       WHERE condition       --(Where applies condition on rows)--
       GROUP BY column(s)
       HAVING condition      --(Where applies condition on group by)--
       ORDER BY column(s) ASC */ ##
       
-- example 
 Select city from student1;
 Select city from student1 where grade ="A" ;
 Select city from student1 where grade ="A"group by city ; 
 Select city from student1 where grade ="A" group by city having max(marks) > 90 ;
 Select city from student1 where grade ="A" group by city having max(marks) > 90 order by city ;
 Select city from student1 where grade ="A" group by city having max(marks) > 90 order by city desc;
 
 
 ## TABLE RELATED QUERIES ##
 #1. UPDATE -(to update existing rows)
     /*  UPDATE table_name 
         SET col1 = val1, col2 = val2
		 WHERE condition ;  [NOTE: WHERE CONDITION IS NOT NECESSSARY]  */

-- CHange grade "A" to "O"   
select * from student1 ;
 update student1 set grade = "O" where grade ="A";

-- Change marks of rollno 105 12 to 82.
select * from student1 ; 
update student1 set marks = "82" where rollno = "105" ; 


-- Change grade to "B" where marks between 80 and 90.
select * from student1 ; 
update student1 set grade = "B" where marks between 80 and 90 ;
select * from student1 ; 

   
-- Add 1 marks to all student marks
update student1 set marks  = marks +1 ;
select * from student1;    
   
#2. DELETE -(to delete existing rows)
/* DELETE FROM table_name 
   WHERE condition; (Use this DELETE clause very cautiously once data is deletd it will not get back)
   
   DELETE FROM table_name; -(This will delete all data from the table)
   */
       
-- Delete from student1 where marks are less than 33
  -- adding some record for marks less than 33 --
    insert into student1 values (107 , "Sajid", 25, "D", "Mumbai" ), (108 , "Adil", 32  , "D", "Chennai") ;
    
-- Delete from student1 where marks are less than 33 
DELETE from student1 where marks < 33 ; 
   
   
 ## Foreign key revision ##
/* 
-- Table which has Primary Key is known as Parent Table & the Table which has Foreign key is known as Child Table
-- CASCADE effect = It means when we make any update or deletion in parent table it automatically happens in child table too for this we use these two command 
If you want to update a record and wants this change to automatically reflect in child  tables , then we need to use ON UPDATE CASCADE in the foreign key constraint of the referencing tables.
If you want to delete  a record and wants this change to automatically reflect in chid tables , then we need to use ON DELETE CASCADE in the foreign key constraint of the referencing tables.
 ON DELETE CASCADE
ON UPDATE CASCADE

EXAMPLE:
FOREIGN KEY (dept_id) REFERENCES dept(id) ON UPDATE CASCADE;
FOREIGN KEY (dept_id) REFERENCES dept(id) ON DELETE CASCADE;
*/

 create table dept ( id int primary key, name varchar(25) );
 
 Create table teacher 
   (id int primary key,
     Name varchar(50), 
     dept_id int,
     foreign key (dept_id) references dept(id)
     ON UPDATE CASCADE
     ON DELETE CASCADE
     ) ; 
     
-- adding values in both tables--
insert into dept values (101,"english"), (102,"It") ;
insert into teacher values (101,"Adam", 101), (102,"Eve" , 102) ;

select * from dept ;
select * from teacher ;

-- change in dept table id of "It" from 102 to 103
update dept set id = "103" where id = "102" ;
select * from dept ;
select * from teacher ; 

-- change in dept table id of "It" from 102 to 103 
update dept set id = "103" where id = "107" ;
select * from dept ;
select * from teacher ; 


-- change in dept table id of "English" from 101 to 111
update dept set id = "111" where name = "english" ;
select * from dept ;
select * from teacher ;

## Queries related to TABLES

#  Alter  -(to change the schema , schemea means design of the table )
/*  
1. Add column  
2. Drop Column or Drop Table  
3. Rename Column  
4. Change column(constraint)  
5. MOdify column(modify datatype/ constraint)   
6. TRUNCATE -(It deletes all data from table)
 */



/* 1. ADD Column
	  ALTER TABLE table_name 
 	  ADD COLUMN column_name datatype constraint;  */
 
 -- ex-1 : add age column in student1 table
 alter table student1 
 add column Age int ; 
 
 -- ex-2
 alter table student1
 add column age2 int not null default 19 ;
 

/* 2.  DROP Column
	 ALTER TABLE table_name 
	 DROP COLUMN column_name;  */

-- Ex-1 : Drop the Age1 column which we created
Alter table student1
drop column age ;
select * from student1;

/* 3.  MODIFY Column (modify datatype/ constraint)
	  ALTER TABLE table_name 
      MODIFY col_name new_datatype new_constraint;  */
      
-- Ex : change the data type of Age2 column to varchar(25)
alter table student1
modify age2  varchar(2) ; 
-- as in above query we can see that we have inserted varchar(2) for age2 column , it means if we insert value of three digits it will give an error
select  * from student1;
Describe student1 ;

insert	into student1 (rollno , name , marks , age2 )
values (115 , "Sid" , 75  , 95 ) ;
   select * from student1; 
insert	into student1 (rollno , name , marks , age2 )
values (125 , "Aid" , 760  , 100 ) ;    -- It willl error that data too loong for age2--

/* 4.  CHANGE Column (rename)
-- The CHANGE clause in ALTER TABLE requires you to specify the new column name and its full data type — even if you're only changing the name. --
	  ALTER TABLE table_name 
	 CHANGE COLUMN old_name new_name new_datatype new_constraint;  */

-- Ex: Change the name of age2 cloumn to stu_age and its data type
alter table student1
change column age2 stu_age int ;   

select * from student1 ;
insert	into student1 (rollno , name , marks , stu_age )
values (125 , "Aid" , 760  , 100 ) ;  

/* 5.  DROP Column
	 ALTER TABLE table_name 
	 DROP COLUMN column_name;  */
   -- Ex ; Delete columnt stu_age  
   Alter table student1 
   drop column stu_age ;


/* 6.	RENAME Table :
	 ALTER TABLE table_name 
	 RENAME TO new_table_name; 
     
 RENAME COLUMN NAME :
 ALTER TABLE table_name
 RENAME COLUMN old_name TO new_name
 
CHANGE COLUMN require new name + data type
RENAME only requires oldname and new columns --- just to change name of column use RENAME TO 
     */

-- Ex: Change name of table student1 to stu
alter table student1
rename to stu ;   
     
-- Ex: again Change name to old one
alter table stu
rename to student1 ; 

/* 6.	RENAME column name
	 ALTER TABLE table_name 
	 RENAME TO new_table_name; 
CHANGE COLUMN require new name + data type
RENAME only requires oldname and new columns --- just to change name of column use RENAME TO 
     */




/* 7.	TRUNCATE TABLE  -(It delete the data inside a table whereas DROP delete the complete table)  -- DROP deletes the table ||  TRUNCATE delete the data  --
       TRUNCATE table_name ; -(It will delete data of the table)
       Drop column_name : - (It will delete that specific column and its data)
       DROP table_name ; -(It will delete complete table with data)
*/
-- Ex:
TRUNCATE table student1 ;
select * from student1;

describe student1 ; 

-- filling the same old data--
insert into student1 values
(101, "anil",78,"C","Pune") ,
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi") ;
select * from student1 ;


/*
 PRACTISE QUESTION 
 a. Change the name of column"name" to "Full_name"
 b. Delete all the students who scored marks greater than 80
 c. Delete the column for grade.
 */
 
 -- ans-a 
 alter table student1 
 rename	column name to full_name ; 

-- Ams b :
select * from student1 ; 
delete from student1 where marks > 80 ; 


-- Ans c :
alter table student1
drop column grade ; 
   
-- Now for convenient purpose delete all the data from student1 
truncate student1 ;
select * from student1;

-- now delete the student1 table itself
drop table student1 ;

-- Now create the table student1 and insert the data in it again
create table student1 (roll_no int , Name varchar(50) , Marks int , Grade varchar(10) , city varchar(50) ) ; 

insert into student1 values
(101, "anil",78,"C","Pune") ,
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi") ;

select * from student1 ; 
  
-- ## -- ## -- -- ## -- ## -- -- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## ---- ## -- ## --

## SQL JOINTS :  Join are used to combine rows from two or more tables, based on a related column between them.
-- -- The table which is made first will be our LEFT TABLE and the table which is made after first table will be our RIGHT TABLE    
/*
Types of joins :- Inner Joins & Outer Joins
1. Inner Join or JOIN = INNER JOIN it retrieves the common information from two tables
2. Outer Join = Outer join consist of (i)Right Join  (ii))Left Join (iii)Outer Join  
	RIGHT jOIN = It fetchs the complete information of right table and which is common in both table.
    LEFT JOIN = It fetchs the complete information of left table and which is common in both table.
    OUTER JOIN = It fetchs the complete information from both the table
--ABOVE ARE THE BASIC PRINCIPAL JOINS-- 
we have some other special  joins as there is no specific commands for it  but we can make them
(1). Left Exclusive Join = To get only LEFT table data without getting commom data
(2). RIGHT EXCLUSIVE JOIN = To get only RIGHT table data without getting commom data  
    
    
-- The table which is made first will be our LEFT TABLE and the table which is made after first table will be our RIGHT TABLE    
    */
    
/* 
INNER JOIN     -(INNER JOIN it retrieves the common information from two tables)
Syntax:
  SELECT column(s) 
	FROM tableA 
	INNER JOIN tableB 
	ON tableA.col_name = tableB.col_name; 
*/

-- CREATING TWO TABLES  AND INSERTING VALUES TO PERFORM JOINS --

CREATE TABLE student3 ( id int , Name varchar(20)) ;
insert into student3 values 
	( 101 , "Adam"),
	( 102 , "Bob"),
    ( 103 , "Casey") ;
Select * from student3 ;

Create table Course (id int , Course varchar(20) );
INSERT INTO course VALUES
    (102, 'English'),
    (105, 'Math'),
    (103, 'Science'),
    (107, 'Computer');
select * from course ;

##  Performing INNER JOIN --
-- inner join gives the common information from the both tables
 select * from student3
 inner join course 
 on student3.id = course.id ;
    
-- now as above we saw writing full table name can be lengthy process , So to make our work easy we use alias(generaaly means assigning a temporary name to a table)
 select * from student3 as S
	inner join course as C
    on S.id = C.id ;
    
/*
LEFT JOIN   -( Returns all records from the left table, and the matched records or overlapped record or common record from the right table) 
--The table which is made first will be our LEFT TABLE and the table which is made after first table will be our RIGHT TABLE
-- In our case RIGHT TABLE is Student3, and  LEFT TABLE is Course
-- From the table we want informatio write that table name first in select statement
Syntax:
	SELECT column(s) 
	FROM tableA as alias_A
	LEFT JOIN tableB as alias_B
	ON tableA.col_name = tableB.col_name; 
*/    
 
 ## Ex; Perform LEFT JOIN on student3 and course table
 -- LEFT JOIN retrieves all records from left table and common records from right table

select * from student3 as s
	left join course as c
 	on s.id = c.id ;    -- Here information from student3 table will come first then information from course table--
    
	
select * from course as c
	left join student3 as s
 	on c.id = s.id ;	-- Here information from course table will come first then information from student3 table--  
  
/*
RIGHT JOIN   -( Returns all records from the RIGHT table, and the matched records or overlapped record or common record from the LEFT table) 
--The table which is made first will be our LEFT TABLE and the table which is made after first table will be our RIGHT TABLE
-- In our case RIGHT TABLE is Student3, and  LEFT TABLE is Course
-- From the table we want informatio write that table name first in select statement
Syntax:
	SELECT column(s) 
	FROM tableA as alias_A
	RIGHT JOIN tableB as alias_B
	ON tableA.col_name = tableB.col_name; 
*/         

##  perform RIGHT JOIN 
-- retreive all data from COURSE TABLE and common data from STUDENT3

select * from student3 as s
right join course as c
on s.id = c.id ;
    
/*
FULL JOIN  or OUTER JOIN   -( Returns all records from both the table) 
-- In MYSQL there is no such command like OUTER JOIN  or FULL JOIN but these kinds command are avaialable in oracle data base or any toher data base
-- To perform FULL JOIN , we use UNION of LEFT JOIN and INNER JOIN
-- UNION basically joins two table with unique value

Syntax in MySQL:
	 SELECT * from tableA
     LEFT JOIN tableB 
     ON tableA.col_name = tableB.col_name
     UNION
	 SELECT * from tableA
     RIGHT JOIN tableB 
     ON tableA.col_name = tableB.col_name  ;
*/     

## OUTER JOIN : Retrieve all data from both the tables
-- as my sql does not support FULL OUTER JOIB we can achieve the situation using this way
 
select * from student3 s
left join course c      -- left all records + Common  records
on s.id = c.id 
UNION                   -- It will combine the results of two or more select statement into a single result set , removing any duplicate rows 
SELECT * from student3 s
right join course c     -- Right Join will give all records from right table and common records from both table
on s.id = c.id ;
-- ✔️ This behaves like a full outer join in MySQL. --

     
/* LEFT EXCLUSIVE JOIN   [NOTE: There is no such command in MYSQL it is just name when we want to get only left table data without any common data from right table]
-- used to returns only those rows from table_A that do not have a matching value in table_B on col_name.
generaly we use this syntax:
	SELECT * FROM table_A as X
    LEFT JOIN table_B as Y
    ON X.col_name = Y.col_name
    WHERE Y.col_name IS NULL ;
*/
-- First lets see data from LEFT JOIN (i.e only student3 data and common data from course)
	select * from student3 as s
	LEFT JOIN course as c
	on s.id = c.id ;

-- Now lets fetch exclusive student3 data
	select * from student3 as s
	LEFT JOIN course as c
	on s.id = c.id 
    where c.id is null ;
    
/* RIGHT EXCLUSIVE JOIN   [NOTE: There is no such command in MYSQL it is just name when we want to get only RIGHT table data without any common data from LEFT table]
generaly we use this syntax:
	SELECT * FROM table_A as X
    RIGHT JOIN table_B as Y
    ON X.col_name = Y.col_name
    WHERE X.col_name IS NULL ;
*/  
-- First lets see data from RIGHT JOIN (i.e  COURSE TABLE data and common data from STUDENT3)
	select * from course as C
	RIGHT JOIN student3 as s
	on c.id = s.id ;

-- Now lets fetch exclusive course data
	select * from course as c
	RIGHT JOIN student3 as s
	on c.id = s.id 
    where c.id is null ; 
    
/*
SELF JOIN -(It is a regular join but the table is joined with itself) 
-- to apply this we only type JOIN 
Syntax: 
	SELECT column(s) 
	FROM table as a 
	JOIN table as b 
	ON a.col_name = b.col_name; 
    */
-- To test SELF JOIN  we will create an employee table and will see how  this works
create table employee (id int , name varchar(20), manager_id int ) ; 
insert into employee values
		(101 , "adam" , 103),
        (102 , "bob" , 104),
        (103 , "casey" , null ),
        (104 , "donald" , 103 );
select * from employee ;

-- now applying self join	-NOTE;- to apply self join we only type JOIN not SELF JOIN
select * from employee as a
JOIN employee as b
on a.id = b.manager_id ;

SELECT a.name AS employee_name, b.name AS manager_name
FROM employee AS a
JOIN employee AS b
ON a.manager_id = b.id;




-- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## 
-- ## ---- ## ---- ## ---- ## ---- ## ----                   CONTINUE FROM HERE PRACTISE                   ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## 
-- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## 
## UNION ##  & ## UNION ALL ##
/*
UNION = It combines data from 2 tables and gives unique records
UNION ALL = It combines data from 2 tables and gives all records including duplicate reccords

-It is used to combine the result-set of two or more SELECT statements.
-It Gives UNIQUE records.
-To use it : 
	  i) Every SELECT should have same no. of columns
	 ii) Columns must have similar data types
	iii) Columns in every SELECT should be in same order

- Syntax 
	SELECT column(s) FROM tableA  
	UNION 
	SELECT column(s) FROM tableB    
- Syntax 
	SELECT column(s) FROM tableA  
	UNION ALL
	SELECT column(s) FROM tableB    
*/
-- ex: applying on employee table
select * from employee ; 

-- using UNION
select name from employee
UNION
select name from employee ;  

-- using UNION ALL
select name from employee
UNION ALL
select name from employee ;  
 
 
-- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## 
## SQL SUB QUERY ##
/*
-- A Subquery or Inner query or a Nested query is a query within another SQL query.
-- It involves 2 select statements.
--  Sub-Query can be written eithin these 3
      i) SELECT 
     ii) FROM   -(NOTE :- whenever we use sub query with FROM we hve to use alias otherwise it will give error)
    iii) WHERE
But mostly it is used within WHERE clause
  
-- Syntax of sub-query within WHERE clause:-
          SELECT column(s) FROM table_name 
          WHERE col_name operator ( subquery ) ;
*/

-- Lets make a table and we will perform sub-query with examples

CREATE table student4
	(rollno int , name varchar(20) , Marks int , city varchar(20) ) ;

INSERT INTO student4 VALUES
(101, 'anil', 78, "Pune" ),
(102, 'bhumika', 93, "Mumbai" ),
(103, 'chetan', 85, "Mumbai" ),
(104, 'dhruv', 96, "Delhi" ),
(105, 'emanuel', 92, "Delhi" ),
(106, 'farah', 82, "Delhi" );

select * from student4 ;

-- 1. example with WHERE
-- Get names of all students who scored more than class average 

-- without using sub query 
select avg(marks) from student4 ; 
select name , marks from student4 where marks > 87.6667 ; 

--  With using sub-query
select name , marks from student4 
where marks > (select avg(marks) from student4 ) ; 

    
-- 2. Example with WHERE
-- Find the names of all students with even roll numbers
-- in programing to check the reminder we use MODULUS sign is % --

-- without using sub query
select rollno from student4 where rollno %2 = 0 ;
select name , rollno  from student4 where rollno in ("102" , "104", "106" ) ; 

-- without sub query
select name , rollno from student4 where rollno %2 = 0;

-- With using Sub-Query
select name , rollno from student4 
where rollno in (select rollno from student4 where rollno % 2 = 0 );



-- 3 Example with FROM  
-- Find the max marks from the students of Delhi , using subquery with FROM

-- without subquery
select max(marks) as Max_Marks from student4 where city = "Delhi" ; 

-- With sub-query
select max(marks) from (select * from student4 where city = "delhi") as temp_emp ;  -- (NOTE :- whenever we use sub query with FROM we hve to use alias otherwise it will give error)

    
-- 4  Find the name and max marks from the students of Delhi , using subquery with WHERE clause
select  name , marks from student4 where city = "delhi" and Marks = (select max(marks) from student4) ; 


-- 5 Example with SELECT    -(sub query is  rarely  used with SELECT , mostly used with where clause)
 select (select max(marks) from student4) ,  name from student4 ;
 
 -- ex: Display all students' marks along with the highest marks in the class.
 	SELECT rollno, name, Marks, (SELECT MAX(Marks) FROM student4) AS highest_marks
FROM student4;

-- ex: Show Maximum Roll Number
	SELECT rollno, name, Marks, city, (SELECT MAX(rollno) FROM student4) AS max_rollno
FROM student4;

-- ex: Show Average Marks and Total Marks
	SELECT rollno, name, Marks, city, (SELECT AVG(Marks) FROM student4) AS average_marks, (SELECT SUM(Marks) FROM student4) AS total_marks
FROM student4;

-- ex: Show Count of Unique Cities
select rollno , name , Marks , city , (select count(distinct city) from student4) as unique_cities from student4 ;
 
 -- when we need only unique count of city
 select count(distinct city) from student4 ; 

    
-- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- ## ---- 
 ## VIEW ##
 /*
 A view is a virtual table based on the real table.
 It is done to create hypothetical table based on our needs , suppose a table has numerous  columns but we need only 4-5 columns to work then we create view 
 syntax
	CREATE VIEW view_name AS
	SELECT column1, column2, ...
	FROM table_name ;
 */
-- Create the teacher table so that we can create view on it 
CREATE TABLE teacher2 (
teacher_id INT PRIMARY KEY,         -- Column 1: Unique ID for each teacher
    name VARCHAR(50),               -- Column 2: Name of the teacher
    subject VARCHAR(50),            -- Column 3: Subject taught by the teacher
    age INT,                        -- Column 4: Age of the teacher
    city VARCHAR(50),               -- Column 5: City of residence
    experience_years INT ) ;           -- Column 6: Teaching experience in years



select * from teacher2 ;

-- Insert sample data into the teacher2 table
INSERT INTO teacher2 (teacher_id, name, subject, age, city, experience_years) VALUES
(1, 'John Doe', 'Mathematics', 45, 'New York', 20),
(2, 'Jane Smith', 'Physics', 38, 'Los Angeles', 15),
(3, 'Emily Davis', 'Chemistry', 50, 'Chicago', 25),
(4, 'Michael Brown', 'Biology', 32, 'Houston', 8),
(5, 'Sarah Wilson', 'English', 29, 'Phoenix', 5);

select * from teacher2 ;

-- now suppose we need only teacher_id , Name and Age column , we will create view so that we can work on only these table
create view teacher_sum as 
select teacher_id , name , age from teacher2 ; 

select * from teacher_sum ;

