
-- Example queries using JOINS

-- left joins
SELECT Donations.DonationID,
Donors.Name, 
Donations.DonationDate
FROM 
Donations
LEFT JOIN Donors 
ON Donations.DonorID = Donors.DonorID;



-- inner joins
SELECT Donors.Name, Donors.BloodType
FROM Donors
INNER JOIN BloodTypes 
ON Donors.BloodType = BloodTypes.BloodType;

-- right joins
SELECT Transfusions.TransfusionID, Recipients.Name, Transfusions.TransfusionDate
FROM Transfusions
RIGHT JOIN Recipients 
ON Transfusions.RecipientID = Recipients.RecipientID;


-- inner joins
SELECT b1.BloodType, b1.Quantity_ml
FROM BloodInventory b1
INNER JOIN BloodInventory b2 
ON b1.BloodType = b2.BloodType ;


-- inner jions 
SELECT Recipients.Name, Recipients.BloodType, Transfusions.TransfusionDate
FROM Transfusions
INNER JOIN Recipients 
ON Transfusions.RecipientID = Recipients.RecipientID;


-- right joins
SELECT TestType, Result, TestDate
FROM BloodTests
RIGHT JOIN Donations 
ON BloodTests.DonationID = Donations.DonationID;
