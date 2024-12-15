-- TRANSACTION for customer
START TRANSACTION ;

DELETE FROM customer
WHERE Country = 'USA' OR Country = 'Germany';

ROLLBACK ;
COMMIT ;

-- TRANSACTION for task
START TRANSACTION ;

INSERT INTO task
VALUES (1000, 'New Task', 'Build', '2025-01-01', '2025-12-01', 'Not Complete');

UPDATE task
SET TaskID = 'Test'
WHERE TaskID = 1000;

DELETE FROM task
WHERE TaskID = 1000;

ROLLBACK ;
COMMIT ;


START TRANSACTION ;

Set autocommit  = 0;

UPDATE customer
SET LastName = 'hihula'
WHERE CustomerID = 1;

SELECT * FROM customer;

ROLLBACK ;

SELECT * FROM customer;

COMMIT ;