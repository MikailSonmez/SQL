-- ================= SELECT-WHERE============
create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

INSERT INTO ogrenciler values(123,'Ali Can','Ankara', 75);
INSERT INTO ogrenciler values(124,'Merve Gul','Ankara',85);
INSERT INTO ogrenciler values(125,'Kemal Yasa','Ankara', 85);

select* from ogrenciler;
/*============================
Verileri select komutu ile veritabanindan cekerken filtreme yapmak icin
Syntax
-----------
Select ile birlikte where komutu kullanilabilir
select sutun1, sutun2
...
from tablo_adi where kosul;
=============================*/
/*-----------------------------------
ornek1: sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listele
------------------------------------*/
select * from ogrenciler where sinav_notu>80;
/*-----------------------------------
ornek2: adresi ankara olan ogrencilerin isim ve adres bilgilerini listele
------------------------------------*/
select isim,adres from ogrenciler where adres='Ankara';
/*-----------------------------------
ornek2: id'si 124 olan ogrencilerin tum bilgilerini listele
------------------------------------*/
select*from ogrenciler where id=124;

-- ================= SELECT-BETWEEN============
create table personel(
id char(5),
isim varchar(50),
maas int
);

INSERT INTO personel values('10001','Ahmet Aslan',7000);
INSERT INTO personel values('10002','Mehmet Yilmaz',12000);
INSERT INTO personel values('10003','Meryem Hey Yasa',7215);
INSERT INTO personel values('10004','Veli Han',5000);
INSERT INTO personel values('10005','Mustafa Ali',5500);
INSERT INTO personel values('10006','Ayse Can',4000);

-- not: BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme imkani verir.
-- yazdigimiz 2 sinir'da araliga dahildir.
/*===========================================================================
 =======And (Ve) Operatörü Kullanımı=======
And ile belirtilen şartların tamamı gerçekleşiyorsa o kayıt listelenir, şartlardan
bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu örnekte hem sınav1 hem de sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
=====Or (Veya) Operatörü Kullanımı=====
Or ile belirtilen şartlardan en az biri gerçekleşiyorsa o kayıt listelenir,
şartlardan hiçbiri gerçekleşmiyorsa o kayıt listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu örnekte sınav1 veya sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
========================================================================================*/
-- first path
select * from personel where id between '10002' and '10005';
-- second path
select * from personel where id>='10002' and id <='10005';
/* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
SELECT * FROM  personel
WHERE isim BETWEEN 'Mehmet Yilmaz' AND 'Veli Han';

/* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
    -- 1.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id = 10001 OR id = 10002 OR id = 10004;
    
     -- 2.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id IN(10001, 10002, 10004); 
/* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  ve 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
 /* -----------------------------------------------------------------------------
  ORNEK8_2: Maaşı sadece 7000  ve adi meryem  olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/  
-- dogru yazim 
SELECT * FROM personel
where maas=7000 or isim='Meryem Hey Yasa';
-- yanlis yazim
SELECT * FROM personel
where maas in(7000, 'meryem ');

/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adıWHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    % 	 ---> 0 veya daha fazla karakteri belirtir. 
    _  	 ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
/* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile başlayanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel
 where isim like  'a%';
 /* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel
 where isim like '_e%y%';
 /* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile başlamayanları listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';
/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';
 /* -----------------------------------------------------------------------------
  ORNEK16:  maaşının son 2 hanesi 00 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';
    /* -----------------------------------------------------------------------------
  ORNEK17:  maaşının 4000 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
 /* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
  /* -----------------------------------------------------------------------------
  ORNEK19: maaşının  5 haneli olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
    /* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    
    /*====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    
use sys;
CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
	INSERT INTO kelimeler VALUES (1015, 'hoooooooooooooot', 5);
    
    DROP TABLE kelimeler;
   

    
    
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
    -- VEYA işlemi için | karakteri kullanılır.
    select * from kelimeler
    where  REGEXP_LIKE (kelime, 'at|ot','c');
   
   
   
   
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
    
   select * from kelimeler
    where  REGEXP_LIKE (kelime, 'at|ot');
      
      
      
      
      
      
   
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır.
    
     SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho', 'i');  
    
    
    
    
    
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
     -- Bitişi göstermek için $ karakteri kullanılır.
SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 't$|m$', 'i');
    
    
    
    
    

/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 
 SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t','c');
    
    
    
    

/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t');
    
    
    
    
    
/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
  
  -- 1 . Yol
  SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mie]'); -- [m|i|e] de olur
   
   
   -- 2. Yol
  SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'm|i|e');
 
    
    
    
    
 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
  -- 1 . Way
  SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');
 -- 2. Way
  SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^a|^s');
 
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
	SELECT *  FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[o]{2}');
    
    select * from kelimeler
    where REGEXP_LIKE(kelime,'o[o]');
    
    
   select * from kelimeler
   where REGEXP_LIKE(kelime, '[o][o]');

   select *from kelimeler
where REGEXP_LIKE(kelime,'oo');


select * from kelimeler
    where regexp_like (kelime, '[o]..');

    


