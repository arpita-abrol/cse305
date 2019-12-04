CREATE VIEW CustomersView( CustomerId, Address, LastName, FirstName, City, State, Email, Zipcode, Telephone, CreditCardNumber, Rating)
AS (
	SELECT C.Id, P.Address, P.LastName, P.FirstName, L.City, L.State, C.Email, P.Zipcode, P.Telephone, C.CreditCardNumber, C.Rating
    FROM Customer C, Person P, Location L
    WHERE C.Id=P.SSN AND P.Zipcode=L.Zipcode
);

CREATE VIEW EmployeesView( EmployeeId, Address, LastName, FirstName, City, State, Email, Zipcode, Telephone, StartDate, HourlyRate)
AS (
	SELECT E.Id, P.Address, P.LastName, P.FirstName, L.City, L.State, P.Email, P.Zipcode, P.Telephone, E.StartDate, E.HourlyRate
    FROM Employee E, Person P, Location L
    WHERE E.Id=P.SSN AND P.Zipcode=L.Zipcode
);


CREATE VIEW MostActiveCR (CustRepId, RentalNum, Address, LastName, FirstName, City, State, Email, Zipcode, Telephone, StartDate, HourlyRate) AS (
    SELECT  CR.CustRepId, CR.RentalNum, P.Address, P.LastName, P.FirstName, L.City, L.State, P.Email, P.Zipcode, P.Telephone, E.StartDate, E.HourlyRate
    FROM (SELECT COUNT(R.CustRepId)RentalNum, R.CustRepId
                FROM Rental R
                GROUP BY(R.CustRepId)
                ORDER BY(RentalNum) DESC) CR, Employee E, Person P, Location L
	WHERE CR.CustRepId=E.Id AND E.Id=P.SSN AND P.Zipcode=L.Zipcode
    ORDER BY(RentalNum) DESC
    LIMIT 1
);


CREATE VIEW MostActiveCustomers (CustomerId, RentalNum, Address, LastName, FirstName, City, State, Email, Zipcode, Telephone, CreditCardNumber, Rating) AS (
    SELECT  CR.AccountId, CR.RentalNum, P.Address, P.LastName, P.FirstName, L.City, L.State, P.Email, P.Zipcode, P.Telephone, C.CreditCardNumber, C.Rating
    FROM (SELECT R.AccountId, COUNT(R.AccountId) AS RentalNum
                FROM Rental R
                GROUP BY(R.AccountId)
                ORDER BY(RentalNum) DESC) CR, Account A, Customer C, Person P, Location L
	WHERE CR.AccountId=A.Id AND A.Customer=C.Id AND C.Id=P.SSN AND P.Zipcode=L.Zipcode
    ORDER BY CR.RentalNum DESC
    LIMIT 1
);


CREATE VIEW MailingList(CustomerId, CustomerFirstName, CustomerLastName, Email, AccountType) AS (
	SELECT C.Id, C.FirstName, C.LastName, C.Email, A.AccountType
	FROM Account A JOIN (SELECT C1.Id, P.FirstName, P.LastName, C1.Email FROM Customer C1 JOIN Person P ON C1.Id = P.SSN) C ON A.Customer = C.Id
);


CREATE VIEW viewBestSeller(MovieId, MovieName, MovieType, DistrFee, NumCopies, Rating, Views) AS (
    Select M.Id, M.MovieName, M.MovieType, M.DistrFee, M.NumCopies, M.Rating, Count(*)
    From OrderTable O, Rental R ,Movie M
    Where R.MovieId=M.Id AND O.Id = R.OrderId
    Group by M.Id
    Order By Count(*) DESC);
    
    




CREATE VIEW ListMoviesByName (AccountId, CustRepId, OrderId, MovieId, MovieName, Customer, OrderTableDateTime, ReturnDate) 
AS (
    SELECT R.AccountId, R.CustRepId, R.OrderId, R.MovieId, M.MovieName, A.Customer, O.OrderTableDateTime, O.ReturnDate
    FROM Rental R, Movie M, Account A, Order O
    WHERE (R.MovieId=M.Id) AND (O.AccountId=A.Id) AND (R.AccountId=O.AccountId) AND (M.MovieName=?)
    );


CREATE VIEW ListMoviesByType (AccountId, CustRepId, OrderId, MovieId, MovieName, Customer, OrderTableDateTime, ReturnDate) 
AS (
    SELECT R.AccountId, R.CustRepId, R.OrderId, R.MovieId, M.MovieName, A.Customer, O.OrderTableDateTime, O.ReturnDate
    FROM Rental R, Movie M, Account A, Order O
    WHERE (R.MovieId=M.Id) AND (O.AccountId=A.Id) AND (R.AccountId=O.AccountId) AND (M.MovieType=?)
    );


