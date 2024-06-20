CREATE TABLE RecipientMedicalHistory (
    HistoryID INT PRIMARY KEY,
    RecipientID INT,
    MedicalCondition VARCHAR(30),
    DiagnosisDate DATE,
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID)
);
