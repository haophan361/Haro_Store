CREATE SCHEMA `HaoHao_Store`;
USE `HaoHao_Store`;
CREATE TABLE `suppliers` (
    `ID`INT PRIMARY KEY,
    `supplierName` NVARCHAR(200) NOT NULL,
    `address` NVARCHAR(200) NOT NULL,
	`phone` VARCHAR(10) NOT NULL UNIQUE
);
ALTER TABLE suppliers ADD CONSTRAINT check_ValidPhoneSupplier CHECK (phone REGEXP '^[0-9]{10}$');
CREATE TABLE `products`(
	`ID` INT PRIMARY KEY,
    `productName` NVARCHAR(200) NOT NULL,
    `productType` NVARCHAR(200) NOT NULL,
    `brand` NVARCHAR(200),
    `cost` DECIMAL(10,2) NOT NULL,
    `quantity` INT DEFAULT 0,
    `image_url` NVARCHAR(200)
);
CREATE TABLE `supplier_bills`(
	`ID` INT PRIMARY KEY,
    `supplierID` INT,
    `cost` DECIMAL(10,2) DEFAULT 0,
    `purchase_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `status` TINYINT,
    `receive_date` DATETIME,
    FOREIGN KEY (supplierID) REFERENCES suppliers(ID)
);
CREATE TABLE `supplier_billdetails`(
	`ID` INT PRIMARY KEY,
    `supplierbillID` INT,
    `productID` INT,
    `cost` DECIMAL(10,2),
    `quantity` INT,
    FOREIGN KEY(supplierbillID) REFERENCES supplier_bills(ID),
    FOREIGN KEY(productID) REFERENCES products(ID)
    ON DELETE CASCADE
);
CREATE TABLE `customers`(
	`ID` INT PRIMARY KEY,
    `cusName` NVARCHAR(300) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `address` NVARCHAR(200) NOT NULL,
    `phone` VARCHAR(10) NOT NULL UNIQUE
);
ALTER TABLE customers ADD CONSTRAINT check_ValidPhoneCus CHECK (phone REGEXP '^[0-9]{10}$');
CREATE TABLE `bills`(
	`ID` INT PRIMARY KEY,
    `cusID` INT,
    `cost` DECIMAL(10,2) DEFAULT 0,	
    `purchase_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `status` TINYINT,
    `address` NVARCHAR(300) NOT NULL,
    `receive_date` DATETIME,
    FOREIGN KEY(cusID) REFERENCES customers(ID)
);     
ALTER TABLE bills ADD CONSTRAINT check_billCost CHECK(cost > 0);
CREATE TABLE `billdetails`(
	`ID` INT PRIMARY KEY,
	`billID` INT,
    `proID` INT,
    `quantity` INT,
    FOREIGN KEY (billID) REFERENCES bills(ID),
    FOREIGN KEY (proID) REFERENCES products(ID)
    ON DELETE CASCADE
);
CREATE TABLE `accounts`(
	`email` VARCHAR(100) PRIMARY KEY,
    `password` VARCHAR(100) NOT NULL,
    `role` NVARCHAR(100)
);




