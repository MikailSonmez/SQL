/*===================
	TABLE CREATE
==============================
*/
drop table student4;
use sys;
create table student4
(
	id varchar(4) ,
    name varchar(20),
    age int
);
/*===============================
		VERI GIRISI
=====================*/

INSERT INTO student4 values('1001','MEHMET ALI', 25);
INSERT INTO student4 values('1002','AYSE YILMAZ', 34);
INSERT INTO student4 values('1003','JOHN STAR', 56);
INSERT INTO student4 values('1004','MARY BROWN', 17);
/*===============================
		PARCALI VERI GIRISI
=================================*/

INSERT INTO student4(name, age) values('Samet ay',24);

/*===============================
		TABLODAN VERI SORGULAMA
=================================*/
select* from urunler;
/*===============================
		TABLO SILME (CRUD - Drop)
=================================*/

DROP TABLE urunler;



