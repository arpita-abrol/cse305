DELIMITER $$
CREATE PROCEDURE `AddMovie`(
    IN newId INTEGER, IN newTitle CHAR(20), IN newGenre CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER
)
BEGIN
    INSERT INTO Movie(Id, MovieName, MovieType, Rating, DistrFee, NumCopies)
    VALUES(newId, newTitle, newGenre, newRating, newDistrFee, newNumCopies);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE EditMovie(IN movieId INTEGER, IN newMovieType CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER)
BEGIN
        UPDATE Movie
        SET MovieType = newMovieType, Rating = newRating, DistrFee = newDistrFee, NumCopies = newNumCopies
        WHERE Id=movieId;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE DeleteMovie (movieId INTEGER)
BEGIN
	DELETE FROM Movie
	WHERE Id=movieId;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `AddEmployee`(IN newSSN INTEGER, IN newStartDate DATE, IN newHourlyRate INTEGER, IN newLastName CHAR(20), IN newFirstName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newTelephone VARCHAR(10))
BEGIN
    IF NOT EXISTS( SELECT * FROM Person WHERE newSSN = SSN ) THEN
        INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone)
        VALUES(newSSN, newLastName, newFirstName, newAddress, newZipcode, newTelephone);
    END IF;
    INSERT INTO Employee(Id, SSN, StartDate, HourlyRate)
    VALUES(newSSN, newSSN, newStartDate, newHourlyRate);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE EditEmployee(IN SSN INTEGER, IN newStartDate DATE, IN newHourlyRate INTEGER)
BEGIN
    UPDATE Employee
    SET StartDate = newStartDate, HourlyRate = newHourlyRate
    WHERE Id = SSN;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE DeleteEmployee (IN empId INTEGER)
BEGIN
    DELETE FROM Employee
    WHERE Id=empId;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE CreateOrder (IN newDateTime DATETIME, IN newReturnDate DATE, IN newAccountId INT, IN newCustRepId INT, IN newMovieId INT)
BEGIN
    INSERT INTO OrderTable(OrderTableDateTime, ReturnDate)
    VALUES(newDateTime, newReturnDate);
    SET @newId = LAST_INSERT_ID();
    INSERT INTO Rental VALUE(newAccountId, newCustRepId, @newId, newMovieId);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `AddCust`(IN newId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16), IN newFirstName CHAR(20), IN newLastName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newTelephone VARCHAR(10))
BEGIN
    IF NOT EXISTS( SELECT * FROM Person WHERE newId = SSN ) THEN
        INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone)
        VALUES(newId, newLastName, newFirstName, newAddress, newZipcode, newTelephone);
    END IF;
    INSERT INTO Customer(Id, Email, Rating, CreditCardNumber)
    VALUES(newId, newEmail, newRating, newCreditCardNumber);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE EditCust(IN custId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16))
BEGIN
    UPDATE Customer
    SET Email = newEmail, Rating = newRating, CreditCardNumber = newCreditCardNumber
    WHERE Id = custId;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE DeleteCust (IN custId INTEGER )
BEGIN
    DELETE FROM Customer
    WHERE Id = custId;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE editAccount(IN CustId INTEGER, IN newAccountType CHAR(32))
BEGIN
    UPDATE ACCOUNT
    SET AccountType = newAccountType
    WHERE Customer = CustId;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE rateMovie(IN currentRating INTEGER, IN numRentals INTEGER)
BEGIN
    SET @currentRating = (Select Rating
    From Movie
    Where ID=movieID );

    SET @numRentals = (Select Count(*)
    From Rental
    Where MovieID=movieID);

    UPDATE Movie M
    SET M.Rating = ((@currentRating*@numRentals+Rating)/@numRentals) 
    WHERE MovieId = ID;
    
END$$
DELIMITER ;