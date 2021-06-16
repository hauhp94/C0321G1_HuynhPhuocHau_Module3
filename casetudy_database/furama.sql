create database furama;
use furama;
create table vi_tri(
id_vi_tri int primary key auto_increment ,
ten_vi_tri varchar(45)
);
create table trinh_do(
id_trinh_do int primary key auto_increment,
trinh_do varchar(45)
);
create table bo_phan(
id_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);
create table nhan_vien(
id_nhan_vien int primary key auto_increment,
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
id_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);
create table khach_hang(
id_khach_hang int primary key auto_increment,
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
id_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);
create table kieu_thue(
id_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);
create table dich_vu(
id_dich_vu int primary key auto_increment,
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
id_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi int,
trang_thai_kha_dung varchar(45)
);

create table hop_dong(
id_hop_dong int primary key auto_increment,
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
id_hop_dong_chi_tiet int primary key auto_increment,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int,
foreign key (id_hop_dong) references hop_dong(id_hop_dong),
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);
insert into vi_tri(ten_vi_tri)
values( 'Lễ tân'),
('Phục vụ'),
('Chuyên viên'),
('Giám sát'),
('Quản lý'),
('Giám đốc');
insert into trinh_do(trinh_do)
values ('Trung cấp'),
('Cao đẳng'),
('Đại chọ'),
('Sau đại học');
insert into bo_phan(ten_bo_phan)
values ('Sale marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');
select * from nhan_vien;
insert into nhan_vien(ho_ten,id_vi_tri,id_trinh_do,id_bo_phan,ngay_sinh,so_cmnd,luong,sdt,dia_chi)
values('Đặng Văn Lâm', 1,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'Quảng Trị'),
('Nguyễn Công Phượng', 2,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'Gia Lai'),
 ('Nguyễn Văn Toàn', 3,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'Huế'),
 ('Huỳnh Phước Hậu', 1,2,1,'1994-03-02', 123123123, 15000.0, 0905123345,'Đà Nẵng');
 insert into kieu_thue(ten_kieu_thue)
 values ('năm'),('tháng'),('ngày'),('giờ');
 insert into loai_dich_vu(ten_loai_dich_vu)
 values ('villa'),('house'), ('room');
 insert into loai_khach(ten_loai_khach)
 values ('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');
 insert into khach_hang(id_loai_khach ,ho_ten_khach,ngay_sinh ,so_cmnd,sdt ,email,dia_chi)
 values(2,'Nguyễn Quang Hải','1990-02-03',123234123,0905123123,'hai@gmail.com','Hà Nội'),
 (3,'Bùi Tấn Trường','1990-02-03',123234123,0905123123,'truong@gmail.com','Đà Nẵng'),
 (1,'Nguyễn Hoàng Đức','1995-02-03',155234123,0905123123,'duc@gmail.com','Huế'),
 (2,'Nguyễn Tiến Linh','1940-02-03',123234123,0905123123,'hai@gmail.com','Đà Nẵng'),
 (3,'Nguyễn Thành Chung','1990-02-03',123234123,0905123123,'truong@gmail.com','Quảng Trị'),
 (1,'Lê Văn Xuân','1995-02-03',155234123,0905123123,'xuan@gmail.com','Đà Nẵng'),
 (1,'Lê Văn Vip','1995-02-03',155234123,0905123123,'xuan@gmail.com','Quảng Nam'),
 (1,'Nguyễn Văn Sang','1995-02-03',155234123,0905123123,'xuan@gmail.com','Đà Lạt'),
 (1,'Võ Huy Toàn','2004-02-03',155234123,0905123123,'xuan@gmail.com','Hải Phòng');
 insert into dich_vu(ten_dich_vu ,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue ,id_loai_dich_vu,trang_thai)
 values( 'villa mua dong', 90, 5,10,2000000,1,1,'trong'),
 ( 'villa mua he', 60, 5,10,2000000,1,1,'trong'),
 ( 'villa mua xuan', 120, 6,6,1000000,2,1,'trong'),
 ( 'house mua dong', 90, 5,4,3500000,2,2,'da co khach dat'),
 ( 'house mua dong', 76, 5,12,4000000,3,2,'trong'),
 ( 'room mua dong', 56, 5,11,900000,3,3,'da co khach dat'),
 ('room mua dong', 78, 5,14,1000000,2,3,'trong');
 insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia ,don_vi,trang_thai_kha_dung)
 values( 'massage', 200000, 2, 'trong'),
 ( 'karaoke', 300000, 1, 'trong'),
 ( 'thức ăn', 100000, 3, 'trong'),
 ( 'nước uống', 50000,2 , 'trong'),
 ( 'thuê xe ', 600000, 2, 'trong');
 insert into hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lap_hop_dong ,ngay_ket_thuc ,tien_dat_coc,tong_tien )
 values(1,1,1,'2020-01-02','2021-03-02',5000000,null),
 (2,2,3,'2020-01-02','2021-03-02',2000000,null),
 (3,3,2,'2019-01-02','2021-03-02',4000000,null),
 (3,1,2,'2018-12-02','2021-03-02',4000000,null),
 (3,6,4,'2019-01-02','2021-03-02',5000000,null),
 (3,7,5,'2019-01-02','2021-03-02',4000000,null),
 (1,8,5,'2019-01-02','2021-03-02',2000000,null),
 (1,8,6,'2019-01-02','2021-03-02',5000000,null),
 (1,8,7,'2019-01-02','2021-03-02',5000000,null),
 (1,7,6,'2019-01-02','2021-03-02',5000000,null);
 insert into hop_dong_chi_tiet(id_hop_dong ,id_dich_vu_di_kem ,so_luong )
 values(2,1,1),(1,2,3),(1,2,3);
 select * from hop_Dong_chi_tiet;
 -- Task 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select* from nhan_vien 
