create database akademika

show akademika;

use akademika;

drop schema akademika;

create table fakultas(
ID_FAKULTAS smallint not null primary key,
FAKULTAS varchar(45) not null
)

create table jurusan(
ID_JURUSAN smallint not null primary key,
ID_FAKULTAS smallint,
JURUSAN varchar(45) not null,
foreign key (ID_FAKULTAS) references FAKULTAS (ID_FAKULTAS)
)

create table STRATA(
ID_STRATA smallint not null primary key,
SINGKAT VARCHAR(10) not null,
STRATA VARCHAR(45) not null
)

create table PROGRAM_STUDI(
ID_PROGRAM_STUDI smallint not null primary key,
ID_STRATA smallint,
ID_JURUSAN smallint,
foreign key (ID_JURUSAN) references JURUSAN(ID_JURUSAN),
foreign key (ID_STRATA) references STRATA(ID_STRATA),
PROGRAM_STUDI VARCHAR(60) not null 
)

create table SELEKSI_MASUK(
ID_SELEKSI_MASUK smallint not null primary key,
SINGKAT VARCHAR(12),
SELEKSI_MASUK VARCHAR(45)
)

create table MAHASISWA(
NIM VARCHAR(15)not null primary key,
ID_SELEKSI_MASUK smallint,
ID_PROGRAM_STUDI smallint,
NAMA VARCHAR(45) not null,
ANGKATAN smallint not null,
TGL_LAHIR DATE not null,
KOTA_LAHIR VARCHAR(60),
JENIS_KELAMIN CHAR(1) check (JENIS_KELAMIN in ('P', 'L')),
foreign key (ID_SELEKSI_MASUK) references SELEKSI_MASUK(ID_SELEKSI_MASUK),
foreign key (ID_PROGRAM_STUDI) references PROGRAM_STUDI(ID_PROGRAM_STUDI)
)

insert into FAKULTAS (ID_FAKULTAS, FAKULTAS)
values 
(1, 'EKONOMI & BISNIS'),
(2, 'ILMU KOMPUTER');

insert into JURUSAN (ID_JURUSAN,ID_FAKULTAS, JURUSAN)
values
(21, 2, 'INFORMATIKA'),
(22, 2, 'SISTEM INFORMASI'),
(23, 2, 'TEKNIK KOMPUTER');

insert into STRATA(ID_STRATA, SINGKAT, STRATA)
values
(1, 'D1' , 'Diploma'),
(2, 'S1' , 'Sarjana'),
(3, 'S2' , 'Magister');

insert into PROGRAM_STUDI (ID_PROGRAM_STUDI, ID_STRATA, ID_JURUSAN, PROGRAM_STUDI)
values
(211, 2, 21, 'TEKNIK INFORMATIKA'),
(212, 2, 21, 'TEKNIK KOMPUTER'),
(219, 3, 21, 'MAGISTER ILMU KOMPUTER');

insert into SELEKSI_MASUK (ID_SELEKSI_MASUK, SINGKAT, SELEKSI_MASUK)
values
(1, 'SNMPTN', 'SELEKSI NASIONAL MAHASISWA PERGURUAN TINGGI'),
(2, 'SBMPTN', 'SELEKSI BERSAMA MAHASISWA PERGURUAN TINGGI');


insert into MAHASISWA(NIM, ID_SELEKSI_MASUK, ID_PROGRAM_STUDI, NAMA, ANGKATAN, TGL_LAHIR, KOTA_LAHIR, JENIS_KELAMIN)
values
('155150400', 1, 211, 'JONI', 2015, 1/1/1997, 'MALANG', 'P'),
('155150401', 2, 212, 'JONO', 2015, 2/10/1997, 'SITUBONDO', 'L');

select * from JURUSAN
select * from FAKULTAS
select * from STRATA 
select * from PROGRAM_STUDI
select * from SELEKSI_MASUK 
select * from MAHASISWA


