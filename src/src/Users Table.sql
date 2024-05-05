-- Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PasswordHash CHAR(64) NOT NULL -- assuming SHA-256
);

-- Incomes Table
CREATE TABLE Incomes (
    IncomeID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Source VARCHAR(255) NOT NULL,
    DateReceived DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Expenses Table
CREATE TABLE Expenses (
    ExpenseID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Category VARCHAR(255) NOT NULL,
    DateSpent DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Savings Table
CREATE TABLE Savings (
    SavingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Purpose VARCHAR(255),
    DateSaved DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
