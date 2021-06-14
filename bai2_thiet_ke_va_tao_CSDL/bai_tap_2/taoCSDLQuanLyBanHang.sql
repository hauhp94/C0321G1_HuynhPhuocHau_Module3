create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
customer_id int primary key,
customer_name varchar(255),
customer_age int
);
create table `order`(
order_id int primary key,
customer_id int,
order_Date date,
order_Total_Price double,
foreign key (customer_id) references customer (customer_id)
);
create table product(
product_ID int primary key,
product_Name varchar(255),
product_Price double
);
create table order_detail(
order_detail_ID int,
product_ID int,
order_detail_QTY varchar(255),
primary key (order_detail_ID , product_ID),
FOREIGN KEY (order_detail_ID) REFERENCES `order`(order_id),
FOREIGN KEY (product_ID) REFERENCES product(product_ID)
);
