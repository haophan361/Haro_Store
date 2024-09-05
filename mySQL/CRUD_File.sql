USE haohao_store
#Supplier
DELIMITER $$
CREATE PROCEDURE insertSupplier(
    IN _name NVARCHAR(200),
    IN _address NVARCHAR (300),
    IN _phone VARCHAR(10)
)
BEGIN
	DECLARE newID INT;
    SELECT MAX(ID)+1 INTO newID FROM suppliers;
    IF newID IS NULL THEN
		SET newID=1;
	END IF;
	INSERT INTO suppliers(ID,supplierName,address,phone)
    VALUES (newID,_name,_address,_phone);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateSupplier(
	IN _ID INT,
    IN _name NVARCHAR(200),
    IN _address NVARCHAR (300),
    IN _phone VARCHAR(10)
)
BEGIN 
	UPDATE suppliers
    SET 
		supplierName = _name,
		address = _address,
		phone = _phone
	WHERE ID = _ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE searchSupplier(
	IN keyword NVARCHAR(200)
)
BEGIN
	SELECT supplierName,address,phone
		FROM suppliers WHERE CAST(ID AS CHAR) LIKE CONCAT('%', keyword, '%') OR supplierName LIKE CONCAT('%', keyword, '%');  	
END $$
DELIMITER ;

#Product
DELIMITER $$
CREATE PROCEDURE insertProduct(
	IN _name NVARCHAR(200),
    IN _type NVARCHAR(100),
    IN _brand NVARCHAR(200),
    IN _cost DECIMAL(10,2),
    IN _quantity INT,
    IN _image_url NVARCHAR(200)
)
BEGIN 
	DECLARE newID INT;
    SELECT MAX(ID)+1 INTO newID FROM products;
    IF newID IS NULL THEN
		SET newID=1;
	END IF;
    INSERT INTO products(ID,productName,productType,brand,cost,quantity,image_url)
    VALUES (newID,_name,_type,_brand,_cost,_quantity,_image_url);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateProduct(
	IN _ID INT,
    IN _name NVARCHAR(200),
    IN _type NVARCHAR(100),
    IN _brand NVARCHAR(200),
    IN _cost DECIMAL(10,2),
    IN _quantity INT,
    IN _image_url NVARCHAR(200)
)
BEGIN 
	UPDATE products
    SET
		productName=_name,
        productType=_type,
        brand=_brand,
        cost=_cost,
        quantity=_quantity,
        image_url=_image_url
	WHERE ID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE deleteProduct(
	IN _ID INT
)
BEGIN
	DELETE FROM products WHERE ID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE searchProduct(
    IN keyword NVARCHAR(200)
)
BEGIN
    SELECT ID,productName, productType, brand, cost, quantity, image_url
    FROM products WHERE CAST(ID AS CHAR) LIKE CONCAT('%', keyword, '%') OR productName LIKE CONCAT('%', keyword, '%');
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE findProduct(
	IN _ID INT
)
BEGIN 
	 SELECT ID,productName, productType, brand, cost, quantity, image_url
     FROM products WHERE ID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE typeProduct(
	IN _type NVARCHAR(200)
)
BEGIN
	SELECT ID,productName, productType, brand, cost, quantity, image_url
    FROM products WHERE _type = productType;
END $$
DELIMITER ;

#Supplier_Bill
DELIMITER $$
CREATE PROCEDURE insertSupplierBill(
    IN _supplierID INT,
    IN _status TINYINT
)
BEGIN 
    DECLARE newID INT;
    SELECT MAX(ID)+1 INTO newID FROM supplier_bills;
    IF newID IS NULL THEN
		SET newID=1;
	END IF;
    INSERT INTO supplier_bills(ID, supplierID,status)
    VALUES (newID, _supplierID, _status);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateSupplierBill(
    IN _ID INT,
    IN _supplierID INT,
    IN _status TINYINT
)
BEGIN 
    UPDATE supplier_bills
    SET
        supplierID = _supplierID,
        status=_status
    WHERE ID = _ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateSupReceive_date(
	IN _ID INT
)
BEGIN 
	UPDATE supplier_bills
    SET
		receive_date=CURRENT_TIMESTAMP
	WHERE ID=_ID;
