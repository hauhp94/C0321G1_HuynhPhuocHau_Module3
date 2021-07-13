create database furama_module3;
use furama_module3;
create table `position`(
position_id int  primary key auto_increment,
position_name varchar(45)
);
create table education_degree(
education_Degree_id int auto_increment primary key,
education_degree_name varchar(45)
);
create table division(
division_id int auto_increment primary key,
division_name varchar(45)
);
create table role(
role_id int auto_increment primary key,
role_name varchar(255)
);
create table user(
username varchar(255)  primary key,
password varchar(255)
);
create table user_role(
role_id int ,
username varchar(255),
foreign key (role_id) references role(role_id)on update cascade on delete cascade,
foreign key (username) references user(username)on update cascade on delete cascade
);
create table employee(
employee_id int auto_increment primary key,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key (position_id) references `position`(position_id)on update cascade on delete cascade,
foreign key (education_degree_id) references education_degree(education_degree_id)on update cascade on delete cascade,
foreign key (division_id) references division(division_id)on update cascade on delete cascade,
foreign key (username) references user(username)on update cascade on delete cascade
);
create table customer_type(
customer_type_id int auto_increment primary key,
customer_type_name varchar(45)
);
create table customer(
customer_id int auto_increment primary key,
customer_name varchar(45),
customer_code varchar(45),
customer_type_id int,
customer_birthday date,
customer_gender int,
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),
foreign key (customer_type_id) references customer_type(customer_type_id)on update cascade on delete cascade
);
create table service_type(
service_type_id int auto_increment primary key,
service_type_name varchar(45)
);
create table rent_type(
rent_type_id int auto_increment primary key,
rent_type_name varchar(45),
rent_type_cost double
);
create table service(
service_id int auto_increment primary key,
service_code varchar(45),
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
free_service varchar(45),
foreign key (rent_type_id) references rent_type(rent_type_id)on update cascade on delete cascade,
foreign key (service_type_id) references service_type(service_type_id)on update cascade on delete cascade
);
create table contract(
contract_id int auto_increment primary key,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int,
foreign key (employee_id) references employee(employee_id)on update cascade on delete cascade,
foreign key (customer_id) references customer(customer_id)on update cascade on delete cascade,
foreign key (service_id) references service(service_id)on update cascade on delete cascade
);
create table attach_service(
attach_service_id int auto_increment primary key,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);
create table contract_detail(
contract_detail_id int primary key auto_increment,
contract_id int,
attach_service_id int,
quantity int,
foreign key (contract_id) references contract(contract_id)on update cascade on delete cascade,
foreign key (attach_service_id) references attach_service(attach_service_id)on update cascade on delete cascade
);
DELIMITER $$

CREATE PROCEDURE get_all_customer()

BEGIN

SELECT *, customer_type_name
    
FROM customer

join customer_type on customer.customer_type_id=customer_type.customer_type_id;

    END$$

DELIMITER ;

-- procedue update customer
DELIMITER $$
CREATE PROCEDURE update_customer(
p_customer_id int,
p_customer_name varchar(45),
p_customer_code varchar(45),
p_customer_type_id int,
p_customer_birthday date,
p_customer_gender int,
p_customer_id_card varchar(45),
p_customer_phone varchar(45),
p_customer_email varchar(45),
p_customer_address varchar(45) )

BEGIN

update customer
    
set 
customer_name =p_customer_name,
customer_code =p_customer_code,
customer_type_id=p_customer_type_id ,
customer_birthday=p_customer_birthday,
customer_gender=p_customer_gender,
customer_id_card =p_customer_id_card,
customer_phone =p_customer_phone,
customer_email=p_customer_email,
customer_address =p_customer_address
where customer_id=p_customer_id;
    END$$
DELIMITER ;
-- procedure insert Service
DELIMITER $$
CREATE PROCEDURE insert_service(
p_service_code varchar(45),
p_service_name varchar(45),
p_service_area int,
p_service_cost double,
p_service_max_people int,
p_rent_type_id int,
p_service_type_id int,
p_standard_room varchar(45),
p_description_other_convenience varchar(45),
p_pool_area double,
p_number_of_floors int,
p_free_service varchar(45)
 )
BEGIN
insert into service (
service_code ,
service_name ,
service_area ,
service_cost ,
service_max_people ,
rent_type_id ,
service_type_id ,
standard_room ,
description_other_convenience ,
pool_area ,
number_of_floors ,
free_service
)
values(
p_service_code,
p_service_name,
p_service_area,
p_service_cost,
p_service_max_people,
p_rent_type_id,
p_service_type_id,
p_standard_room,
p_description_other_convenience,
p_pool_area,
p_number_of_floors,
p_free_service);
    END$$
