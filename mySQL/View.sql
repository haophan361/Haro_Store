CREATE VIEW view_Supplier_Bill AS
	SELECT s.ID AS supplierID, s.supplierName, s.phone, s.address,
		sb.ID AS supplierBillID, sb.cost, sb.purchase_date, sb.status, sb.receive_date
	FROM suppliers s JOIN supplier_bills sb ON s.ID=sb.supplierID;
    
CREATE view view_SupplierBillDetail_Product AS
	SELECT sb.supplierbillID,sb.ID AS supplierbilldetailID, p.productName,p.productType, p.brand, sb.cost,p.image_url,sb.quantity
    FROM supplier_billdetails sb JOIN products p ON sb.productID=p.ID ;

CREATE VIEW view_BillDetail_Product AS
	SELECT b.billID,b.ID AS billdetailID, p.productName,p.productType, p.brand, p.cost,p.image_url,b.quantity
    FROM billdetails b JOIN products p ON b.proID=p.ID ;
    

