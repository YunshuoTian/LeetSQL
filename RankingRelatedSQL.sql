LIMIT, OFFSET
Secondary Highest Salary.

SELECT 
	IFNULL(
		(
			SELECT DISTINCT Salary FROM Employee
			ORDER BY Salary 
				LIMIT 1 OFFSET 1 # LIMIT 1 OFFSET 1 Means get the first value and count from the 1 value onwards.
			),NULL) AS SecondHighestSalary

-------------------------------------------------------------
Create a function to calculate the Nth Highest Salary.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
RETURN (
   select distinct
       Salary
   from 
       Employee
   Order by 1 desc
   limit M, 1 # LIMIT A,B Means Start from A and stop after B numbers of entries.

   );
   END


Rank Scores.
Rank all scores and the scores need to be non-gap, which means two same scores have the same rank.
Select a.Score,
(SELECT COUNT(DISTINCT b.Score) FROM Scores b where b.Score>=a.Score) as 'Rank'
FROM Scores a
ORDER BY a.Score DESC
-------------------------------------------------------------
Select Score, dense_rank() OVER(ORDER BY Score DESC) as 'Rank'
FROM Scores



Find customers who didt buy anything
SELECT c.Name Customers
FROM Customers c
LEFT JOIN Orders o 
ON c.Id=o.CustomerId
WHERE o.CustomerId is NULL # WHere clause can be used directly in the joined table.
# to judge whether the value is null, should write 'is null' not '= null' or '!=null'



------------------------------------------------------------
Find 3 same and consecutive numbers.

Select distinct a.num
from logs a, logs b, logs c 
where a.num=b.num and b.num=c.num and a.id=b.id-1 and b.id=c.id-1;

------------------------------------------------------------
Find find all dates id with higher temperature compared to its previous dates (yesterday).

SELECT w1.id
from weather w1, weather w2
where w1.Temperature>w2.Temperature and Datediff(w1.date, w2.date)=1 #datediff is the value of date1 - date2.

------------------------------------------------------------
Find the class have more than 5 students, students have to be unique name.

SELECT class
FROM courses
Group By class
HAVING COUNT(DISTINCT(student)) >= 5; Having !
