-- procedure for customer
DELIMITER //

CREATE PROCEDURE get_customer()
BEGIN
    SELECT * FROM customer;
END //

DELIMITER ;

-- procedure for container
DELIMITER //

CREATE PROCEDURE change_container(
    IN NewStatus VARCHAR(50),
    IN NewLocation VARCHAR(255),
    IN NewType VARCHAR(50)
)
BEGIN
    UPDATE container
        SET Status = NewStatus, Location = NewLocation, Type = NewType
        WHERE ShipID = '80';
END //

DELIMITER ;

-- procedure for task
DELIMITER //

CREATE PROCEDURE delete_task()
BEGIN
    DELETE FROM Task
        WHERE Status = 'Completed';
END //

DELIMITER ;

