CREATE DATABASE PHARMACY_DATABASE;





USE PHARMACY_DATABASE;





CREATE TABLE PHARMACY(
	ID				INT				NOT NULL	IDENTITY,
	PName			VARCHAR(30)		NOT NULL	UNIQUE,
	PLocation		VARCHAR(100)	UNIQUE,
	Phone_number	CHAR(10)		UNIQUE,

	PRIMARY KEY(ID)
);

CREATE TABLE CUSTOMER(
	SSN			CHAR(11)	NOT NULL,
	CName		VARCHAR(30)	NOT NULL,
	Birth_date	DATE,
	Gender		CHAR(1),

	PRIMARY KEY(SSN)
);

CREATE TABLE MEDICINE_COMPANY(
	ID		INT			NOT NULL	IDENTITY,
	MCName	VARCHAR(30) NOT NULL,

	PRIMARY KEY(ID)
);

CREATE TABLE MEDICINE(
	ID				INT			NOT NULL	IDENTITY,
	MName			VARCHAR(30)	NOT NULL,
	MType			VARCHAR(30)	NOT NULL,
	Amount			INT,
	Price_in_TL		FLOAT,
	Pharmacy_ID		INT,
	MC_ID			INT			NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY(Pharmacy_ID) REFERENCES PHARMACY(ID),
	FOREIGN KEY(MC_ID) REFERENCES MEDICINE_COMPANY(ID)
);

CREATE TABLE PRESCRIPTION(
	ID				INT				NOT NULL	IDENTITY,
	Hospital_name	VARCHAR(30),
	Doctor_name		VARCHAR(30),
	C_SSN			CHAR(11)		NOT NULL,
	Mecidine_ID		INT,

	PRIMARY KEY(ID),
	FOREIGN KEY(C_SSN) REFERENCES CUSTOMER(SSN),
	FOREIGN KEY(Mecidine_ID) REFERENCES MEDICINE(ID)
);

CREATE TABLE EMPLOYEE(
	ID						INT				NOT NULL	IDENTITY,
	EName					VARCHAR(30),
	Gender					CHAR(1),
	Phone_number			CHAR(10)		NOT NULL	UNIQUE,
	MC_ID					INT				NOT NULL,
	Leader_ID				INT,

	PRIMARY KEY(ID),
	FOREIGN KEY(MC_ID) REFERENCES MEDICINE_COMPANY(ID),
	FOREIGN KEY(Leader_ID) REFERENCES EMPLOYEE(ID)
);

CREATE TABLE PHARMACIST(
	SSN				CHAR(11)		NOT NULL,
	PName			VARCHAR(30),
	Birth_date		DATE,
	Gender			CHAR(1),
	Salary			FLOAT,
	Pharmacy_ID		INT				NOT NULL,
	Leader_SSN		CHAR(11),

	PRIMARY KEY(SSN),
	FOREIGN KEY(Pharmacy_ID) REFERENCES PHARMACY(ID),
	FOREIGN KEY(Leader_SSN) REFERENCES PHARMACIST(SSN)
);

CREATE TABLE BUYS_MEDICINE_FROM(
	ID					INT			NOT NULL	IDENTITY,
	C_SSN				CHAR(11)	NOT NULL,
	Pharmacy_ID			INT			NOT NULL,
	Medicine_ID			INT			NOT NULL,
	Buy_amount			INT			NOT NULL,
	Transaction_date	DATE		NOT NULL	DEFAULT GETDATE(),

	PRIMARY KEY(ID),
	FOREIGN KEY(C_SSN) REFERENCES CUSTOMER(SSN),
	FOREIGN KEY(Pharmacy_ID) REFERENCES PHARMACY(ID),
	FOREIGN KEY(Medicine_ID) REFERENCES MEDICINE(ID)
);

CREATE TABLE GETS_MEDICINE_FROM(
	ID					INT		NOT NULL	IDENTITY,
	MC_ID				INT		NOT NULL,
	Pharmacy_ID			INT		NOT NULL,
	Medicine_ID			INT		NOT NULL,
	Buy_amount			INT		NOT NULL,
	Transaction_date	DATE	NOT NULL	DEFAULT GETDATE(),

	PRIMARY KEY(ID),
	FOREIGN KEY(MC_ID) REFERENCES MEDICINE_COMPANY(ID),
	FOREIGN KEY(Pharmacy_ID) REFERENCES PHARMACY(ID)
);

