create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
cID int primary key,
cName varchar(255),
cAge int
);
create table order_(
oID int primary key,
cID int,
oDate date,
oTotalPrice double,
foreign key (cID) references customer (cID)
);
create table product(
pID int primary key,
pName varchar(255),
pPrice double
);
create table order_detail(
oID int,
pID int,
odQTY varchar(255),
primary key (oID , pID),
FOREIGN KEY (oID) REFERENCES order_(oID),
FOREIGN KEY (pID) REFERENCES product(pID)
);
