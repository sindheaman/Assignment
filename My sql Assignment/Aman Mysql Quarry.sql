CREATE database aman ;
use aman;
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

-- 1) Statement to create the Contact table 
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- 2) Statement to create the Employee table 
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- 3) Statement to create the ContactEmployee table 
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number  to 215-555-8800 
/*UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';*/

/* 5) In the Company table, the statement that changes the name of “Urban 
Outfitters, Inc.” to “Urban Outfitters” .

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';



*/

/*6) In ContactEmployee table, the statement that removes Dianne Connor’s contact 
event with Jack Lee (one statement).

DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
  AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');

*/


/*7) Write the SQL SELECT query that displays the names of the employees that 
have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
MySQL Workbench. Copy the results below as well. 

SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

*/

/*8) Significance of % and _ operators in the LIKE statement in MySQL:
%: The percent sign is a wildcard in the LIKE statement. It represents zero, one, or multiple characters. 

Example: SELECT * FROM Employee WHERE FirstName LIKE 'J%'; — This will match any name that starts with "J", like "John", "Jane", "Jack", etc.
_: The underscore is another wildcard used in the LIKE statement. It represents exactly one character.
Example: SELECT * FROM Employee WHERE FirstName LIKE 'J_n'; — This will match names like "Jan", "Jon", or "Jim",
 as it looks for a name with exactly one character between "J" and "n".*/
 
 
 /*9) Normalization in the context of databases:
Normalization is the process of organizing data in a database to minimize redundancy and ensure data integrity. It involves dividing a database into two or more tables and defining relationships between the tables to reduce duplication. The goal is to make the data more efficient, avoid anomalies, and maintain consistency.

The most common normal forms are:

1st Normal Form (1NF): Ensures that each column contains atomic values (no repeating groups).
2nd Normal Form (2NF): Achieves 1NF and ensures that all non-primary key columns are fully dependent on the primary key.
3rd Normal Form (3NF): Achieves 2NF and ensures that no non-primary key column depends on another non-primary key column (eliminate transitive dependency).*/


/*10) What does a JOIN in MySQL mean?
A JOIN in MySQL allows you to combine rows from two or more tables based on a related column between them. The relationship between the tables is defined by matching key columns, like foreign keys or primary keys. Joins are essential for retrieving meaningful information that is spread across multiple tables in a relational database.

Common types of JOINs:

INNER JOIN: Returns only the rows where there is a match between tables.
LEFT JOIN : Returns all rows from the left table and matching rows from the right table. 
RIGHT JOIN : Returns all rows from the right table and matching rows from the left table. 
FULL JOIN : Returns rows when there is a match in either table. Non-matching rows from both tables are also included, with NULLs for missing data.*/

/*
11) DDL, DCL, and DML in MySQL:
DDL (Data Definition Language): This deals with defining and modifying the structure of database objects 
such as tables, indexes, and views. Common DDL commands include:
CREATE , ALTER , DROP

DML (Data Manipulation Language): This involves the manipulation of data within database objects. Common DML commands include:

SELECT  ,INSERT ,UPDATE .DELETE 

DCL (Data Control Language): This deals with controlling access to the data within the database. Common DCL commands include:

GRANT: Gives user access privileges to database objects.
REVOKE: Removes user access privileges.
*/
/*12) Role of the MySQL JOIN clause in a query and common types of joins: in mysql short
Common Types of JOINs:
INNER JOIN: Returns only rows with matching values in both tables.
LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table and matched rows from the right table, with NULL for unmatched rows.
RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table and matched rows from the left table, with NULL for unmatched rows.
CROSS JOIN: Returns the Cartesian product of both tables (every row of one table combined with every row of the other).

*/


