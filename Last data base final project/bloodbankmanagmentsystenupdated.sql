Create database blood_bank_management_system;
use blood_bank_management_system;
CREATE TABLE Donors (
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    BloodType VARCHAR(5),
    Phone VARCHAR(15),
    Address VARCHAR(20)
);
select * from Donors;
INSERT INTO Donors (DonorID, Name, Age, BloodType, Phone, Address) VALUES
(1, 'Kantesh', 35, 'A+', '03217688991', 'Numaish,karachi'),
(2, 'Kamran', 28, 'B-', '03216655890', 'Lahore'),
(3, 'Imran', 42, 'O+', '03105558765', 'Peshawar'),
(4, 'Abdullah', 31, 'AB+', '03335554321', 'Lahore'),
(5, 'Sami', 50, 'A-', '03225559876', 'Multan');
SELECT * FROM Donors
WHERE Age > 30;
SELECT BloodType, COUNT(*) AS NumberOfDonors
FROM Donors
GROUP BY BloodType;
SELECT SUM(Age) AS TotalAge
FROM Donors;
SELECT BloodType, AVG(Age) AS AverageAge
FROM Donors
GROUP BY BloodType;
SELECT BloodType, COUNT(*) AS NumberOfDonors
FROM Donors
GROUP BY BloodType
HAVING COUNT(*) > 1;

CREATE TABLE Recipients (
    RecipientID INT PRIMARY KEY,
    Name VARCHAR(20),
    Age INT,
    BloodType VARCHAR(5),
    Phone VARCHAR(15),
    Address VARCHAR(50)
);
SELECT * from Recipients ;
INSERT INTO Recipients (RecipientID, Name, Age, BloodType, Phone, Address) VALUES
(1, 'kantesh kumar', 34, 'O+', '03177744168', 'sukkur'),
(2, 'Jane ', 28, 'A-', '083877737637', 'karachi'),
(3, 'jan', 45, 'B+', '03123456789', 'samshabad'),
(4, 'zan', 52, 'AB+', '03178965432', 'kasmabad'),
(5, 'ahmed', 60, 'O-', '03123456789', 'peshawar');
SELECT * FROM Recipients WHERE BloodType = 'O+';
UPDATE Recipients
SET Address = 'Hyderabad'
WHERE RecipientID = 3;
SELECT * FROM Recipients WHERE Age > 40;
SELECT SUM(Age) AS TotalAge
FROM Recipients ;
SELECT * FROM Recipients 
WHERE Age > 30;

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    DonorID INT,
    RecipientID INT,
    DonationDate DATE,
    ExpiryDate DATE,
    Quantity_ml INT,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID),
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID)
);
select * from Donations;
INSERT INTO Donations (DonationID, DonorID, RecipientID, DonationDate, ExpiryDate, Quantity_ml) VALUES
(1, 1, 1, '2024-01-15', '2024-07-15', 500),
(2, 2, 2, '2024-02-20', '2024-08-20', 450),
(3, 3, 3, '2024-03-25', '2024-09-25', 400),
(4, 4, 4, '2024-04-30', '2024-10-30', 550),
(5, 5, 5, '2024-05-05', '2024-11-05', 480);
SELECT * FROM Donations
WHERE ExpiryDate > '2024-09-01';
SELECT SUM(Quantity_ml) AS TotalQuantity FROM Donations;
SELECT COUNT(*) AS TotalDonations FROM Donations;
SELECT * FROM Donations;
SELECT * FROM Donations
WHERE DonorID = 20;
SELECT BloodType FROM BloodTypes
WHERE BloodTypeID = 3;

CREATE TABLE BloodTypes (
    BloodTypeID INT PRIMARY KEY,
    BloodType VARCHAR(5) UNIQUE
);
select * from Bloodtypes;
INSERT INTO BloodTypes (BloodTypeID, BloodType) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'O+');
SELECT BloodType FROM BloodTypes
WHERE BloodTypeID = 4;
SELECT COUNT(*) AS TotalBloodTypes FROM BloodTypes;
SELECT * FROM BloodTypes
WHERE BloodType = 'B+';
SELECT * FROM BloodTypes;
SELECT BloodType FROM BloodTypes
WHERE BloodTypeID = 5;

CREATE TABLE BloodInventory (
    BloodID INT PRIMARY KEY,
    BloodType VARCHAR(5),
    Quantity_ml INT,
    ExpiryDate DATE,
    FOREIGN KEY (BloodType) REFERENCES BloodTypes(BloodType)
);
select * from BloodInventory;
INSERT INTO BloodInventory (BloodID, BloodType, Quantity_ml, ExpiryDate) VALUES
(1, 'A+', 500, '2024-06-01'),
(2, 'A-', 300, '2024-06-10'),
(3, 'B+', 450, '2024-07-01'),
(4, 'B-', 350, '2024-07-15'),
(5, 'O+', 600, '2024-06-20');
select * from bloodinventory;
UPDATE BloodInventory
SET Quantity_ml = 550
WHERE BloodID = 1;
DELETE FROM BloodInventory
WHERE BloodID = 5;
SELECT BloodType, Quantity_ml
FROM BloodInventory
WHERE Quantity_ml > 400;
UPDATE BloodInventory
SET Quantity_ml = 600
WHERE BloodID = 5;

