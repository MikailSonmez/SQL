use sys;

/*============================= GROUP BY =====================================
    
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar(50), 
        urun_adi varchar(50), 
        urun_miktari int 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', null, 2);
select * from manav;
/* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu 
  yazınız.
------------------------------------------------------------------------------*/ 
select isim, sum(urun_miktari) as toplam_urun
from manav    
group by isim;    
    
/* ----------------------------------------------------------------------------
  ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
select urun_adi, count(isim) as urun_alan
from manav 
where urun_adi is not null   
group by urun_adi;    

-- group by ile where kelimesi de kullanilabilir

/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
  MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu 
  yazınız.
-----------------------------------------------------------------------------*/ 
select urun_adi, min(urun_miktari) min, max(urun_miktari) max
from manav 
where urun_adi is not null
group by urun_adi
order by max;   

/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/
select isim,urun_adi, sum(urun_miktari)
from manav 
group by isim,urun_adi
order by isim desc; 

/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adına göre (gruplayarak) satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/
select isim, urun_adi, sum(urun_miktari)
from manav
group by isim, urun_adi
having sum(urun_miktari) >= 3         -- aggregate'ler bazen koşulda sıkıntı çıkıyor, onun için where'in daha gelişmiş hali var 'having',  onu kullanabiliriz
order by sum(urun_miktari) desc;
-- aggregate fonksiyonlari ile ilgili bir koşul koymak için
 -- group by dan sonra having cümleciği kullanilir.
 
  /* ----------------------------------------------------------------------------
  ORNEK6: satılan urun_adi'na göre (gruplayarak) MAX urun sayılarını sıralayarak listeleyen 
  sorguyu yazınız. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarına 
  eşit olmayan kayıtları listelemelidir.
 -----------------------------------------------------------------------------*/
select urun_adi, max(urun_miktari) as maxT
from  manav
group by urun_adi
having maxT!= min(urun_miktari)  -- != yerine <> kullanilabilir
order by maxT;
-- siralam: group by, having, order by

/*============================= DISTINCT =====================================
    
    DISTINCT cümleciği bir SORGU ifadesinde benzer olan satırları filtrelemek
    için kullanılır. Dolayısıyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satırlar oluşturmaya yarar.
   
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, sutun_adi3
    FROM  tablo_adı;
==============================================================================*/

/* ----------------------------------------------------------------------------
  ORNEK1: satılan farklı meyve türlerinin sayısını listeleyen sorguyu yazınız.
-----------------------------------------------------------------------------*/ 
select count(distinct urun_adi) as meyveCesidi
from manav;
    
/* -----------------------------------------------------------------------------
  ORNEK2: satılan meyve + isimlerin farklı olanlarını listeyen sorguyu yazınız.
------------------------------------------------------------------------------*/
select distinct urun_adi, isim
from manav;   

/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyvelerin urun_mikarlarinin benzersiz  olanlarının 
  toplamlarini listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/
select sum(distinct urun_miktari) as toplam
from manav;    
