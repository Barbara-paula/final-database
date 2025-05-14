-- Creating Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    PublishedYear INT,
    Genre VARCHAR(100)
);

-- Creating Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- Creating Loans Table (Tracks book loans)
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Creating Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Creating BookAuthors Table (Many-to-Many relationship between Books and Authors)
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
