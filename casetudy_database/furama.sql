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
values(1, 'Lễ tân'),
(2, 'Phục vụ'),
(3, 'Chuyên viên'),
(4, 'Giám sát'),
(5, 'Quản lý'),
(6, 'Giám đốc');
insert into trinh_do
values (1, 'Trung cấp'),
(2,'Cao đẳng'),
(3,'Đại chọ'),
(4,'Sau đại học');
insert into bo_phan
values (1, 'Sale marketing'),
(2,'Hành chính'),
(3,'Phục vụ'),
(4,'Quản lý');
insert into nhan_vien
values
(1,'Đặng Văn Lâm', 1,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'Quảng Trị'),
(5,'Nguyễn Công Phượng', 1,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'Gia Lai'),
 (2,'Nguyễn Văn Toàn', 1,2,1,'1990-03-02', 123123123, 15000.0, 0905123345,'Huế'),
 (3,'Huỳnh Phước Hậu', 1,2,1,'1994-03-02', 123123123, 15000.0, 0905123345,'Đà Nẵng');
 insert into kieu_thue
 values (1, 'nam'),(2,'thang'),(3,'ngay'),(4,'gio');
 insert into loai_dich_vu
 values (1, 'villa'),(2,'house'), (3,'room');
 insert into loai_khach
 values (1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');
 insert into khach_hang
 values(1,2,'Nguyễn Quang Hải','1990-02-03',123234123,0905123123,'hai@gmail.com','Hà Nội'),
 (2,3,'Bùi Tấn Trường','1990-02-03',123234123,0905123123,'truong@gmail.com','Đà Nẵng'),
 (3,1,'Nguyễn Hoàng Đức','1995-02-03',155234123,0905123123,'duc@gmail.com','Huế'),
 (4,2,'Nguyễn Tiến Linh','1940-02-03',123234123,0905123123,'hai@gmail.com','Đà Nẵng'),
 (5,3,'Nguyễn Thành Chung','1990-02-03',123234123,0905123123,'truong@gmail.com','Quảng Trị'),
 (6,1,'Lê Văn Xuân','1995-02-03',155234123,0905123123,'xuan@gmail.com','Đà Nẵng'),
 (7,1,'Lê Văn Vip','1995-02-03',155234123,0905123123,'xuan@gmail.com','Quảng Nam'),
 (8,1,'Nguyễn Văn Sang','1995-02-03',155234123,0905123123,'xuan@gmail.com','Đà Lạt'),
 (9,1,'Võ Huy Toàn','2004-02-03',155234123,0905123123,'xuan@gmail.com','Hải Phòng');
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
 values(1,1,1,1,'2020-01-02','2021-03-02',5000000,null),
 (2,2,2,3,'2020-01-02','2021-03-02',2000000,null),
 (3,3,3,2,'2019-01-02','2021-03-02',4000000,null),
 (4,3,1,2,'2018-12-02','2021-03-02',4000000,null),
 (5,3,6,4,'2019-01-02','2021-03-02',5000000,null),
 (6,3,7,5,'2019-01-02','2021-03-02',4000000,null),
 (7,1,8,5,'2019-01-02','2021-03-02',2000000,null),
 (8,1,8,6,'2019-01-02','2021-03-02',5000000,null),
 (9,1,8,7,'2019-01-02','2021-03-02',5000000,null),
 (10,1,7,6,'2019-01-02','2021-03-02',5000000,null);
 insert into hop_dong_chi_tiet
 values(1,2,1,1),(2,1,2,3),(3,1,2,3);
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




