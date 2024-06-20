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