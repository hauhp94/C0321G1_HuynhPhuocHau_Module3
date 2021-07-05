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
contract_detail_id int,
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


