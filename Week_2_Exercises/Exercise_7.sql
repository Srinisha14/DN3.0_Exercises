--Exercise 7: Packages

--Scenario 1

--Package definition

CREATE PROCEDURE AddCustomer
(
    @CustomerID INT,
    @Name VARCHAR(100),
    @DOB DATE,
    @Balance DECIMAL(18, 2)
)
AS
BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (@CustomerID, @Name, @DOB, @Balance, GETDATE());
END

--Package body

CREATE PROCEDURE UpdateCustomer
(
    @CustomerID INT,
    @Name VARCHAR(100),
    @DOB DATE,
    @Balance DECIMAL(18, 2)
)
AS
BEGIN
    UPDATE Customers
    SET Name = @Name, DOB = @DOB, Balance = @Balance, LastModified = GETDATE()
    WHERE CustomerID = @CustomerID;
END

--Scenario 2

--Package definition
CREATE PROCEDURE HireEmployee
(
    @EmployeeID INT,
    @Name VARCHAR(100),
    @Position VARCHAR(50),
    @Salary DECIMAL(18, 2),
    @Department VARCHAR(50),
    @HireDate DATE
)
AS
BEGIN
    INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
    VALUES (@EmployeeID, @Name, @Position, @Salary, @Department, @HireDate);
END

--Package body
CREATE PROCEDURE UpdateEmployee
(
    @EmployeeID INT,
    @Name VARCHAR(100),
    @Position VARCHAR(50),
    @Salary DECIMAL(18, 2),
    @Department VARCHAR(50)
)
AS
BEGIN
    UPDATE Employees
    SET Name = @Name, Position = @Position, Salary = @Salary, Department = @Department
    WHERE EmployeeID = @EmployeeID;
END

------
CREATE FUNCTION CalculateAnnualSalary (@EmployeeID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @MonthlySalary DECIMAL(18, 2);

    SELECT @MonthlySalary = Salary FROM Employees WHERE EmployeeID = @EmployeeID;

    RETURN @MonthlySalary * 12;
END


--Scenario 3

--Package definition

CREATE PROCEDURE OpenAccount
(
    @AccountID INT,
    @CustomerID INT,
    @AccountType VARCHAR(20),
    @Balance DECIMAL(18, 2)
)
AS
BEGIN
    INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
    VALUES (@AccountID, @CustomerID, @AccountType, @Balance, GETDATE());
END

--Package body

CREATE PROCEDURE CloseAccount
(
    @AccountID INT
)
AS
BEGIN
    DELETE FROM Accounts WHERE AccountID = @AccountID;
END

-----
CREATE FUNCTION GetTotalBalance (@CustomerID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalBalance DECIMAL(18, 2);

    SELECT @TotalBalance = SUM(Balance) FROM Accounts WHERE CustomerID = @CustomerID;

    RETURN @TotalBalance;
END





 