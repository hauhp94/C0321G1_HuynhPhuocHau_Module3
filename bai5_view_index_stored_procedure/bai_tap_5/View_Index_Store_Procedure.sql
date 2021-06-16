create database demo;
use demo;
create table products (
Id int primary key auto_increment,
product_Code varchar(45) unique,
product_Name varchar(255),
product_Price double,
product_Amount int,
product_Description varchar(255),
product_Status varchar(45)
);
insert into products (product_Code,product_Name,product_Price,product_Amount,product_Description,product_Status)
values('CN100' , 'Máy ảnh canon', 500000, 12, 'Canon chinh hang', 'có sẵn'),
('NK100' , 'Máy ảnh ', 1500000, 110, 'Nikon chinh hang', 'có sẵn'),
('SS100' , 'Máy ảnh Samsung', 450000, 12, 'Samsung chinh hang', 'có sẵn'),
('IP11' , 'iPhone 11 xanh', 1200000, 12, 'apple chinh hang', 'có sẵn'),
('IP12' , 'iPhone 12 vàng', 400000, 12, 'Hàng cũ', 'có sẵn'),
('IPX' , 'iphone X 64gb', 300000, 12, 'Hàng cũ', 'có sẵn');
select * from products;
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX index_produt_code ON products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE UNIQUE INDEX index_composite ON products(product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products
where product_code='IP11';
-- So sánh câu truy vấn trước và sau khi tạo index
-- sau khi tạo index chỉ cần tìm 1 dòng
-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW view_product_code AS
select product_code from products;
CREATE VIEW view_product_name AS
select product_name from products;
CREATE VIEW view_product_price AS
select product_price from products;
CREATE VIEW view_product_status AS
select product_status from products;
select * from view_product_name;
-- Tiến hành sửa đổi view
  create or replace view view_product_name as
  select * from products
  where product_name = 'iPhone 12 vàng';
-- Tiến hành xoá view
drop view view_product_name;
-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
Delimiter //
Create Procedure all_records_products()
    BEGIN
    Select * from products;
    END//
DELIMITER ;
call all_records_products;
-- Tạo store procedure thêm một sản phẩm mới
Delimiter //
Create Procedure add_products(product_code varchar(45),product_name varchar(255), product_price double,product_amount int, product_description varchar(255),product_status varchar(45) )
    BEGIN
    insert into products (product_code,product_name, product_price ,product_amount , product_description,product_status)
    values(product_code ,product_name, product_price,product_amount, product_description,product_status);
    END//
DELIMITER ;
call add_products('IP71', 'iPhone 7 32gb',2000000, 4,'hàng dựng', 'không có sẵn');
-- Tạo store procedure sửa thông tin sản phẩm theo id
Delimiter //
Create Procedure edit_name_product(id_p int,product_name_new varchar(255))
    BEGIN
    update products
    set product_name = product_name_new
    where id= id_p;
    END//
DELIMITER ;
call edit_name_product(2,'Nikon p1000');
-- Tạo store procedure xoá sản phẩm theo id
Delimiter //
Create Procedure delete_product(id_p int)
    BEGIN
    delete from  products
    where id= id_p;
    END//
DELIMITER ;
call delete_product(2);