END $$
DELIMIER ;

DELIMITER $$
CREATE PROCEDURE deleteSupplierBill(
	IN _ID INT
)
BEGIN
	DELETE FROM supplier_bills WHERE ID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE searchSupplier_Bill(
	IN keyword NVARCHAR(200)
)
BEGIN
	SELECT supplierName, phone, address, supplierBillID, cost, purchase_date, status, receive_date 
    FROM view_SupplierBill
    WHERE CAST(supplierBillID AS CHAR) LIKE CONCAT('% ', keyword ,' %') 
    OR  supplierName LIKE CONCAT  (' % ',keyword,' %');
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE bill_BySupplierID(
	IN _ID INT
)
BEGIN
	SELECT supplierName, phone, address, supplierBillID, cost, purchase_date, status, receive_date 
    FROM view_SupplierBill 
    WHERE supplierID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE paidSupplier_Bill()
BEGIN
	SELECT ID, supplierName, cost, purchase_date, status, receive_date 
    FROM supplier_bills WHERE status=1;
END $$
DELIMIER ;

DELIMITER $$
CREATE PROCEDURE receiveSupplier_Bill()
BEGIN
	SELECT ID, supplierName, cost, purchase_date, status, recieve_date
    FROM supplier_bills WHERE recieve_date IS NOT NULL;
END $$
DELIMITER ;

#Supplier Bill Detail
DELIMITER $$
CREATE PROCEDURE insertSupplierBillDetail(
    IN _supplierbillID INT,
    IN _productID INT,
    IN _cost DECIMAL(10,2),
    IN _quantity INT
)
BEGIN 
    DECLARE newID INT;
    SELECT MAX(ID)+1 INTO newID FROM supplier_bill_details;
    IF newID IS NULL THEN
		SET newID=1;
	END IF;
    INSERT INTO supplier_bill_details(ID, supplierbillID, productID,cost, quantity)
    VALUES (newID, _supplierbillID, _productID, _cost, _quantity);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateSupplierBillDetail(
    IN _ID INT,
    IN _supplierbillID INT,
    IN _productID INT,
    IN _cost DECIMAL(10,2),
    IN _quantity INT
)
BEGIN 
    UPDATE supplier_bill_details
    SET
        supplierbillID = _supplierbillID,
        productID = _productID,
        cost = _cost,
        quantity = _quantity
    WHERE ID = _ID;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE deleteSupplierBillDetail(
	IN _ID INT
)
BEGIN
	DELETE FROM supplier_bill_details WHERE ID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE search_supplierBillDetailByBillID(
	IN _supplierbillID INT
)
BEGIN
	SELECT supplierbilldetailID, productName, productType,brand, cost, image_url,quantity
	FROM view_SupplierBillDetail_Product
    WHERE supplierbillID = _supplierbillID;
END $$
DELIMITER ;

#Customer
DELIMITER $$
CREATE PROCEDURE insertCustomer(
	IN _name NVARCHAR(100),
    IN _email VARCHAR(200),
    IN _address NVARCHAR(200),
    IN _phone VARCHAR(10),
    IN _password VARCHAR(100)
)
BEGIN
	DECLARE newID INT;
	SELECT MAX(ID)+1 INTO newID FROM customers;
	IF newID IS NULL THEN
		SET newID=1;
	END IF;
	INSERT INTO customers(ID,cusName,email,address,phone)
	VALUES(newID,_name,_email,_address,_phone);
	
    INSERT INTO accounts(email,password,role)
    VALUES(_email,_password,'Customer');
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateCustomer(
	IN _ID INT,
    IN _name NVARCHAR(100),
    IN _address NVARCHAR(200),
    IN _phone VARCHAR(10)
)
BEGIN
	UPDATE customers
    SET
		_name=cusName,
        _address=address,
        _phone=phone
	WHERE _ID=ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE deleteCustomer(
	IN _ID INT
)
BEGIN
	DELETE FROM customers WHERE ID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE findCustomer(
	IN _email NVARCHAR(200)
)
BEGIN
	SELECT ID,cusName,email,address,phone FROM customers 
    WHERE email=_email;
