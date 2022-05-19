use sys;
CREATE TABLE calisanlar
(
id CHAR(4),
isim VARCHAR(50),
maas int,
CONSTRAINT id_pk PRIMARY KEY (id)
);
INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
INSERT INTO calisanlar VALUES('1002', 'Mehmet Yılmaz' ,12000);
INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);
select * from calisanlar;

CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int,
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);
INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500);
INSERT INTO aileler VALUES('1003', 1, 2200);
INSERT INTO aileler VALUES('1004', 3, 2400);

select * from aileler;
-- 2 soru
update calisanlar
set maas=(maas*1.2)
where isim='Veli Han';

-- 3 soru
update calisanlar
set maas=(maas*1.2)
-- where maas < (select avg(maas) from calisanlar); -- olmadı????
where maas < (select avg(maas) from (select maas from calisanlar ) yeniIsim);

-- 4 soru
select isim,cocuk_sayisi
from calisanlar, aileler
where calisanlar.id = aileler.id;

-- 5 soru
select id, isim, (maas + ( select ek_gelir from aileler where calisanlar.id = aileler.id )) as toplam_gelir
from calisanlar;

-- 6 soru

update calisanlar
set maas = (maas*1.1)
 where 2000>(maas+(select ek_gelir from aileler where calisanlar.id=aileler.id))/((select cocuk_sayisi from aileler where calisanlar.id = aileler.id)+2);

select id, isim, maas
from calisanlar;