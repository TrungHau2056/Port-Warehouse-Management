CREATE DATABASE PortManagement;
USE portmanagement;

-- Table Task
CREATE TABLE IF NOT EXISTS Task (
                      TaskID INT PRIMARY KEY NOT NULL ,
                      TaskName VARCHAR(255) NOT NULL,
                      Description TEXT,
                      StartDate DATE,
                      EndDate DATE,
                      Status VARCHAR(50)
);

-- Table Employee
CREATE TABLE IF NOT EXISTS Employee (
                          EmployeeID INT PRIMARY KEY NOT NULL,
                          TaskID INT NOT NULL ,
                          Name VARCHAR(255) NOT NULL,
                          PhoneNumber VARCHAR(15),
                          Email VARCHAR(255),
                          Role VARCHAR(100)
);

-- Table Dock
CREATE TABLE IF NOT EXISTS  Dock (
                      DockID INT PRIMARY KEY NOT NULL,
                      DockManagerID INT NOT NULL,
                      PortID INT NOT NULL ,
                      Status VARCHAR(50),
                      Capacity VARCHAR(50),
                      Location VARCHAR(255),
                      UNIQUE (DockManagerID)
);

-- Table Port
CREATE TABLE IF NOT EXISTS  Port (
                      PortID INT PRIMARY KEY NOT NULL,
                      PortManagerID INT NOT NULL,
                      Name VARCHAR(255),
                      Capacity VARCHAR(50),
                      Location VARCHAR(255),
                      UNIQUE (PortManagerID)
);

-- Table Warehouse
CREATE TABLE IF NOT EXISTS  Warehouse (
                           WarehouseID INT PRIMARY KEY NOT NULL,
                           WarehouseManagerID INT NOT NULL,
                           PortID INT NOT NULL,
                           Status VARCHAR(50),
                           Capacity VARCHAR(50),
                           Location VARCHAR(255),
                           UNIQUE (WarehouseManagerID)
);

-- Table Ship
CREATE TABLE IF NOT EXISTS  Ship (
                      ShipID INT PRIMARY KEY NOT NULL,
                      Name VARCHAR(255),
                      Capacity VARCHAR(50),
                      Status VARCHAR(255)
);

-- Table Container
CREATE TABLE IF NOT EXISTS  Container (
                           ContainerID INT PRIMARY KEY NOT NULL,
                           ShipID INT NOT NULL,
                           WarehouseID INT NOT NULL,
                           Status VARCHAR(50),
                           Location VARCHAR(255),
                           Type VARCHAR(50)
);

-- Table Goods
CREATE TABLE IF NOT EXISTS  Goods (
                       GoodsID INT PRIMARY KEY NOT NULL,
                       Name VARCHAR(255),
                       Weight FLOAT,
                       Quantity INT,
                       Category VARCHAR(50),
                       Price Float
);

-- Table Invoice
CREATE TABLE IF NOT EXISTS  Invoice (
                         InvoiceID INT PRIMARY KEY NOT NULL,
                         CustomerID INT NOT NULL,
                         Amount DECIMAL(10, 2),
                         Date DATE
);

-- Table Customer
CREATE TABLE IF NOT EXISTS  Customer (
                          CustomerID INT PRIMARY KEY NOT NULL,
                          FirstName VARCHAR(255),
                          LastName VARCHAR(255),
                          Country VARCHAR(100),
                          City VARCHAR(100),
                          Address VARCHAR(255),
                          PhoneNumber VARCHAR(15)
);

-- Table DockShip
CREATE TABLE IF NOT EXISTS  DockShip (
                         ShipID INT NOT NULL,
                         DockID INT NOT NULL,
                         ArrivalDate DATE,
                         DepartureDate DATE,
                         PRIMARY KEY (DockID, ShipID)
);

-- Table ContainerGoods
CREATE TABLE IF NOT EXISTS  ContainerGoods (
                         ContainerID INT NOT NULL,
                         GoodsID INT NOT NULL,
                         Quantity INT NOT NULL,
                         PRIMARY KEY (ContainerID, GoodsID)
);

-- Table GoodsInvoice
CREATE TABLE IF NOT EXISTS  GoodsInvoice (
                         InvoiceID INT NOT NULL,
                         GoodsID INT NOT NULL,
                         Quantity INT NOT NULL,
                         PRIMARY KEY (GoodsID, InvoiceID)
);

