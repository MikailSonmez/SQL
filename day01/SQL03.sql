/*===================
	TABLE CREATE
==============================
*/
drop table student2;
use sys;
create table student2
(
	std_id varchar(4) ,
    std_name varchar(20),
    std_age int
);
/*===============================
		VERI GIRISI
=====================*/

INSERT INTO student2 values('1001','MEHMET ALI', 25);
INSERT INTO student2 values('1002','AYSE YILMAZ', 34);
INSERT INTO student2 values('1003','JOHN STAR', 56);
INSERT INTO student2 values('1004','MARY BROWN', 17);

select*from urunler;