CREATE TABLE MEDICINE_COMPANY_LOCATIONS(
	ID			INT				NOT NULL	IDENTITY,
	MC_ID		INT				NOT NULL,
	MC_location	VARCHAR(100)	NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY(MC_ID) REFERENCES MEDICINE_COMPANY(ID)
);

CREATE INDEX Pharmacy_Name_index
ON PHARMACY(PName);

CREATE INDEX MC_Name_index
ON MEDICINE_COMPANY(MCName);

CREATE INDEX Medicine_Name_and_Type_index
ON MEDICINE(MName, MType);

CREATE INDEX Pharmacist_Name_index
ON PHARMACIST(PName);

CREATE INDEX Employee_Name_index
ON EMPLOYEE(EName);





CREATE VIEW Buys_medicine_from_view AS
SELECT P.ID, P.PName, P.PLocation, P.Phone_number, C.SSN, B.Medicine_ID, B.Buy_amount
FROM PHARMACY AS P, CUSTOMER AS C, BUYS_MEDICINE_FROM AS B
WHERE B.Pharmacy_ID = P.ID AND B.C_SSN = C.SSN;





CREATE VIEW Gets_medicine_from_view AS
SELECT P.ID, P.PName, P.PLocation, P.Phone_number, MC.MCName, G.Transaction_date, G.Medicine_ID, G.Buy_amount
FROM PHARMACY AS P, MEDICINE_COMPANY AS MC, GETS_MEDICINE_FROM AS G
WHERE G.Pharmacy_ID = P.ID AND G.MC_ID = MC.ID;





INSERT INTO PHARMACY(Pname, Plocation, Phone_number)
VALUES
('Yeni Dostlar Eczanesi', 'Kocatepe, Meþrutiyet Cd. No:32/B, 06420 Çankaya/Ankara', '3124191593'),
('Özlem Eczanesi', 'Abdulhalik Renda, Candan Sitesi No:3, 18200 Çankýrý Merkez/Çankýrý', '3762121556'),
('Ulucanlar Eczanesi', 'Hacettepe, 06230 Altýndað/Ankara', '3123627106'),
('Elmas Eczanesi','Esentepe Mahallesi, Eðitimciler Caddesi No:50/A Tepebaþý / Eskiþehir','2223220208'),
('Bizim Eczanesi','Nefsipulathane Mahallesi, Bahçeli Sokak No:6/A Akçaabat / Trabzon','4622270996'),
('Lokman Eczanesi','Sancak Mahallesi, Trabzon Caddesi, No:21/B Yomra / Trabzon','4623413855'),
('Uygar Eczanesi','Fatih Mahallesi, Ali Rýza Ataktürk Caddesi, No:1 Merkez / Edirne','2842354212'),
('Özgür Eczanesi','Þükrüpaþa Mahallesi, Ahmet Yalçýn Sarýgöl Caddesi No:18/A Merkez / Edirne','2842148620'),
('Sezenler Eczanesi','Korkutreis Mahallesi, Sezenler Caddesi No:3/B Kýzýlay / Çankaya / Ankara','3122292906'),
('Ceren Eczanesi','Gazi Mahallesi, Baykal Sokak No:3AA Polatlý / Ankara','3126221906');





