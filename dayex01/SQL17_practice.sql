use sys;
create table kitap
(
idno int PRIMARY KEY,
yazarno int not null,
turno int not null,
sayfasayisi int not null DEFAULT 0
);

DROP TABLE kitap;

INSERT INTO kitap VALUES (1,26,3,368);
INSERT INTO kitap VALUES (2,6,1,220);
INSERT INTO kitap VALUES (3,18,6,311);
INSERT INTO kitap VALUES (4,22,4,135);
INSERT INTO kitap VALUES (5,10,3,179);
INSERT INTO kitap VALUES (6,25,1,242);
INSERT INTO kitap VALUES (7,22,3,346);
INSERT INTO kitap VALUES (8,28,6,389);
INSERT INTO kitap VALUES (9,6,4,259);
INSERT INTO kitap VALUES (10,27,2,391);
INSERT INTO kitap VALUES (11,19,6,89);
INSERT INTO kitap VALUES (12,6,4,265);
INSERT INTO kitap VALUES (13,20,6,160);
INSERT INTO kitap VALUES (14,27,5,383);
INSERT INTO kitap VALUES (15,5,6,188);

create table islemler
(
turno int PRIMARY KEY,
kitap_turu varchar(10) NOT NULL
);

INSERT INTO islemler VALUES (1,'Dram');
INSERT INTO islemler VALUES (2,'Komedi');
INSERT INTO islemler VALUES (3,'Roman');
INSERT INTO islemler VALUES (4,'Hikaye');
INSERT INTO islemler VALUES (5,'Arastirma');
INSERT INTO islemler VALUES (6,'Fikra');
INSERT INTO islemler VALUES (7,'Deneme');

create table ogrenci
(
ogrno int PRIMARY KEY,
ograd VARCHAR(10) NOT NULL,
ogrsoyad VARCHAR(10) NOT NULL,
cinsiyet VARCHAR(1) NOT NULL,
sinif VARCHAR(3) DEFAULT''
);

INSERT INTO ogrenci VALUES (1,'ahmet','cansever','e','10a');
INSERT INTO ogrenci VALUES (2,'niyazi','sevinc','e','11b');
INSERT INTO ogrenci VALUES (3,'ismail ','sevinc','e','10b');
INSERT INTO ogrenci VALUES (4,'kenan','emin','e','9a');
INSERT INTO ogrenci VALUES (5,'sema','bakir','k','9b');
INSERT INTO ogrenci VALUES (6,'beyda','kara','k','9c');
INSERT INTO ogrenci VALUES (7,'betül','coskun','k','11a');
INSERT INTO ogrenci VALUES (8,'sema','rüzgar','k','9c');
INSERT INTO ogrenci VALUES (9,'fadime','dönmez','k','9a');
INSERT INTO ogrenci VALUES (10,'riza','koc','e','10b');
INSERT INTO ogrenci VALUES (11,'beyza','kabak','k','10b');
INSERT INTO ogrenci VALUES (12,'deniz','akcakaya','e','11a');
INSERT INTO ogrenci VALUES (13,'kemal','karapinar','e','11a');
INSERT INTO ogrenci VALUES (14,'derya','yilbur','k','10c');
INSERT INTO ogrenci VALUES (15,'filiz','akat','k','10a');
INSERT INTO ogrenci VALUES (16,'niyazi','dönmez','e','11a');
INSERT INTO ogrenci VALUES (17,'sema','sekmen','k','10b');

select * from kitap;
select * from islemler;
select * from ogrenci;

-- ------Örnek 1: Hangi isimden kaç tane olduğunu bulun.
select ograd,count(*) from ogrenci
group by ograd;

-- ------ Örnek 2: Sınıflardaki öğrenci sayısını bulun
select sinif, count(*) from ogrenci
group by sinif;
-- ------ Örnek 3: Her sınıftaki erkek ve kız öğrenci sayısını bulun.(cinsiyet ve sinifa göre grupla)
select sinif, cinsiyet, count(*) as 'sayi' from ogrenci
group by cinsiyet, sinif;
-- ------ Örnek 4: Her türden kaç tane kitap olduğunu listeleyiniz.
select turno, count(idno) from kitap
group by turno;
-- ------ Örnek 5: Her türdeki en fazla sayfa sayısı olan kitapları listeleyiniz.
select turno, max(sayfasayisi) from kitap
group by turno;
-------- Örnek 6: Her türdeki en az sayfa sayısı olan kitapları listeleyiniz.
select turno, min(sayfasayisi) from kitap
group by turno;
-------- Örnek 7***: Her türden kaç tane kitap olduğunu listeleyiniz.(Tür isimleri de olsun)
select kitap_turu, (select count(turno) from kitap where islemler.turno=kitap.turno) as adet_sayisi
from islemler
group by kitap_turu;
