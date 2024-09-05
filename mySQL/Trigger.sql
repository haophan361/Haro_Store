USE haohao_store;
DELIMITER //
CREATE TRIGGER update_AfterInsertOnBillDetail
AFTER INSERT ON billdetails
FOR EACH ROW
BEGIN
    DECLARE productValue DECIMAL(10,2);
     SELECT cost INTO productValue FROM products WHERE ID = NEW.proID;
    IF NEW.quantity > 0 THEN 
        UPDATE products 
        SET quantity = quantity - NEW.quantity
        WHERE ID = NEW.proID;
        
        UPDATE bills 
        SET cost = cost + (productValue * NEW.quantity)
        WHERE ID = NEW.billID;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_AfterUpdateOnBillDetail
AFTER UPDATE ON billdetails
FOR EACH ROW
BEGIN
	DECLARE productValue DECIMAL(10,2);
    SELECT cost INTO productValue FROM products WHERE ID = NEW.proID;
    IF NEW.quantity <> OLD.quantity THEN
		UPDATE products 
		SET quantity = quantity - (NEW.quantity-OLD.quantity)
		WHERE ID = NEW.proID;
        
        UPDATE bills 
		SET cost = cost + (productVal* (NEW.quantity-OLD.quantity))
		WHERE ID = NEW.billID;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_AfterDeleteOnBillDetail
AFTER DELETE ON billdetails
FOR EACH ROW
BEGIN
	DECLARE productValue DECIMAL(10,2);
    SELECT cost INTO productValue FROM products WHERE ID = OLD.proID;
    IF OLD.quantity >0 THEN
		UPDATE products 
		SET quantity = quantity +OLD.quantity
		WHERE ID = OLD.proID;
        
        UPDATE bills 
		SET cost = cost - (productVal* OLD.quantity)
		WHERE ID = OLD.billID;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_AfterInsertOnSupplierBillDetail
AFTER INSERT ON supplier_billdetails
FOR EACH ROW
BEGIN
	IF NEW.quantity>0 THEN
		UPDATE products
        SET quantity=quantity+NEW.quantity
        WHERE ID=NEW.productID;
        
        UPDATE bills
        SET cost=cost+(NEW.cost*NEW.quantity)
        WHERE ID=NEW.supplierbillID;
	END IF;        
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_AfterUpdateOnSupplierBillDetail
AFTER UPDATE ON supplier_billdetails
FOR EACH ROW
BEGIN
	IF NEW.quantity<>OLD.quantity THEN
		UPDATE products
        SET quantity=quantity+(NEW.quantity-OLD.quantity)
        WHERE ID=NEW.productID;
        
        UPDATE bills
        SET cost=cost+(NEW.cost*(NEW.quantity-OLD.quantity))
        WHERE ID=NEW.supplierbillID;
	END IF;        
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_AfterDeleteOnSupplierBillDetail
AFTER DELETE ON supplier_billdetails
FOR EACH ROW
BEGIN
	IF OLD.quantity>0 THEN
		UPDATE products
        SET quantity=quantity-OLD.quantity
        WHERE ID=OLD.productID;
        
        UPDATE bills
        SET cost=cost-(OLD.cost*OLD.quantity)
        WHERE ID=OLD.supplierbillID;
	END IF;        
END //
DELIMITER ;


	