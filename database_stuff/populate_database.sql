# Locations
INSERT INTO Location VALUES(11790, "Stony Brook", "NY");
INSERT INTO Location VALUES(93536, "Los Angeles", "CA");
INSERT INTO Location VALUES(11794, "Stony Brook", "NY");

# Person
INSERT INTO Person VALUES(111111111, "Yang", "Shang", "123 Success Street", 11790, 5166328959, "yang@gmail.com");
INSERT INTO Person VALUES(222222222, "Du", "Victor", "456 Fortune Road", 11790, 5166324360, "vicdu@cs.sunysb.edu");
INSERT INTO Person VALUES(333333333, "Smith", "John", "789 Peace Blvd.", 93536, 3154434321, "jsmith@cs.sunysb.edu");
INSERT INTO Person VALUES(444444444, "Philip", "Lewis", "135 Knowledge Lane", 11794, 5166668888, "pml@cs.sunysb.edu");
INSERT INTO Person VALUES(123456789, "Smith", "David", "123 College road", 11790, 5162152345, "smith@gmail.com");
INSERT INTO Person VALUES(789123456, "Warren", "David", "123 Sunken Street", 11794, 6316329987, "warren@gmail.com");

# Employee
INSERT INTO Employee VALUES(123456789, 123456789, '2005-11-01', 60);
INSERT INTO Employee VALUES(789123456, 789123456, '2006-02-02', 50);

# Customer
INSERT INTO Customer VALUES(111111111, "yang@gmail.com", 1, "1234567812345678");
INSERT INTO Customer VALUES(222222222, "vicdu@cs.sunysb.edu", 1, "5678123456781234");
INSERT INTO Customer VALUES(333333333, "jsmith@cs.sunysb.edu", 1, "2345678923456789");
INSERT INTO Customer VALUES(444444444, "pml@cs.sunysb.edu", 1, "6789234567892345");

# Login
INSERT INTO Login VALUES(123456789, "smith@gmail.com", "pass1", "manager");
INSERT INTO Login VALUES(789123456, "warren@gmail.com", "pass2", "customerRepresentative");
INSERT INTO Login VALUES(111111111, "yang@gmail.com", "pass3", "customer");

# Account
INSERT INTO Account(DateOpened, AccountType, Customer) VALUES('2006-10-01', "Unlimited-2", 444444444);
INSERT INTO Account(DateOpened, AccountType, Customer) VALUES('2006-10-15', "Limited", 222222222);
INSERT INTO Account(DateOpened, AccountType, Customer) VALUES('2006-10-15', "Limited", 111111111);

# OrderTable
INSERT INTO OrderTable(OrderTableDateTime, ReturnDate) VALUES('2009-11-11 10:00:00', '2009-11-14');
INSERT INTO OrderTable(OrderTableDateTime, ReturnDate) VALUES('2009-11-11 18:15:00', NULL);
INSERT INTO OrderTable(OrderTableDateTime, ReturnDate) VALUES('2009-11-12 09:30:00', NULL);
INSERT INTO OrderTable(OrderTableDateTime, ReturnDate) VALUES('2009-11-21 22:22:00', NULL);

# Movie
INSERT INTO Movie(MovieName, MovieType, Rating, DistrFee, NumCopies) VALUES("The Godfather", "Drama", 5, 10000, 3);
INSERT INTO Movie(MovieName, MovieType, Rating, DistrFee, NumCopies) VALUES("Shawshank Redemption", "Drama", 4, 1000, 2);
INSERT INTO Movie(MovieName, MovieType, Rating, DistrFee, NumCopies) VALUES("Borat", "Comedy", 3, 500, 1);

# Actor
INSERT INTO Actor VALUES(1, "Al Pacino", 63, "M", 5);
INSERT INTO Actor VALUES(2, "Tim Robbins", 53, "M", 2);

# Rental
INSERT INTO Rental VALUES(1, 123456789, 1, 1);
INSERT INTO Rental VALUES(2, 123456789, 2, 3);
INSERT INTO Rental VALUES(1, 123456789, 3, 3);
INSERT INTO Rental VALUES(2, 789123456, 4, 2);

# MovieQ

# AppearedIn
INSERT INTO AppearedIn VALUES(1, 1);
INSERT INTO AppearedIn VALUES(1, 3);
INSERT INTO AppearedIn VALUES(2, 1);

