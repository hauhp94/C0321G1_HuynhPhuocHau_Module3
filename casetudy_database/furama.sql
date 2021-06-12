create database furama;
use furama;
create table vi_tri(
id_vi_tri int primary key ,
ten_vi_tri varchar(45)
);
create table trinh_do(
id_trinh_do int primary key,
trinh_do varchar(45)
);
create table bo_phan(
id_bo_phan int primary key,
ten_bo_phan varchar(45)
);
create table nhan_vien(
id_nhan_vien int primary key ,
ho_ten varchar(255),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
ngay_sinh date,
so_cmnd bigint(45),
luong double,
sdt bigint,
dia_chi varchar(255),
foreign key (id_vi_tri) references vi_tri (id_vi_tri),
foreign key (id_trinh_do) references trinh_do(id_trinh_do),
foreign key (id_bo_phan) references bo_phan(id_bo_phan)
);
create table loai_khach(
id_loai_khach int primary key,
ten_loai_khach varchar(45)
);
create table khach_hang(
id_khach_hang int primary key,
id_loai_khach int,
ho_ten_khach varchar(255),
ngay_sinh date,
so_cmnd bigint,
sdt bigint,
email varchar(255),
dia_chi  varchar(255),
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);
create table loai_dich_vu(
id_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);
create table kieu_thue(
id_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);
create table dich_vu(
id_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da int,
chi_phi_thue double,
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(45),
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue),
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);
create table dich_vu_di_kem(
id_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi int,
trang_thai_kha_dung varchar(45)
);

create table hop_dong(
id_hop_dong int primary key,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lap_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc double,
tong_tien double,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);
create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int,
foreign key (id_hop_dong) references hop_dong(id_hop_dong),
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);
insert into vi_tri
values(1, 'le tan'),
(2, 'phuc vu'),
(3, 'chuyen vien'),
(4, 'giam sat'),
(5, 'quan ly'),
(6, 'giam doc');
insert into trinh_do
values (1, 'trung cap'),
(2,'cao dang'),
(3,'dai hoc'),
(4,'sau dai hoc');
insert into bo_phan
values (1, 'sale marketing'),
(2,'hanh chinh'),
(3,'phuc vu'),
(4,'quan ly');
insert into nhan_vien
values
(1,'dang van lam', 1,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'gia lai'),
(5,'nguyen cong phuong', 1,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'gia lai'),
 (2,'nguyen cong toan', 1,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'hue'),
 (3,'huynh phuoc hau', 1,2,1,'1994-03-02', 123123123, 15000.0, 0905123345,'da nang');
 insert into kieu_thue
 values (1, 'nam'),(2,'thang'),(3,'ngay'),(4,'gio');
 insert into loai_dich_vu
 values (1, 'villa'),(2,'house'), (3,'room');
 insert into loai_khach
 values (1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');
 insert into khach_hang
 values(1,2,'nguyen quang hai','1990-02-03',123234123,0905123123,'hai@gmail.com','ha noi'),
 (2,3,'bui tan truong','1990-02-03',123234123,0905123123,'truong@gmail.com','binh duong'),
 (3,1,'hoang duc','1995-02-03',155234123,0905123123,'duc@gmail.com','ha noi');
 insert into dich_vu
 values(1, 'villa mua dong', 90, 5,10,2000000,1,1,'trong'),
 (2, 'villa mua he', 60, 5,10,2000000,1,1,'trong'),
 (3, 'villa mua xuan', 120, 6,6,1000000,2,1,'trong'),
 (4, 'house mua dong', 90, 5,4,3500000,2,2,'da co khach dat'),
 (5, 'house mua dong', 76, 5,12,4000000,3,2,'trong'),
 (6, 'room mua dong', 56, 5,11,900000,3,3,'da co khach dat'),
 (7, 'room mua dong', 78, 5,14,1000000,2,3,'trong');
 insert into dich_vu_di_kem
 values(1, 'massage', 200000, 2, 'trong'),
 (2, 'karaoke', 300000, 1, 'trong'),
 (3, 'thức ăn', 100000, 3, 'trong'),
 (4, 'nước uống', 50000,2 , 'trong'),
 (5, 'thuê xe ', 600000, 2, 'trong');
 insert into hop_dong
 values(1,1,1,1,'2020-01-02','2021-03-02',5000000,22000000.0),
 (2,2,2,3,'2020-01-02','2021-03-02',2000000,14000000.0),
 (3,3,3,2,'2019-01-02','2021-03-02',4000000,12000000.0);
 insert into hop_dong_chi_tiet
 values(1,2,1,1),(2,1,2,3),(3,1,2,3);
 select * from hop_Dong_chi_tiet;
 
select * from nhan_vien
where ho_ten REGEXP '^[hkt][a-z ]{0,16}$' ;




