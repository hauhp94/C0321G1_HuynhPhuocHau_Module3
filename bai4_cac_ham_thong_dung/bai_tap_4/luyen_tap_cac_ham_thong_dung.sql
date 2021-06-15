use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject
where Credit = (select max(Credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject
join mark on subject.SubId = mark.SubId
where mark = (select max(mark) from mark) 
group by mark;

select subject.SubID,subject.SubName,subject.Credit,subject.Status,Mark.Mark,Mark.StudentID
from subject
inner join mark on subject.SubID = Mark.SubID
where Mark = (select max(mark) from mark);

select * from subject;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select*  from student, mark
join mark on diem_trung_binh = (select avg(mark) from mark)
group by StudentId
order by diem_trung_binh desc;
select*, diem_trung_binh from student; 
select* from mark;
select*, avg(mark) as diem_trung_binh  from student
join mark on student.diem_trung_binh = mark.StudentId
group by student.StudentId,student.StudentName
order by avg(mark) desc;

SELECT S.StudentId,S.StudentName, AVG(Mark) as "diemTrungBinh"
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
order by avg(mark) desc;


select s.studentid,s.StudentName, avg(mark) as diem_trung_binh from student s
join mark m on s.StudentId=m.StudentId
group by s.StudentId,s.StudentName
order by diem_trung_binh desc; 



