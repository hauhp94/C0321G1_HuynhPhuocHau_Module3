use furama_module3;
insert into `position`(position_name)
values( 'Lễ tân'),
('Phục vụ'),
('Chuyên viên'),
('Giám sát'),
('Quản lý'),
('Giám đốc');
insert into education_degree(education_degree_name)
values ('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');
insert into division(division_name)
values ('Sale marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');
 insert into rent_type(rent_type_name)
 values ('năm'),('tháng'),('ngày'),('giờ');
  insert into service_type(service_type_name)
 values ('villa'),('house'), ('room');
  insert into customer_type(customer_type_name)
 values ('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');
--  INSERT INTO customer(customer_name, customer_code,customer_type_id,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) 
--  VALUE("hau","hk-1231" , 1,"1994-01-01",1, "201602131", "09095656565","hph@gmail.com","Đà Nẵng");