INSERT INTO PHARMACIST(SSN, Pname, Birth_date, Gender, Salary, Pharmacy_ID, Leader_SSN)
VALUES
('92374072367', 'Dost', '1995-11-02', 'M', 40000, 1, NULL),
('61264912934', 'Güven', '2004-07-12', 'M', 25000, 1, '92374072367'),
('83262349552', 'Özlem', '1974-06-28', 'F', 50000, 2, NULL),
('95398286521', 'Can', '1995-08-23', 'M', 42000, 3, NULL),
('37462837824', 'Mete', '1984-12-04', 'M', 27000, 3, '95398286521'),
('45752366236', 'Ela', '2000-11-07', 'F', 38000, 4, NULL),
('13942937462', 'Berna', '1968-01-11', 'F', 39000, 5, NULL),
('29425739841', 'Ömer', '1985-03-21', 'M', 48000, 6, NULL),
('38624582640', 'Elif', '1962-12-28', 'F', 55000, 7, NULL),
('68352714834', 'Mert', '2001-09-14', 'M', 28000, 7, '38624582640'),
('12456382690', 'Özgür','1978-11-21','M', 54000, 8, NULL),
('51327698651', 'Ali', '2002-05-09', 'M', 36000, 9, NULL),
('10264582501', 'Ceren', '1999-07-03', 'F', 32000, 10, NULL);





INSERT INTO CUSTOMER(SSN, CName, Birth_date, Gender)
VALUES
('87710327842', 'Mehmet', '1996-08-01', 'M'),
('65901127804', 'Suzan', '2020-03-04', 'F'),
('12469054299', 'Enes', '2000-09-05', 'M'),
('37655108973', 'Tuna', '1998-01-07', 'M'),
('42178963544', 'Nilay', '1988-07-03', 'F'),
('32932389509', 'Berke', '2002-12-02', 'M'),
('33188567945', 'Oðuz', '2019-04-23', 'M'),
('23879657601', 'Uður', '2001-09-13', 'M'),
('76981123427', 'Bilge', '2018-09-08', 'F'),
('10837293856', 'Tuana', '1993-04-15', 'F'),
('45367829084', 'Oðuz', '2006-01-21', 'M');





INSERT INTO MEDICINE_COMPANY(MCName)
VALUES
('Selçuk Ecza Deposu'),
('Nevzat Ecza Deposu'),
('Zirve Pharma Ecza Deposu'),
('Bursa Eczacýlar Kooperatifi'),
('Hedef Ecza Deposu'),
('Sancak Ezca Deposu'),
('Ýstanbul Ecza Koop'),
('DNA Ecza Deposu'),
('Ýnci Ecza Deposu'),
('Beturex Ecza Depsou');





INSERT INTO EMPLOYEE(EName, Gender, Phone_number, MC_ID, Leader_ID)
VALUES
('Hasan', 'M', '5320087456', 1, NULL),
('Hüseyin', 'M', '5308745632', 1, 1),
('Aliye', 'F', '5628453905', 2, NULL),
('Nida', 'F', '5384506297', 3, NULL),
('Nihan', 'F', '5126527885', 4, NULL),
('Jale', 'F', '5326587010', 5, NULL),
('Kerem', 'M', '5306502143', 6, NULL),
('Mehmet', 'M', '5328745692', 7, NULL),
('Yasin', 'M', '5411259087', 7, 8),
('Mustafa', 'M', '5336980204', 8, NULL),
('Eren', 'M', '5710256345', 9, NULL),
('Yunus', 'M', '5966541028', 10, NULL);





INSERT INTO MEDICINE(MName, MType, Amount, Price_in_TL, Pharmacy_ID, MC_ID)
VALUES
('A-FERIN FORTE' ,'tablet' ,12, 83.01, 1, 1),
('AUGMENTIN-BID 1000MG' ,'tablet' , 30 , 113.62, 2, 2), 
('AUGMENTIN-BID 400/57MG' ,'syrup' , 22 , 302.78, 3, 3),
('PAROL 500MG 20Tablet' ,'tablet' , 48, 57.25, 4, 4),
('PAROL PLUS' ,'syrup' , 15, 111.21, 5, 5),
('MADECASSOL' ,'cream' , 9, 312.24, 6, 6),
('DEPOSILIN 1.200.00 I.U.' ,'injection' , 3, 128.38, 7, 7),
('OZEMPIC 1MG' ,'injection' , 2, 7922.24, 8, 8),
('FITO' ,'cream' , 36, 163.43, 9, 9),
('RENNIE' ,'chewable tablet' , 27, 171.14, 10, 10),
('MAJEZIK 100MG', 'tablet', 38, 152.23, 10, 1);





