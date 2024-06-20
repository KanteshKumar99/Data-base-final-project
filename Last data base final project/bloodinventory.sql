CREATE TABLE BloodInventory (
    BloodID INT PRIMARY KEY,
    BloodType VARCHAR(5),
    Quantity_ml INT,
    ExpiryDate DATE,
    FOREIGN KEY (BloodType) REFERENCES BloodTypes(BloodType)
);