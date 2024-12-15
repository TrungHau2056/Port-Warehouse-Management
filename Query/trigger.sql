-- trigger for Amount - Invoice
DELIMITER //

CREATE TRIGGER after_update_invoice_amount
    AFTER UPDATE ON invoice
    FOR EACH ROW
    BEGIN
        IF NEW.Amount = OLD.Amount THEN
            UPDATE invoice
                SET Amount = OLD.Amount * 1.1
                WHERE InvoiceID = 1;
        END IF ;
    END //

DELIMITER ;

-- trigger for TaskID - Task
DELIMITER //

CREATE TRIGGER before_insert_taskid_task
    BEFORE INSERT ON task
    FOR EACH ROW
    BEGIN
        IF NEW.TaskID = 1 THEN
            SET NEW.Status = 'Completed';
        END IF;
    END//

DELIMITER ;

-- trigger for country - customer
DELIMITER //

CREATE TRIGGER after_delete_country_customer
    BEFORE DELETE ON customer
    FOR EACH ROW
    BEGIN
        IF OLD.Country = 'USA' THEN
            UPDATE customer
                SET Country = 'USK'
                WHERE CustomerID = OLD.CustomerID;
        END IF;
    END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER update_invoice
AFTER INSERT ON goods
FOR EACH ROW
BEGIN
    UPDATE invoice
    SET amount = amount + (
        SELECT NEW.Price * gin.Quantity
        FROM goodsinvoice gin
        WHERE gin.GoodsID = NEW.GoodsID
        LIMIT 1
    )
    WHERE InvoiceID = (
        SELECT InvoiceID
        FROM goodsinvoice
        WHERE GoodsID = NEW.GoodsID
        LIMIT 1
    );
END //

DELIMITER ;