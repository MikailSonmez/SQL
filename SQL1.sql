/*===============================
	TABLO OLUSTURMA (CRUD- create)
=================================*/
use sys;
create table student
(id varchar(4),
name varchar(25),
age int
);
insert into student values('1001', 'MEHMET ALI', 25);
insert into student values('1002', 'AYSE YILMAZ', 34);
insert into student values('1003', 'JOHN STAR', 56);
insert into student values('1004', 'MARY BROWN', 17);

select * from student;