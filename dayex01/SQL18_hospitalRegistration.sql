use sys;
-- Table 1
create table hastaneler (
ID varchar(5) primary key,
ISIM varchar(50),
SEHIR varchar(30),
OZEL char(1)
);

insert into hastaneler values ('H101', 'ACI MADEM HASTANESI', 'ISTANBUL', 'Y');
insert into hastaneler values ('H102', 'HASZEKI HASTANESI', 'ISTANBUL', 'N');
insert into hastaneler values ('H103', 'MEDIKOL HASTANESI', 'IZMIR', 'Y');
insert into hastaneler values ('H104', 'MEMORYIL HASTANESI', 'ANKARA', 'Y');

select * from hastaneler;

-- Table 2
create table hastalar(
KIMLIK_NO char(11) primary key,
ISIM varchar(30),
TESHIS varchar(40)
);

insert into hastalar values ('12345678901', 'Ali Can', 'Gizli Seker');
insert into hastalar values ('45678901121', 'Ayse Yilmaz', 'Hipertansiyon');
insert into hastalar values ('78901123451', 'Steve Job', 'Pankreatit');
insert into hastalar values ('12344321251', 'Tom Hanks', 'COVID19');
select * from hastalar;

-- Table 3
create table bolumler(
BOLUM_ID varchar(10) primary key,
BOLUM_ADI varchar(45)
);

insert into bolumler values('DHL', 'Dahiliye');
insert into bolumler values('KBB', 'Kulak-Burun-Bogaz');
insert into bolumler values('NRJ', 'Noroloji');
insert into bolumler values('GAST', 'Gastroloji');
insert into bolumler values('KARD', 'Kardioloji');
insert into bolumler values('PSK', 'Psikiyatri');
insert into bolumler values('GOZ', 'Goz Hastaliklari');
select * from bolumler;

create table hasta_kayitlar (
KIMLIK_NO varchar(20) primary key,
HAST_ISIM varchar(30),
HASTANE_ADI varchar(30),
BOLUM_ADI varchar(30),
TESHIS varchar(30)
);

insert into hasta_kayitlar values('1111', '	NONAME', null, null, null);
insert into hasta_kayitlar values('2222', '	NONAME', null, null, null);
insert into hasta_kayitlar values('3333', '	NONAME', null, null, null);
select * from hasta_kayitlar;

update hasta_kayitlar
set KIMLIK_NO='99991111222', HAST_ISIM='Salvadore Dali', HASTANE_ADI='John Hopins', BOLUM_ADI='Noroloji', TESHIS='Parkinson'
where KIMLIK_NO='3333';

update hasta_kayitlar
set KIMLIK_NO=( select KIMLIK_NO from hastalar where ISIM= 'Ali Can'), 
	HAST_ISIM=( select ISIM from hastalar where ISIM= 'Ali Can'), 
	HASTANE_ADI=( select ISIM from hastaneler where ID= 'H104'), 
	BOLUM_ADI=( select BOLUM_ADI from bolumler where BOLUM_ID= 'DHL'), 
	TESHIS=( select TESHIS from hastalar where ISIM= 'Ali Can')
where KIMLIK_NO='1111';

update hasta_kayitlar
set KIMLIK_NO=( select KIMLIK_NO from hastalar where ISIM= 'Steve Job'), 
	HAST_ISIM=( select ISIM from hastalar where ISIM= 'Ayse Yilmaz'), 
	HASTANE_ADI=( select ISIM from hastaneler where ID= 'H103'), 
	BOLUM_ADI=( select BOLUM_ADI from bolumler where BOLUM_ID= 'KBB'), 
	TESHIS=( select TESHIS from hastalar where ISIM= 'Tom Hanks')
where KIMLIK_NO='2222';