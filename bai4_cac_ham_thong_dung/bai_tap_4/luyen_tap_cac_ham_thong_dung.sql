use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *,max(credit) from subject;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *, max(mark) from mark;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
