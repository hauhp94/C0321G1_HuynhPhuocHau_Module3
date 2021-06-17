use furama;
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
 select hd.id_hop_dong,nv.ho_ten as ten_nhan_vien, kh.ho_ten_khach as ten_khach_hang,kh.sdt as sdt_khach_hang,dv.ten_dich_vu, hdct.so_luong as so_luong_dvdk,hd.tien_dat_coc,hd.ngay_lap_hop_dong
 from hop_dong_chi_tiet hdct
 join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
 join nhan_vien nv  on hd.id_nhan_vien = nv.id_nhan_vien
 join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
 join dich_vu dv on hd.id_dich_vu=dv.id_dich_vu
 join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
 where (hd.ngay_lap_hop_dong between '2019-10-01' and ' 2019-12-31') and not (hd.ngay_lap_hop_dong between '2019-01-01' and ' 2019-06-30')
 group by hd.id_khach_hang;
 /*Task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/
 select dvdk.ten_dich_vu_di_kem, max(hdct.so_luong), kh.ho_ten_khach
 from khach_hang kh
  join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
  join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
  join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem= dvdk.id_dich_vu_di_kem
  group by dvdk.ten_dich_vu_di_kem;
  
/* Task 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung. */
 select hd.id_hop_dong,dv.ten_dich_vu,dvdk.ten_dich_vu_di_kem,hdct.so_luong
 from hop_dong hd
 join dich_vu dv on hd.id_dich_vu=dv.id_dich_vu
 join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
 join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
 where hdct.so_luong=1
 group by dvdk.ten_dich_vu_di_kem;
 
 
/* Task 15 Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai,
 DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.*/
 select nv.id_nhan_vien,nv.ho_ten,td.trinh_do,bp.ten_bo_phan,nv.sdt,nv.dia_chi, count(hd.id_hop_dong) as so_hop_dong
 from nhan_vien nv
 join trinh_do td on nv.id_trinh_do = td.id_trinh_do
 join bo_phan bp on nv.id_bo_phan=bp.id_bo_phan
 join hop_dong hd on nv.id_nhan_vien=hd.id_nhan_vien
 where (hd.ngay_lap_hop_dong between '2018-01-01' and '2019-01-01')
 group by nv.id_nhan_vien
 having count(hd.id_hop_dong)<=3;
 
/* Task 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.*/
delete from nhan_vien nv
where not id_nhan_vien = (select id_nhan_vien from view_nhan_vien_va_hop_dong_2017_2019);
create view view_nhan_vien_va_hop_dong_2017_2019 as
select nv.id_nhan_vien,nv.ho_ten,count(hd.id_hop_dong) as so_luong_hop_dong,hd.ngay_lap_hop_dong
from nhan_vien nv
join hop_dong hd on nv.id_nhan_vien=hd.id_nhan_vien
where (hd.ngay_lap_hop_dong between '2017-01-01' and now())
group by nv.id_nhan_vien;
select* from view_nhan_vien_va_hop_dong_2017_2019;
select* from hop_dong;
select nv.ho_ten, count(hd.id_hop_dong) as so_luong_hop_dong 
from nhan_vien nv
join hop_dong hd on nv.id_nhan_vien=hd.id_nhan_vien
group by nv.id_nhan_vien;
select *,count(hd.id_hop_dong) from nhan_vien nv
left join hop_dong hd on hd.id_nhan_vien=nv.id_nhan_vien
group by nv.id_nhan_vien;
/* Task 17 Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
 chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.*/
 -- update khach_hang kh
-- join loai_khach lk on lk.id_khach_hang = kh.id_khach_hang;

 
/* Task 18 Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng). */

/* Task 19 Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.*/

/* Task 20 Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
 thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang),
 HoTen, Email, SoDienThoai, NgaySinh, DiaChi.*/
 
 select nv.id_nhan_vien,nv.ho_ten as ten_nhan_vien,nv.sdt as sdt_nhan_vien, nv.ngay_sinh as ngay_sinh_nhan_vien,
 nv.dia_chi as dia_chi_nhan_vien,kh.id_khach_hang,kh.ho_ten_khach,kh.email,kh.sdt as asdt_khach,
 kh.ngay_sinh as ngay_sinh_khach, kh.dia_chi as dia_chi_khach from nhan_vien nv
 left join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
 left join khach_hang kh on hd.id_khach_hang=kh.id_khach_hang
 group by nv.id_nhan_vien
 union
 select nv.id_nhan_vien,nv.ho_ten as ten_nhan_vien,nv.sdt as sdt_nhan_vien, nv.ngay_sinh as ngay_sinh_nhan_vien,
 nv.dia_chi as dia_chi_nhan_vien,kh.id_khach_hang,kh.ho_ten_khach,kh.email,kh.sdt as asdt_khach,
 kh.ngay_sinh as ngay_sinh_khach, kh.dia_chi as dia_chi_khach from nhan_vien nv
 right join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
 right join khach_hang kh on hd.id_khach_hang=kh.id_khach_hang
 group by kh.id_khach_hang;
 select* from khach_hang;
/* Task 21 Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”*/
create or replace view v_nhan_vien as
select nv.id_nhan_vien, nv.ho_ten,nv.ngay_sinh,nv.dia_chi,hd.ngay_lap_hop_dong from nhan_vien nv
join hop_dong hd on nv.id_nhan_vien=hd.id_nhan_vien
where nv.dia_chi='Hải Châu'and hd.ngay_lap_hop_dong='2019-12-12';

/* Task 22 Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu”
 đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.*/
 update v_nhan_vien
 set dia_chi='Liên Chiểu';

/* Task 23 Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
 Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX*/
ALTER TABLE khach_hang ADD INDEX ix_khach_hang(id_khach_hang);
explain select* from khach_hang
where id_khach_hang=2;

/* Task 24 Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI trên bảng KHACH HANG 
và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.*/

ALTER TABLE khach_hang ADD INDEX ix_so_dien_thoai_dia_chi(sdt,dia_chi);
explain select* from khach_hang
where sdt=993123234;
select * from khach_hang
where sdt =993123234;

/* Task 25 Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó 
với Id Khách hàng được truyền vào như là 1 tham số của Sp_1*/
Delimiter //
Create Procedure SP_1(id int)
    BEGIN
    delete from khach_hang 
    where id_khach_hang=id ;
    END//
DELIMITER ;
call SP_1('2');
select* from khach_hang;
/* Task 26 Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong 
với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
 với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.*/
 Delimiter //
Create Procedure SP_2(id_nhan_vien int ,id_khach_hang int ,id_dich_vu int ,ngay_lap_hop_dong date,ngay_ket_thuc date ,tien_dat_coc double)
    BEGIN
    insert into hop_dong (id_nhan_vien ,id_khach_hang ,id_dich_vu,ngay_lap_hop_dong,ngay_ket_thuc,tien_dat_coc) 
    values (id_nhan_vien ,id_khach_hang ,id_dich_vu,ngay_lap_hop_dong,ngay_ket_thuc,tien_dat_coc) ;
    END//
DELIMITER ;
call sp_2(1,5,4,'2019-02-13','2020-06-09',8889990);
select* from hop_dong;
/* Task 27 Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì 
hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database*/
delimiter //
CREATE TRIGGER Tr_1
AFTER DELETE
ON hop_dong FOR EACH ROW 
BEGIN
	select count(id_hop_dong) as so_luong_hop_dong_con_lai
    from hop_dong ;
END //
delimiter ;
select count(id_hop_dong) as so_luong_hop_dong_con_lai
from hop_dong ;
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

  
  

 
 



