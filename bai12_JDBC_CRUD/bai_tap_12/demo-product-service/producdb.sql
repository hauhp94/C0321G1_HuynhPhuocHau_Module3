CREATE DATABASE productDB;
USE productDB;

create table product (
 id  int(3) NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 price double NOT NULL,
 image varchar(120),
 id_manufacturer int not null,
 PRIMARY KEY (id),
 foreign key (id_manufacturer) references product_manufacturer (id_manufacturer)on update cascade on delete cascade

);
insert into product(name, price, image,id_manufacturer) values('iPhone 6',5000,'iphone6.jpg',1);
insert into product(name, price, image,id_manufacturer) values('iPhone 7',700,'iphone7.jpg',2);
insert into product(name, price, image,id_manufacturer) values('iPhone 8',8000,'iphone8.jpg',3);
insert into product(name, price, image,id_manufacturer) values('iPhone x',900,'iphonex.jpg',4);
insert into product(name, price, image,id_manufacturer) values('iPhone xs',10000,'iphoneXS.jpg',1);
insert into product(name, price, image,id_manufacturer) values('iPhone 11',12000,'iphone11.jpg',2);
insert into product(name, price, image,id_manufacturer) values('iPhone 12',15000,'iphone12.jpg',1);
insert into product(name, price, image,id_manufacturer) values('Nokia 9',7700,'nokia9.jpg',1);
insert into product(name, price, image,id_manufacturer) values('Samsung Note 10',6500,'samsung.jpg',2);
insert into product(name, price, image,id_manufacturer) values('LG G9',4500,'lgg9.jpg',2);
insert into product(name, price, image,id_manufacturer) values('LG G8',6500,'lgg9.jpg',2);
create table product_manufacturer (
 id_manufacturer int(3) NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 factory varchar(120) NOT NULL,
 PRIMARY KEY (id_manufacturer)
);
insert into product_manufacturer (`name`, factory) values('apple','Foxconn');
insert into product_manufacturer (`name`, factory) values('nokia','FoxNokia');
insert into product_manufacturer (`name`, factory) values('LGFT','LGLGconn');
insert into product_manufacturer (`name`, factory) values('SamF','FACSAM');