INSERT INTO PRESCRIPTION(Hospital_name, Doctor_name, C_SSN, Mecidine_ID)
VALUES
('Acýbadem Hastanesi', 'Ali', '87710327842', 11),
('Acýbadem Hastanesi', 'Batuhan', '65901127804', 10),
('TOBB ETÜ Hastanesi', 'Ýhsan', '12469054299', 9),
('Ankara Onkoloji Hastanesi', 'Ayþegül', '37655108973', 8),
('Bayýndýr Hastanesi', 'Orhan', '42178963544', 7),
('Gazi Hastanesi', 'Polat', '32932389509', 6),
('Türkiye Hastanesi', 'Lale', '33188567945', 5),
('Ankara Bilkent Hastanesi', 'Vefa', '23879657601', 4),
('Medisun Hastanesi', 'Belinay', '76981123427',3),
('Medisun Hastanesi', 'Hayat', '10837293856',2),
('Medical Park Ankara Hastanesi', 'Ulaç', '10837293856',1),
('Güven Hastanesi', 'Zehra', '45367829084',7),
('Bilgi Hastanesi', 'Numan', '87710327842',10),
('Ankara Magnet Hastanesi', 'Metehan', '65901127804', 5),
('Sincan Hastanesi', 'Mert', '12469054299', 9),
('Sincan Hastanesi', 'Selin', '37655108973', 11),
('Çankýrý Devlet Hastanesi', 'Delfi', '42178963544',2),
('Karatekin Hastanesi', 'Cem', '32932389509', 8),
('Erciyes Kartal Hastanesi', 'Yasin', '33188567945', 6);





INSERT INTO BUYS_MEDICINE_FROM(C_SSN, Pharmacy_ID, Medicine_ID, Buy_amount, Transaction_date)
VALUES
('87710327842', 1, 2, 1, '2024-12-12'),
('65901127804',	2, 8, 3, '2023-02-22'),
('65901127804',	3, 1, 2, '2024-01-13'),
('12469054299',	4, 6, 4, '2025-05-23'),
('37655108973',	5, 4, 1, '2022-02-15'),
('42178963544', 6, 2, 2, '2024-01-07'),
('32932389509', 7, 11, 5, '2025-09-05'),
('33188567945', 8, 10, 1, '2023-08-07'),
('33188567945', 8, 3, 3, '2021-03-01'),
('23879657601', 9, 5, 1, '2022-12-23'),
('76981123427', 10, 2, 2, '2024-04-14'),
('10837293856', 10, 9, 2, '2025-02-15'),
('45367829084', 1, 7, 1, '2023-11-27');





INSERT INTO GETS_MEDICINE_FROM(MC_ID, Pharmacy_ID, Medicine_ID, Buy_amount, Transaction_date)
VALUES
(1, 1, 4, 78, '2023-11-05'),
(2, 2, 5, 54, '2023-04-12'),
(3, 3, 3, 100, '2024-02-24'),
(4,	4, 2, 99, '2025-03-04'),
(5,	5, 1, 47, '2022-06-13'),
(6, 6, 6, 23, '2024-12-04'),
(7, 7, 9, 52, '2025-03-06'),
(8, 8, 8, 78, '2024-08-05'),
(9, 9, 10, 59, '2020-04-06'),
(10, 10, 7, 46, '2023-12-27'),
(10, 10, 11, 23, '2023-11-26');





INSERT INTO MEDICINE_COMPANY_LOCATIONS(MC_ID, MC_location)
VALUES
(1, 'Ankara/Yenimahalle'),
(1, 'Ýstanbul/Esenyurt'),
(2, 'Bursa/Nilüfer'),
(2, 'Ankara/Balgat'),
(3, 'Konya/Selçuklu'),
(3, 'Kýrýkkale/Merkez'),
(4, 'Bursa/Osmangazi'),
(5, 'Ankara/Çubuk'),
(5, 'Ankara/Yenimahalle'),
(6, 'Ankara/Etimesgut'),
(7, 'Ýstanbul/Beþiktaþ'),
(8, 'Ýstanbul/Ümraniye'),
(9, 'Ýstanbul/Baðcýlar'),
(10, 'Ýstanbul/Levent');
