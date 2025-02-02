DELIMITER $$
CREATE PROCEDURE AddMovie(IN newTitle CHAR(20), IN newGenre CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER)
BEGIN
    INSERT INTO Movie( MovieName, MovieType, Rating, DistrFee, NumCopies)
    VALUES(newTitle, newGenre, newRating, newDistrFee, newNumCopies);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE EditMovie(IN movieId INTEGER, IN newMovieName CHAR(20), IN newMovieType CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER)
BEGIN
        UPDATE Movie
        SET MovieName = newMovieName, MovieType = newMovieType, Rating = newRating, DistrFee = newDistrFee, NumCopies = newNumCopies
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
CREATE PROCEDURE AddEmployee(IN newSSN INTEGER, IN newEmail CHAR(32), IN newStartDate DATE, IN newHourlyRate INTEGER, IN newLastName CHAR(20), IN newFirstName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
    IF NOT EXISTS( SELECT * FROM Person WHERE newSSN = SSN ) THEN
        INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone, Email)
        VALUES(newSSN, newLastName, newFirstName, newAddress, newZipcode, newTelephone, newEmail);
    END IF;
    INSERT INTO Employee(Id, SSN, StartDate, HourlyRate)
    VALUES(newSSN, newSSN, newStartDate, newHourlyRate);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE EditEmployee(IN newSSN INTEGER, IN newEmail CHAR(32), IN newStartDate DATE, IN newHourlyRate INTEGER, IN newLastName CHAR(20), IN newFirstName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
	UPDATE Location
    SET ZipCode = newZipcode, City = newCity, State = newState
    WHERE ZipCode = newZipcode;
    UPDATE Person
    SET LastName = newLastName, FirstName = newFirstName, Address = newAddress, Zipcode = newZipcode, Telephone = newTelephone, Email = newEmail
    WHERE SSN = newSSN;
    UPDATE Employee
    SET StartDate = newStartDate, HourlyRate = newHourlyRate
    WHERE Id = newSSN;
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
CREATE PROCEDURE AddCust(IN newId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16), IN newFirstName CHAR(20), IN newLastName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
    IF NOT EXISTS( SELECT * FROM Person WHERE newId = SSN ) THEN
        INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone, Email)
        VALUES(newId, newLastName, newFirstName, newAddress, newZipcode, newTelephone, newEmail);
    END IF;
    INSERT INTO Customer(Id, Email, Rating, CreditCardNumber)
    VALUES(newId, newEmail, newRating, newCreditCardNumber);
    INSERT INTO Account(DateOpened, AccountType, Customer) 
    VALUES(DATE(now()), "Limited", NewId);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE EditCust(IN custId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16), IN newFirstName CHAR(20), IN newLastName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
	UPDATE Location
    SET ZipCode = newZipcode, City = newCity, State = newState
    WHERE ZipCode = newZipcode;
	UPDATE Person
    SET LastName = newLastName, FirstName = newFirstName, Address = newAddress, Zipcode = newZipcode, Telephone = newTelephone, Email = newEmail
    WHERE SSN = custId;
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
CREATE PROCEDURE AddLogin (IN newEmail CHAR(32), IN newPswd CHAR(32), IN newRole CHAR(32) )
BEGIN
    INSERT INTO Login(Email, Pswd, Role)
    VALUES(newEmail, newPswd, newRole);
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
CREATE PROCEDURE CreateOrder (IN newDateTime DATETIME, IN newReturnDate DATE, IN newAccountId INT, IN newCustRepId INT, IN newMovieId INT)
BEGIN
    INSERT INTO OrderTable(OrderTableDateTime, ReturnDate)
    VALUES(newDateTime, newReturnDate);
    SET @newId = LAST_INSERT_ID();
    INSERT INTO Rental VALUE(newAccountId, newCustRepId, @newId, newMovieId);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE RecordOrder (IN completedOrder INTEGER)
BEGIN
	UPDATE OrderTable
    SET ReturnDate=DATE(now())
    WHERE Id=completedOrder;
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

DELIMITER $$
CREATE PROCEDURE getSalesReport(IN targetDate DATE)
BEGIN
    (SELECT AccountType, COUNT(*) * 10 FROM Account A1 WHERE A1.AccountType = 'Limited' AND DateOpened < targetDate )
    UNION
    (SELECT AccountType, COUNT(*) * 15 FROM Account A1 WHERE A1.AccountType = 'Unlimited-1' AND DateOpened < targetDate )
    UNION
    (SELECT AccountType, COUNT(*) * 20 FROM Account A1 WHERE A1.AccountType = 'Unlimited-2' AND DateOpened < targetDate )
    UNION
    (SELECT AccountType, COUNT(*) * 25 FROM Account A1 WHERE A1.AccountType = 'Unlimited-3' AND DateOpened < targetDate );
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE suggested(IN custID INTEGER)
BEGIN
    DROP TABLE IF EXISTS mostWatchedType;
    Create temporary table mostWatchedType (MovieType varchar(20), counts INT);
        
        Insert into mostWatchedType
        Select M.MovieType, Count(*)
		From Rental R, OrderTable O, Account A, Movie M
		Where R.AccountId=A.Id AND R.OrderId=O.Id AND A.Customer=custID AND R.MovieId=M.Id
        Group by MovieType
        Order by Count(*) DESC;

        Select Movie.ID,Movie.MovieName,Movie.Rating,Movie.MovieType
        From Movie,    mostWatchedType
        Where Movie.MovieType = mostWatchedType.MovieType
        and Movie.ID not in (
        Select Movie.ID
        From Rental,Movie, Account
        Where Rental.AccountID=Account.ID and Account.Customer = custID AND Rental.MovieID=Movie.ID);
END$$
DELIMITER ;