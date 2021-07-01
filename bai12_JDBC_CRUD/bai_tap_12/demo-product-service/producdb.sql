CREATE DATABASE productDB;
USE productDB;

create table product (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 price double NOT NULL,
 image varchar(120),
 PRIMARY KEY (id)
);
insert into product(name, price, image) values('iPhone 6',5000,'iphone6.jpg');
insert into product(name, price, image) values('iPhone 7',700,'iphone7.jpg');
insert into product(name, price, image) values('iPhone 8',8000,'iphone8.jpg');
insert into product(name, price, image) values('iPhone x',900,'iphoneX.jpg');
insert into product(name, price, image) values('iPhone xs',10000,'iphoneXS.jpg');
insert into product(name, price, image) values('iPhone 11',12000,'iphone11.jpg');
insert into product(name, price, image) values('iPhone 12',15000,'iphone12.jpg');
insert into product(name, price, image) values('Nokia 9',7700,'nokia9.jpg');
insert into product(name, price, image) values('Samsung Note 10',6500,'samsung.jpg');
insert into product(name, price, image) values('LG G9',4500,'lgg9.jpg');
insert into product(name, price, image) values('LG G8',6500,'lgg9.jpg');


