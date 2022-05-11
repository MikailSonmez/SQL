/*======================= CONSTRAINTS - KISITLAMALAR ======================================
           
    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
    UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)
    FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 
                  foreign ve primary ile tablolar birbirine bağlamadan da,
                  id leri ayni olan satirlarda işlem yap diyebiliriz, böylelikle
                  ayni field verilebilir, parent child ilişkisi olmamiş olur
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir şartı sağlamasını garanti eder. 
    DEFAULT - Herhangi bir değer atanamadığında Başlangıç değerinin atanmasını sağlar.
 ========================================================================================*/
create table calisanlar
(
id char(5) primary key, -- not null + unique
isim varchar(50) unique,
maas int not null,
ise_baslama date
);
INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', null, 5000, '2018-04-14');-- 2. kez null benzersizlik kisitlamasini bozmaz
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- maas null olamaz
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- can zaten var
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- '' bunu int kabul etmez
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');-- '' bunu (hiçlik) string kabul eder
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- id tekrarl olamaz primary key 
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');-- primary key old. null yazamayz

select*from calisanlar;

CREATE TABLE adresler
    (
        adres_id CHAR(5),     -- REFERENCES calisanlar(id),
        sokak VARCHAR (50),
        cadde VARCHAR (30),
        sehir VARCHAR (15),
        CONSTRAINT id_clsnlar FOREIGN KEY(adres_id) REFERENCES calisanlar(id) -- id_clsnlar ile calisanlardan id lerle bagladim demek.
    );
    
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Aga Sok', '30.Cad.','Antep');
-- parent tabloda olmayan id ile child'a ekleme yapamayiz

-- FK'ye null degeri atanabilir
INSERT INTO adresler VALUES('','Aga Sok', '30.Cad.','Antep');

select*from adresler;
-- baglantili tablolarda child silinmeden parent silinmez
drop table calisanlar;
drop table adresler;

/*============================== ON DELETE CASCADE =============================
  Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliğini aktif hale getirebiliriz.
  
  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 

use sys;
CREATE TABLE talebeler
    (
        id CHAR(3) primary key,  
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

     CREATE TABLE notlar 
    ( 
        talebe_id char(3), 
        ders_adi varchar(30), 
        yazili_notu int, 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE); -- on delete cascade sayesinde
       -- parent taki silinen bir kayıt ile ilişkili olan tüm child kayıtlarını
       -- siler.  
       -- mesela bir hastane silindi o hastanedeki bütün kayıtlar silinmeli, oda böyle olur.
       -- cascade yoksa önce child temizlenir sonra parent
    

    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);
    
-- FK ile birleştirilen tablolardaki tüm verileri çekmek için 
    -- JOIN İşlemi yapmak gerekir. Bu konuyu sonra göreceğiz.
    SELECT * FROM talebeler, notlar WHERE talebeler.id = notlar.talebe_id;
    
drop table talebeler;
drop table notlar;
drop table talebeler;
      
select * from talebeler;
select * from notlar;

DELETE FROM talebeler WHERE id = '124';
DELETE FROM notlar where talebe_id='123';-- child