CREATE VIEW ListMoviesByCustomerName (AccountId, CustRepId, OrderId, MovieId, FirstName, LastName, Customer, OrderTableDateTime, ReturnDate) 
AS (
	SELECT R.AccountId, R.CustRepId, R.OrderId, R.MovieId,    P.FirstName, P.LastName, A.Customer, O.OrderTableDateTime, O.ReturnDate
	FROM Rental R, Account A, Person P, Account A, Order O 
	WHERE (R.AccountId=A.Id) AND (P.SSN=A.Customer) AND (O.AccountId=A.Id) AND (R.AccountId=O.AccountId) AND (P.FirstName=?) AND (P.LastName=?)
);


CREATE VIEW MostRented (RentalNum, MovieName) AS (
    SELECT RC.RentalNum, M.MovieName
    FROM Movie M, (SELECT COUNT(*) RentalNum, MovieId
                FROM Rental
                GROUP BY MovieId) RC
    WHERE M.Id=RC.MovieId
    ORDER BY RC.RentalNum DESC, M.MovieName ASC
    LIMIT 10
);


CREATE VIEW MovieSuggestion(MovieName, MovieType, Rating) AS (
    SELECT M.MovieName, M.MovieType, M.Rating
    FROM  Movie M
    WHERE M.Id NOT IN (
        Select M1.Id
        From Rental R, OrderTable O, Movie M1
        Where R.AccountId=? AND R.OrderId=O.Id AND R.MovieId = M1.Id )
    AND M.Id IN (
        Select M2.Id
        From Rental R, OrderTable O, Movie M2
        Where R.AccountId=?? AND R.OrderId=O.Id AND R.MovieId = M2.Id )
);


CREATE VIEW CurrentRentals (AccountId, OrderTableDateTime, MovieId, MovieName) AS (
    SELECT Rental.AccountId, OrderTable.OrderTableDateTime, Rental.MovieId, Movie.MovieName
    FROM (Rental JOIN OrderTable ON Rental.OrderID = OrderTable.Id) JOIN Movie ON MovieId = Movie.Id
    WHERE OrderTable.ReturnDate IS NULL AND A.Customer=?
    ORDER BY Rental.AccountId ASC, OrderTableDateTime ASC
);


CREATE VIEW viewMovieQueue (MovieName, MovieRating) AS (
    Select MovieName,Rating
    From MovieQ MQ, Movie M, Account A
    Where A.Customer = ? AND A.Id = MQ.AccountId AND M.Id = MQ.MovieId );


CREATE VIEW getOrderHistory(AccountId, MovieName, OrderId, RentDate, ReturnDate, Customer) AS(
    Select R.AccountId, M.MovieName, O.Id, O.OrderTableDateTime, O.ReturnDate, A.Customer
    From Rental R, OrderTable O, Movie M, Account A
    Where R.AccountId=A.Id AND R.OrderId=O.Id AND R.MovieId = M.Id AND A.Customer= ?
);


CREATE VIEW SearchMovieType (MovieType, MovieName) AS (
SELECT MovieType, MovieName
FROM (SELECT COUNT(*) RentalNum, MovieId
    FROM Rental R
    GROUP BY (MovieId)) RC, Movie M
WHERE M.Id=RC.MovieId AND M.NumCopies>RC.RentalNum AND MovieType=?
);


CREATE VIEW SearchByMovieKeyword(MovieName) AS 
SELECT M.MovieName
FROM (SELECT COUNT(*) RentalNum, MovieId
    FROM Rental R
    GROUP BY (MovieId)) RC, Movie M
WHERE RC.MovieId=M.Id AND M.NumCopies>RC.RentalNum AND M.MovieName LIKE ‘%?%’;


Create VIEW actorsIn(MovieName, Rating,Actor) AS
    Select M.MovieName, M.Rating, A.ActorName
    From Actor A, AppearedIn AI, Movie M
    Where AI.ActorId=A.Id AND
	M.Id=AI.MovieId AND A.ActorName=?;


CREATE VIEW recommended1(MovieName, Rating) AS
    Select MovieName, Rating
    From  (
    Select MovieType, Count(*)
        From Rental, Movie
        Where AccountID=?
        Group by MovieType
        Order by Count(*)) T, Movie M
    Where M.MovieType = T.MovieType AND M.Id NOT IN (
        Select M.Id
        From Rental R, Movie M
        Where R.AccountId = ? AND R.MovieID=M.ID)
    LIMIT 10;


