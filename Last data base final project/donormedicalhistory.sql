CREATE TABLE DonorMedicalHistory (
    HistoryID INT PRIMARY KEY,
    DonorID INT,
    MedicalCondition VARCHAR(30),
    DiagnosisDate DATE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);
