LIMIT, OFFSET
Secondary Highest Salary.

SELECT 
	IFNULL(
		(
			SELECT DISTINCT Salary FROM Employee
			ORDER BY Salary 
				LIMIT 1 OFFSET 1 # LIMIT 1 OFFSET 1 Means get the first value and count from the 1 value onwards.
			),NULL) AS SecondHighestSalary


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
----------------------------
Select Score, dense_rank() OVER(ORDER BY Score DESC) as 'Rank'
FROM Scores



Find customers who didt buy anything
SELECT c.Name Customers
FROM Customers c
LEFT JOIN Orders o 
ON c.Id=o.CustomerId
WHERE o.CustomerId is NULL # WHere clause can be used directly in the joined table.
# to judge whether the value is null, should write 'is null' not '= null' or '!=null'


