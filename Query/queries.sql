-- inner join
SELECT port.Name, port.Capacity as PortCapacity,
       port.PortManagerID, dock.DockID,
       dock.Capacity as DockCapacity
FROM port
INNER JOIN dock
ON port.PortID = dock.PortID;

SELECT con.ContainerID,
       SUM(Quantity * Weight) AS WeightContainer
FROM container con
INNER JOIN goods g
ON g.ContainerID = con.ContainerID
GROUP BY g.ContainerID;



-- outer join
SELECT employee.Name, task.TaskName,
       task.Description, employee.Role
FROM task
LEFT JOIN employee
ON task.TaskID = employee.TaskID
UNION
SELECT employee.Name, task.TaskName,
       task.Description, employee.Role
FROM task
RIGHT JOIN employee
ON task.TaskID = employee.TaskID;

SELECT si.ShipID, si.Name,
       COUNT(con.ContainerID) AS NumberContainer
FROM ship si
LEFT JOIN container con
ON si.ShipID = con.ShipID
GROUP BY si.ShipID;


-- subquery in where
SELECT CONCAT(cus.FirstName, ' ', cus.LastName) AS FullName,
       (SELECT SUM(Amount)
        FROM invoice iv
        WHERE iv.CustomerID = cus.CustomerID) as Total
FROM customer cus
WHERE CustomerID IN (SELECT CustomerID FROM invoice)
GROUP BY CustomerID;

SELECT g.ContainerID,
       (Quantity * Price) AS TotalAmount
FROM Goods g
WHERE g.ContainerID IN (SELECT ContainerID
                        FROM container);

-- subquery in from
SELECT congo.TotalContainer
FROM (SELECT SUM(Price * Quantity) AS TotalContainer
      FROM Goods g
      INNER JOIN Container con
      ON g.ContainerID = con.ContainerID
      GROUP BY g.ContainerID
      ) congo
WHERE TotalContainer > 50;

SELECT goodsDate.ID, goodsDate.Name,
       MAX(goodsDate.totalAmount) AS MaxTotalAmount
FROM (
    SELECT g.GoodsID AS ID, g.Name AS Name,
           SUM(Quantity * Price) AS totalAmount
    FROM goods g
    INNER JOIN containergoods cong
        ON g.GoodsID = cong.GoodsID
    INNER JOIN container con
        ON cong.ContainersID = con.ContainerID
    INNER JOIN ship si
        ON con.ShipID = si.ShipID
    INNER JOIN dockship dosi
        ON si.ShipID = dosi.ShipID
    WHERE YEAR(ArrivalDate) = 2020
       OR YEAR(DepartureDate) = 2020
    GROUP BY g.GoodsID, g.Name
) AS goodsDate
GROUP BY goodsDate.ID, goodsDate.Name;


-- Query using group by and aggregate functions
SELECT PortID, Name,
       (SELECT COUNT(DockID)
        FROM dock
        WHERE dock.PortID = port.PortID) as TotalDock
FROM port
WHERE PortID IN (SELECT PortID FROM dock)
GROUP BY PortID;

SELECT cus.CustomerID,
       CONCAT(cus.FirstName, ' ', cus.LastName),
       COUNT(iv.InvoiceID) AS totalInvoice
FROM customer cus
INNER JOIN invoice iv
ON cus.CustomerID = iv.CustomerID
GROUP BY cus.CustomerID;