DELIMITER ;
-- select SERVICE
DELIMITER $$
CREATE PROCEDURE select_service()
BEGIN
select service_id, service_code, service_name, service_area, service_cost, service_max_people, service.rent_type_id, service.service_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, free_service, service_type_name, rent_type_name
from service 
join service_type on service.service_type_id=service_type.service_type_id
join rent_type on service.rent_type_id=rent_type.rent_type_id;
END$$
DELIMITER ;
call select_service;
procedure insert Service
DELIMITER $$
CREATE PROCEDURE insert_employee(
p_employee_name varchar(45),
p_employee_birthday date,
p_employee_id_card varchar(45),
p_employee_salary double,
p_employee_phone varchar(45),
p_employee_email varchar(45),
p_employee_address varchar(45),
p_position_id int,
p_education_degree_id int,
p_division_id int,
p_username varchar(255)
 )
BEGIN
insert into employee (
 employee_name,
 employee_birthday,
 employee_id_card,
 employee_salary, 
 employee_phone,
 employee_email,
 employee_address,
 position_id,
 education_degree_id,
 division_id, 
 username
)
values(
 p_employee_name,
 p_employee_birthday,
 p_employee_id_card,
 p_employee_salary, 
 p_employee_phone,
 p_employee_email,
 p_employee_address,
 p_position_id,
 p_education_degree_id,
 p_division_id, 
 p_username);
    END$$
DELIMITER ;
-- select_all_employee procedure
DELIMITER $$

CREATE PROCEDURE select_all_employee()

BEGIN

SELECT *
    
FROM employee

join position on employee.position_id=position.position_id
join education_degree on employee.education_degree_id= education_degree.education_Degree_id
join division on employee.division_id=division.division_id;

    END$$

DELIMITER ;

-- procedue update employee
DELIMITER $$
CREATE PROCEDURE update_employee(
p_employee_id int,
p_employee_name varchar(45),
p_employee_birthday date,
p_employee_id_card varchar(45),
p_employee_salary double,
p_employee_phone varchar(45),
p_employee_email varchar(45),
p_employee_address varchar(45),
p_position_id int,
p_education_degree_id int,
p_division_id int,
p_username varchar(255) )

BEGIN

update employee
    
set 
employee_name=p_employee_name,
employee_birthday=p_employee_birthday ,
employee_id_card=p_employee_id_card ,
employee_salary=p_employee_salary ,
employee_phone=p_employee_phone ,
employee_email=p_employee_email ,
employee_address=p_employee_address ,
position_id=p_position_id ,
education_degree_id=p_education_degree_id ,
division_id=p_division_id ,
username=p_username
where employee_id=p_employee_id;
    END$$
DELIMITER ;

-- select contract full
create view contract_full as
select contract_id, contract_start_date, contract_end_date, contract_deposit,
 contract_total_money, contract.service_id, contract.employee_id, employee_name,
contract.customer_id, customer_name,  service_name
from contract
join customer on contract.customer_id=customer.customer_id
join employee on contract.employee_id=employee.employee_id
join service on contract.service_id=service.service_id;
-- GET ALL CUSTOMER WITH SERVICE
DELIMITER $$

CREATE PROCEDURE get_all_customer_with_service()

BEGIN

SELECT *, customer_type_name
    
FROM customer

right join contract on customer.customer_id=contract.customer_id;

    END$$

DELIMITER ;
create view full_customer_service as
SELECT contract.customer_id, customer_name, customer_code, customer.customer_type_id, customer_birthday, customer_gender, customer_id_card, 
customer_phone, customer_email, customer_address, contract.contract_id, contract_start_date, contract_end_date, contract_deposit,
 contract_total_money, service.service_id, service_code, service_name, service_area, service_cost, 
 service_max_people, rent_type_id, service_type_id, standard_room, description_other_convenience, pool_area, number_of_floors,
 free_service, contract_detail_id, quantity, attach_service.attach_service_id, attach_service_name, attach_service_cost,
 attach_service_unit, attach_service_status,customer_type_name
FROM customer
right join contract on customer.customer_id=contract.customer_id
left join service on contract.service_id=service.service_id
left join contract_detail on contract.contract_id=contract_detail.contract_id
left join attach_service on contract_detail.attach_service_id=attach_service.attach_service_id
left join customer_type on customer.customer_type_id=customer_type.customer_type_id;
DELIMITER $$

CREATE PROCEDURE get_all_customer_by_name(p_name varchar(45))

BEGIN

SELECT *, customer_type_name
    
FROM customer

join customer_type on customer.customer_type_id=customer_type.customer_type_id

where customer_name like concat('%',p_name,'%');

    END$$

DELIMITER ;