CREATE TABLE Transfusions (
TransfusionID INT PRIMARY KEY,
RecipientID INT,
DonationID INT,
TransfusionDate DATE
);

select * from Transfusions ;
INSERT INTO Transfusions (TransfusionID, RecipientID, DonationID, TransfusionDate) VALUES
(1, 201, 1, '2024-01-20'),
(2, 202, 2, '2024-02-25'),
(3, 203, 3, '2024-03-30'),
(4, 204, 4, '2024-04-15'),
(5, 205, 5, '2024-05-10');
SELECT * FROM Transfusions;
SELECT * FROM Transfusions
WHERE TransfusionDate BETWEEN '2024-02-01' AND '2024-04-30';
SELECT COUNT(*) AS TotalTransfusions FROM Transfusions;
SELECT * FROM Transfusions
WHERE RecipientID = 202;
SELECT SUM(RecipientID) AS TotalRecipientID
FROM Transfusions;

CREATE TABLE BloodTests (
    TestID INT PRIMARY KEY,
    DonationID INT,
    TestType VARCHAR(50),
    Result VARCHAR(25),
    TestDate DATE,
    Blood_sample VARCHAR(5),
    FOREIGN KEY (DonationID) REFERENCES Donations(DonationID)
);
SELECT * FROM BloodTests;
INSERT INTO BloodTests (TestID, DonationID, TestType, Result, TestDate, Blood_sample) VALUES
(1, 1, 'HIV', 'Negative', '2024-01-21', 'A'),
(2, 2, 'Hepatitis B', 'Negative', '2024-02-26', 'A-'),
(3, 3, 'Hepatitis C', 'Negative', '2024-03-31', 'A+'),
(4, 4, 'Syphilis', 'Negative', '2024-04-16', 'AB'),
(5, 5, 'Malaria', 'Negative', '2024-05-11', 'AB-');
select * from BloodTests;
SELECT * FROM BloodTests
WHERE TestID = 4;
DELETE FROM BloodTests
WHERE TestID = 5;
SELECT * FROM BloodTests
WHERE TestDate BETWEEN '2024-01-21' AND '2024-04-16' ;
SELECT * FROM BloodTests
WHERE TestID = 2;


CREATE TABLE DonorMedicalHistory (
    HistoryID INT PRIMARY KEY,
    DonorID INT,
    MedicalCondition VARCHAR(30),
    DiagnosisDate DATE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);

select * from DonorMedicalHistory;

INSERT INTO DonorMedicalHistory (HistoryID, DonorID, MedicalCondition, DiagnosisDate)
VALUES 
(1, 1, 'kantesh ', '2020-05-15'),
(2, 2, 'adnan', '2019-08-22'),
(3, 3, 'zain', '2018-11-05'),
(4, 4, 'kabeer', '2021-02-13'),
(5, 5, 'raj', '2023-01-10');
SELECT * FROM DonorMedicalHistory;
UPDATE DonorMedicalHistory
SET MedicalCondition = 'Hypertension'
WHERE HistoryID = 1;
DELETE FROM DonorMedicalHistory
WHERE HistoryID = 5;
SELECT * FROM DonorMedicalHistory
WHERE DonorID = 3;
SELECT * FROM DonorMedicalHistory
WHERE DiagnosisDate > '2020-01-01';

CREATE TABLE RecipientMedicalHistory (
    HistoryID INT PRIMARY KEY,
    RecipientID INT,
    MedicalCondition VARCHAR(30),
    DiagnosisDate DATE,
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID)
);
INSERT INTO RecipientMedicalHistory (HistoryID, RecipientID, MedicalCondition, DiagnosisDate)
VALUES 
(1, 1, 'kabeer ', '2021-03-15'),
(2, 2, 'sahil', '2020-07-20'),
(3, 3, 'sandhi', '2019-12-10'),
(4, 4, 'arun', '2022-05-25'),
(5, 5, 'luksh', '2023-08-30');
SELECT * FROM RecipientMedicalHistory;
UPDATE RecipientMedicalHistory
SET MedicalCondition = 'sandhi'
WHERE HistoryID = 3;
DELETE FROM RecipientMedicalHistory
WHERE HistoryID = 5;
SELECT * FROM RecipientMedicalHistory
WHERE RecipientID = 2;
SELECT * FROM RecipientMedicalHistory
WHERE DiagnosisDate > '2021-01-01';


CREATE TABLE BloodBanks (
    BankID INT PRIMARY KEY,
    Name VARCHAR(50),
    Location VARCHAR(50),
    Phone VARCHAR(15)
);
select*from BloodBanks;
INSERT INTO BloodBanks (BankID, Name, Location, Phone)
VALUES 
(1, 'Red Cross', 'north karachi', '92123456789'),
(2, 'Blood Donor Center', 'sadar', '92123456777'),
(3, 'Life Blood Bank', 'DHA', '92123456678'),
(4, 'Community Blood Bank', 'Hyderabad', '92123456121'),
(5, 'Central Blood Services', 'larkana', '92123456555');
select*from BloodBanks;
SELECT * FROM BloodBanks
WHERE Location = 'sadar';
SELECT * FROM BloodBanks
WHERE Phone LIKE '92123456%';
INSERT INTO BloodBanks (BankID, Name, Location, Phone)
VALUES (6, 'National Blood Center', 'Karachi', '92123456700');
DELETE FROM BloodBanks
WHERE BankID = 5;