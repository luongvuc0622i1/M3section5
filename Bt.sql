CREATE DATABASE demo;

USE demo;

CREATE TABLE Products
	(
		id					INT				NOT NULL AUTO_INCREMENT PRIMARY KEY,
        productCode			VARCHAR(255)	NOT NULL,
		productName			VARCHAR(255)	NOT NULL,
		productPrice		INT,
		productAmount		INT,
		productDescription	VARCHAR(255),
		productStatus		VARCHAR(255)
	);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
			   VALUE ('SP01', 'BVS', 49000, 20, 'Siêu thấm', 'Còn HSD'),
					 ('SP02', 'Bàn chải', 13000, 50, 'Colgate', 'Còn HSD'),
					 ('SP03', 'Kem đánh răng', 40000, 30, 'Colgate', 'Còn HSD'),
					 ('SP04', 'Khăn mặt', 15000, 100, 'Xuất xứ VN', 'Còn HSD'),
					 ('SP05', 'Dầu gội', 50000, 10, 'X-Men', 'Còn HSD'),
					 ('SP06', 'Sữa tắm', 70000, 10, 'X-Men', 'Còn HSD'),
					 ('SP07', 'Chổi', 15000, 25, 'Viettiep', 'Còn HSD'),
					 ('SP08', 'Hót rác', 10000, 25, 'Viettiep', 'Còn HSD'),
					 ('SP09', 'Chổi lau nhà', 45000, 25, 'Viettiep', 'Còn HSD'),
					 ('SP10', 'Giấy vệ sinh', 5000, 100, 'Panda', 'Còn HSD'),
					 ('SP11', 'Quạt', 350000, 5, 'Made in ChaiLa', 'Còn HSD');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE	PROCEDURE	findAllProducts()
	BEGIN
		SELECT * FROM	Products;
	END //
DELIMITER ;

CALL	findAllProducts();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE	PROCEDURE	addNewProducts(productCode VARCHAR(255), productName VARCHAR(255), productPrice	INT, productAmount INT, productDescription VARCHAR(255), productStatus VARCHAR(255))
	BEGIN
		INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
			   VALUE (productCode, productName, productPrice, productAmount, productDescription, productStatus);
	END //
DELIMITER ;

CALL	addNewProducts('SP12', 'SHit', 350000, 5, 'Made in ChaiLa', 'Còn HSD');

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE	PROCEDURE	updateProducts(IN proId 					INT,
									  proCode 		VARCHAR(255),
									  proName 		VARCHAR(255),
									  proPrice		INT,
									  proAmount 		INT,
                                      proDescription 	VARCHAR(255),
                                      proStatus VARCHAR(255)
								  )
	BEGIN
		UPDATE Products
        SET productCode = proCode,
			productName = proName,
			productPrice = proPrice,
			productAmount = proAmount,
			productDescription = proDescription,
			productStatus = proStatus
		WHERE id = proId;
	END //
DELIMITER ;

CALL	updateProducts(3, 'SP12', 'SHit', 350000, 5, 'Made in ChaiLa', 'Còn HSD');

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE	PROCEDURE	deleteProducts(IN proId INT)
	BEGIN
		DELETE FROM Products WHERE id = proId;
	END //
DELIMITER ;

CALL	deleteProducts(3);