END $$
DELIMITER ;

#Bill
DELIMITER $$
CREATE PROCEDURE insertBill(
    IN _cusID INT,
    IN _status TINYINT,
    IN _address NVARCHAR(300)
)
BEGIN 
    DECLARE newID INT;
    SELECT MAX(ID) +1 INTO newID FROM bills;
    IF newID IS NULL THEN
		SET newID=1;
	END IF;
    INSERT INTO bills(ID, cusID,status , address)
    VALUES (ID, _cusID, _status, _address);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateBill(
    IN _ID INT,
    IN _cusID INT,
    IN _status TINYINT,
    IN _address NVARCHAR(200)
)
BEGIN 
    UPDATE bills
    SET
        cusID = _cusID,
        status = _status,
        address = _address
    WHERE ID = _ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateCusReceive_date(
	IN _ID INT
)
BEGIN
	UPDATE bills 
    SET receive_date=CURRENT_TIMESTAMP
	WHERE ID=_ID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE deleteBill(
	IN _ID INT
)
BEGIN
    DELETE FROM bills WHERE ID=_ID; 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE paidBill(
)
BEGIN
	SELECT ID, cost,purchase_date,status,address,receive_date
	FROM bills WHERE status=1;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE receiveBill(
)
BEGIN 
	SELECT ID, cost,purchase_date,status,address,receive_date
    FROM bills WHERE receive_date IS NOT NULL;
END $$
DELIMITER ;

#BillDetail
DELIMITER $$
CREATE PROCEDURE insertBillDetail(
    IN _billID INT,
    IN _proID INT,
    IN _amount INT
)
BEGIN 
    DECLARE newID INT;
    DECLARE current_quantity INT;
    DECLARE message NVARCHAR(100);
    SELECT quantity INTO current_quantity FROM products WHERE ID = _proID;
    
    START TRANSACTION;
    IF current_quantity < _amount THEN
		SET message=CONCAT ('Chỉ còn ',current_quantity , ' sản phẩm');
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =message;
        ROLLBACK;
    ELSE
        UPDATE products 
        SET quantity = quantity - _amount
        WHERE ID = _proID;

        SELECT MAX(ID) +1 INTO newID FROM bill_details;
		IF newID IS NULL THEN
			SET newID=1;
		END IF;
        INSERT INTO bill_details(ID, billID, proID, quantity)
        VALUES (ID, _billID, _proID, _amount);
        COMMIT;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateBillDetail(
    IN _ID INT,
    IN _billID INT,
    IN _proID INT,
    IN _amount INT
)
BEGIN 
	DECLARE current_quantity INT;
    DECLARE message NVARCHAR(100);
    SELECT quantity INTO current_quantity FROM products WHERE ID = _proID;
    
    START TRANSACTION;
    IF current_quantity < _amount THEN
		SET message=CONCAT ('Chỉ còn ',current_quantity , ' sản phẩm');
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =message;
        ROLLBACK;
	ELSE
    UPDATE bill_details
    SET
        billID = _billID,
        proID = _proID,
        quantity = _quantity
    WHERE ID = _ID;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE deleteBillDetail(
	IN _ID INT
)
BEGIN
    DELETE FROM bill_details WHERE ID=_ID; 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE searchBillDetail(
	IN _billID INT
)
BEGIN
    SELECT billdetailID, productName, cost, image_url
    FROM view_BillDetail_Product WHERE billID=_billID; 
END $$
DELIMITER ;

#Account
DELIMITER $$
CREATE PROCEDURE changePassword(
	IN _email VARCHAR(200),
    IN _password VARCHAR(100)
)
BEGIN
	UPDATE accounts 
	SET password=_password
    WHERE email=_email;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE checkLogin(
	IN _email VARCHAR(200),
    IN _password VARCHAR(100)
)
BEGIN
	SELECT * FROM accounts WHERE email=_email AND password=_password;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE checkPassword(
	IN _email VARCHAR(200)
)
BEGIN
	SELECT password FROM accounts WHERE email=_email;
END $$
DELIMITER ;
