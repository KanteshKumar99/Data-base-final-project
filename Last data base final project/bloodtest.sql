CREATE TABLE BloodTests (
    TestID INT PRIMARY KEY,
    DonationID INT,
    TestType VARCHAR(50),
    Result VARCHAR(25),
    TestDate DATE,
    Blood_sample VARCHAR(5),
    FOREIGN KEY (DonationID) REFERENCES Donations(DonationID)
);