where char_length(SUBSTRING_INDEX(ho_ten, " ", -1))<=16 and  REGEXP_LIKE( SUBSTRING_INDEX(ho_ten, " ", -1),'^[HKT]') ;

-- Task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where (timestampdiff(year, ngay_sinh, curdate()) between 18 and 50) and (dia_chi='Đà Nẵng' or dia_chi='Quảng Trị');

/*Task 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.*/
select k.ho_ten_khach, k. id_khach_hang, count(h.id_khach_hang) as so_lan_dat from khach_hang k
join hop_dong h on k.id_khach_hang = h.id_khach_hang
join loai_khach l on k.id_loai_khach = l.id_loai_khach
where l.ten_loai_khach='Diamond'
group by id_khach_hang
order by so_lan_dat;

/* Task 5 Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
(Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
 cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).*/
 select * from hop_dong_chi_tiet;
 select * from  dich_vu_di_kem;
 select * from dich_vu;
 select * from hop_dong;
select k.id_khach_hang, k.ho_ten_khach, l.ten_loai_khach, h.id_hop_dong,d.ten_dich_vu,h.ngay_lap_hop_dong, h.ngay_ket_thuc, (d.chi_phi_thue+sum(dk.don_vi*dk.gia)) as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on h.id_khach_hang = k.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
left join hop_dong_chi_tiet hc on h.id_hop_dong = hc.id_hop_dong
left join dich_vu_di_kem dk on hc.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by h.id_hop_dong
union
select k.id_khach_hang, k.ho_ten_khach, l.ten_loai_khach, h.id_hop_dong,d.ten_dich_vu,h.ngay_lap_hop_dong, h.ngay_ket_thuc,h.tong_tien
from khach_hang k
right join loai_khach l on k.id_loai_khach = l.id_loai_khach
right join hop_dong h on h.id_khach_hang = k.id_khach_hang
right join dich_vu d on h.id_dich_vu = d.id_dich_vu
right join hop_dong_chi_tiet hc on h.id_hop_dong = hc.id_hop_dong
right join dich_vu_di_kem dk on hc.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by h.id_hop_dong;

select ngay_lap_hop_dong from hop_dong;
;
select k.id_khach_hang,k.ho_ten_khach,l.ten_loai_khach,h.id_hop_dong,d.ten_dich_vu,h.ngay_lap_hop_dong,h.ngay_ket_thuc,d.chi_phi_thue,c.so_luong,dk.gia,d.chi_phi_thue+sum(c.so_luong*dk.gia) as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on k.id_khach_hang = h.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
inner join hop_dong_chi_tiet c on h.id_hop_dong = c.id_hop_dong
inner join dich_vu_di_kem dk on c.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by (h.id_hop_dong)
having h.id_hop_dong is not null
union
select k.id_khach_hang,k.ho_ten_khach,l.ten_loai_khach,h.id_hop_dong,d.ten_dich_vu,h.ngay_lap_hop_dong,h.ngay_ket_thuc,d.chi_phi_thue,null,null,d.chi_phi_thue as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on k.id_khach_hang = h.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
where h.id_hop_dong not in (select hop_dong_chi_tiet.id_hop_dong from hop_dong_chi_tiet)
union
select k.id_khach_hang,k.ho_ten_khach,l.ten_loai_khach,null,null,null,null,null,null,null,null
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
where k.id_khach_hang not in (select hop_dong.id_khach_hang from hop_dong);
select* from khach_hang;




