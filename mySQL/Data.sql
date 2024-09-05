USE haohao_store;
CALL insertSupplier('Công ty TNHH sản phẩm tiêu dùng Toshiba Việt Nam',
	'Số 12 Đường 15, Khu phố 4, Thủ Đức, Hồ Chí Minh','0793829453');
CALL insertSupplier('Công Ty TNHH Sony Electronics Việt Nam',
'Tầng 6&7, Tòa nhà President Place, 93 Đ. Nguyễn Du, Bến Nghé, Quận 1, Hồ Chí Minh','0283822227');
CALL insertSupplier('Công Ty TNHH Sanaky Việt Nam','Số 4/12A, Bàu Bàng, P. 13, Q. Tân Bình, TP. HCM','0979530568');

CALL insertProduct('Quạt đứng Toshiba F-LSA20(H)VN','Quạt đứng','Toshiba',1190000,0,'static/Image/-toshiba-f-lsa20-h-vn-1.jpg');
CALL insertProduct('Máy giặt Toshiba 7 Kg AW-L805AV (SG)','Máy giặt','Toshiba',4390000,0,'static/Image/0-1020x570-1020x570.jpg');

DELETE FROM suppliers
