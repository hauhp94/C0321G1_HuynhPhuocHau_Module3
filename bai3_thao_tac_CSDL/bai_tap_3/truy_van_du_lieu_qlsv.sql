use quanlysinhvien;
select * from student
where StudentName like 'h%';
select * from class
where month(StartDate)='12';
select * from subject
where Credit between 3 and 5;
update student
set ClassID = 2 where studentname='Hung';
select * from student;
select S.studentname, Sub.subname, M.mark
from student S join mark m on s.Studentid=m.studentid join subject sub on m.subid = sub.subid
order by mark desc;



