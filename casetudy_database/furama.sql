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
gia double default 0,
don_vi int default 0,
trang_thai_kha_dung varchar(45)
);

create table hop_dong(
id_hop_dong int primary key auto_increment,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lap_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc double default 0,
tong_tien double default 0,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);
create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key auto_increment,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int default 0,
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
 (3,'Bùi Tấn Trường','1990-02-03',123234123,0925123376,'truong@gmail.com','Đà Nẵng'),
 (1,'Nguyễn Hoàng Đức','1995-02-03',155234123,0777123345,'duc@gmail.com','Vinh'),
 (2,'Nguyễn Tiến Linh','1940-02-03',123234123,0931948372,'hai@gmail.com','Đà Nẵng'),
 (3,'Nguyễn Thành Chung','1990-02-03',123234123,0888111222,'truong@gmail.com','Quảng Ngãi'),
 (1,'Lê Văn Xuân','1995-02-03',155234123,0123333222,'xuan@gmail.com','Đà Nẵng'),
 (1,'Lê Văn Vip','1995-02-03',155234123,0993123234,'xuan@gmail.com','Quảng Ngãi'),
 (1,'Nguyễn Văn Sang','1995-02-03',155234123,0989231453,'xuan@gmail.com','Vinh'),
 (1,'Võ Huy Toàn','2004-02-03',155234123,0540234121,'xuan@gmail.com','Hải Phòng'),
 (2,'Võ Huy Toàn','2005-02-03',123234123,0444222111,'toan2@gmail.com','Vinh'),
  (5,'Võ Văn Dũng','2005-02-03',123234123,0543123333,'toan2@gmail.com','Trà Vinh'),
   (4,'Bùi Huy Toàn','2005-02-03',123234123,0909202031,'toan2@gmail.com','Quảng Ngãi');
 insert into dich_vu(ten_dich_vu ,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue ,id_loai_dich_vu,trang_thai)
 values( 'villa mua dong', 90, 5,10,2000000,1,1,'trong'),
 ( 'villa mua he', 60, 5,10,2000000,1,1,'trong'),
 ( 'villa mua xuan', 120, 6,6,1000000,2,1,'trong'),
 ( 'house mua dong', 90, 5,4,3500000,2,2,'da co khach dat'),
 ( 'house mua dong', 76, 5,12,4000000,3,2,'trong'),
 ( 'room mua dong', 56, 5,11,900000,3,3,'da co khach dat'),
 ('room mua dong', 78, 5,14,1000000,2,3,'trong');
 insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia ,don_vi,trang_thai_kha_dung)
 values( 'massage', 250000, 1, 'trong'),
 ( 'karaoke', 300000, 1, 'trong'),
 ( 'thức ăn', 100000, 1, 'trong'),
 ( 'nước uống', 50000,1 , 'trong'),
 ( 'thuê xe ', 600000, 1, 'trong');
 insert into hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lap_hop_dong ,ngay_ket_thuc ,tien_dat_coc,tong_tien )
 values(1,1,1,'2020-01-02','2021-03-29',5900000,null),
 (2,2,3,'2020-01-19','2021-03-15',2900000,null),
 (3,3,2,'2019-01-15','2021-03-27',3000000,null),
 (3,1,2,'2018-12-14','2021-02-28',4200000,null),
 (3,6,4,'2019-01-13','2021-03-31',4300000,null),
 (3,7,5,'2019-04-12','2021-01-31',4100000,null),
 (1,8,5,'2019-03-02','2021-05-02',2000000,null),
 (1,8,6,'2019-12-02','2021-12-02',5000000,null),
 (1,8,2,'2019-11-02','2021-11-02',6600000,null),
 (1,5,6,'2017-07-02','2019-03-01',9900000,null),
 (2,4,1,'2016-06-06','2017-03-01',8800000,null),
 (4,3,3,'2018-01-19','2016-03-01',4400000,null),
 (4,3,3,'2019-01-21','2016-03-01',12000000,null),
 (4,3,5,'2018-02-20','2016-03-01',4500000,null);
 insert into hop_dong_chi_tiet(id_hop_dong ,id_dich_vu_di_kem ,so_luong )
 values(2,1,1),(1,2,3),(1,2,3),(1,2,2),(3,2,3),(4,2,5),(5,1,3),(6,4,3),(7,4,3),(8,2,3),(8,3,3),(9,5,1),(10,5,2),(11,2,1),(12,1,1),(13,2,3),(14,3,3);
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

select k.id_khach_hang, k.ho_ten_khach, l.ten_loai_khach, h.id_hop_dong,d.ten_dich_vu,h.ngay_lap_hop_dong, h.ngay_ket_thuc,d.chi_phi_thue, d.chi_phi_thue+sum(dk.don_vi*dk.gia) as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on h.id_khach_hang = k.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
left join hop_dong_chi_tiet hc on h.id_hop_dong = hc.id_hop_dong
left join dich_vu_di_kem dk on hc.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by h.id_hop_dong
union
select k.id_khach_hang, k.ho_ten_khach, l.ten_loai_khach, h.id_hop_dong,d.ten_dich_vu,h.ngay_lap_hop_dong, h.ngay_ket_thuc,d.chi_phi_thue, d.chi_phi_thue+sum(dk.don_vi*dk.gia) as tong_tien
from khach_hang k
right join loai_khach l on k.id_loai_khach = l.id_loai_khach
right join hop_dong h on h.id_khach_hang = k.id_khach_hang
right join dich_vu d on h.id_dich_vu = d.id_dich_vu
right join hop_dong_chi_tiet hc on h.id_hop_dong = hc.id_hop_dong
right join dich_vu_di_kem dk on hc.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by h.id_hop_dong;
 select * from hop_dong_chi_tiet;
 select * from  dich_vu_di_kem;
 select * from dich_vu;
 select * from hop_dong;
