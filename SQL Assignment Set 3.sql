# 1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month.
# Stored procedure statement is in word document file name as (SQL Assignment Set3

call order_status(2005,03);


# 2. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
# function statement is in word document file name as (SQL Assignment Set3)


# b. Write a query that displays customerNumber, customername and purchase_status from customers table

select 
customerNumber,
customerName,
status as purchase_status
from customers
LEFT JOIN orders
USING (customerNumber);



# 3. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

-- On delete cascade

DELIMITER //
CREATE TRIGGER del_cascade 
AFTER DELETE ON movies
FOR EACH ROW
BEGIN
   delete from rentals 
   where movieid = old.id;
END//
DELIMITER ;

-- On update cascade

DELIMITER //
CREATE TRIGGER update_cascade
AFTER UPDATE on movies
FOR EACH ROW 
BEGIN
	UPDATE rentals
	SET movieid = new.id
	WHERE movieid = old.id;
END//
DELIMITER ;


# 4. Select the first name of the employee who gets the third highest salary. [table: employee]

select
fname,
lname,
salary
from employee
order by salary DESC
limit 2,1;



# 5. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]

select
fname,
lname,
salary,
dense_rank () OVER (order by salary desc) as Rank_salary
from employee;







 