select ngay_lap_hop_dong from hop_dong;
select* from khach_hang;
/* Task 6 Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).*/
select dv.id_dich_vu ,dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu,hd.ngay_lap_hop_dong
from dich_vu dv
join loai_dich_vu ldv on dv.id_loai_dich_vu=ldv.id_loai_dich_vu
join hop_dong hd on dv.id_dich_vu=hd.id_dich_vu
where  not hd.ngay_lap_hop_dong >'2019-01-01' 
order by hd.ngay_lap_hop_dong ;
select* from hop_dong;

/* 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu 
của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.*/
select dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu,hd.ngay_lap_hop_dong
from dich_vu dv
join loai_dich_vu ldv on dv.id_loai_dich_vu=ldv.id_loai_dich_vu
join hop_dong hd on dv.id_dich_vu=hd.id_dich_vu
where (hd.ngay_lap_hop_dong between '2018-01-01' and '2018-12-31') and (hd.ngay_lap_hop_dong not between '2019-01-01' and '2019-12-31')
group by dv.id_dich_vu;


/* Task 8 Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên*/
select ho_ten_khach from khach_hang
group by ho_ten_khach;
select distinct ho_ten_khach from khach_hang;
select ho_ten_khach
from khach_hang
union
select ho_ten_khach
from khach_hang;
 -- Task 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
 
 select month(hd.ngay_lap_hop_dong) as thang , count(hd.id_hop_dong) as so_hop_dong
from hop_dong hd
where year(hd.ngay_lap_hop_dong) = "2019"
group by month(hd.ngay_lap_hop_dong);
/* 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
 Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).*/
 select h.id_hop_dong,h.ngay_lap_hop_dong,h.ngay_ket_thuc,h.tien_dat_coc,count(c.id_hop_dong_chi_tiet) as soLuongDichVuDiKem
from hop_dong h
inner join hop_dong_chi_tiet c on h.id_hop_dong = c.id_hop_dong
inner join dich_vu_di_kem dk on c.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by (h.id_hop_dong);
/* Task 11 Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng
có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.*/
select dvdk.ten_dich_vu_di_kem, dvdk.gia,kh.id_khach_hang,kh.ho_ten_khach,kh.dia_chi,lk.ten_loai_khach
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem =hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong= hd.id_hop_dong
join khach_hang kh on hd.id_khach_hang=kh.id_khach_hang
join loai_khach lk on kh.id_loai_khach=lk.id_loai_khach
where lk.ten_loai_khach='Diamond' and (kh.dia_chi='Vinh' or kh.dia_chi = 'Quảng Ngãi')
group by hd.id_khach_hang;
select* from hop_Dong;
/* Task 12	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang,
 TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết),
 TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019
 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.*/
 select hd.id_hop_dong,nv.ho_ten as ten_nhan_vien, kh.ho_ten_khach as ten_khach_hang,kh.sdt as sdt_khach_hang,dv.ten_dich_vu, hdct.so_luong as so_luong_dvdk,hd.tien_dat_coc
 from hop_dong_chi_tiet hdct
 join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
 join nhan_vien nv  on hd.id_nhan_vien = nv.id_nhan_vien
 join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
 join dich_vu dv on hd.id_dich_vu=dv.id_dich_vu
 join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
 group by hd.id_hop_dong
 order by hd.id_hop_dong;
 -- Task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
 select dvdk.ten_dich_vu_di_kem, max(hdct.so_luong), kh.ho_ten_khach
 from khach_hang kh
  join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
  join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
  join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem= dvdk.id_dich_vu_di_kem
  group by dvdk.ten_dich_vu_di_kem;
  
/* Task 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung. */
 
/* Task 15 Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai,
 DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.*/
 
/* Task 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.*/

/* Task 17 Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
 chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.*/
 
/* Task 18 Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng). */

/* Task 19 Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.*/

/* Task 20 Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
 thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang),
 HoTen, Email, SoDienThoai, NgaySinh, DiaChi.*/
 
/* Task 21 Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”*/

/* Task 22 Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu”
 đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.*/
 
/* Task 23 Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
 Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX*/
 
/* Task 24 Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI trên bảng KHACH HANG 
và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.*/

/* Task 25 Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó 
với Id Khách hàng được truyền vào như là 1 tham số của Sp_1*/

/* Task 26 Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong 
với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
 với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.*/
 
/* Task 27 Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì 
hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database*/

/* Task 28 Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng,
 cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
 với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.
 Nếu dữ liệu hợp lệ thì cho phép cập nhật,
 nếu dữ liệu không hợp lệ thì in ra thông báo 
 “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database*/
 
/* Task 29 Tạo user function thực hiện yêu cầu sau:
a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng
 đến lúc kết thúc hợp đồng mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng
 thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
 Mã của Khách hàng được truyền vào như là 1 tham số của function này.*/

/* Task 30 Tạo Stored procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) 
và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác.*/

  
  

 
 



