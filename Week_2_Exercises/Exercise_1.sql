--Exercise 1: Control Structures

--Scenario 1

DECLARE @CustomerID INT, @DOB DATE, @Age INT;

DECLARE CustomerCursor CURSOR FOR 
SELECT CustomerID, DOB FROM Customers;

OPEN CustomerCursor;
FETCH NEXT FROM CustomerCursor INTO @CustomerID, @DOB;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Age = DATEDIFF(YEAR, @DOB, GETDATE());
    IF @Age > 60
    BEGIN
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = @CustomerID;
    END

    FETCH NEXT FROM CustomerCursor INTO @CustomerID, @DOB;
END

CLOSE CustomerCursor;
DEALLOCATE CustomerCursor;

--verification
SELECT * FROM Loans WHERE InterestRate < 5;


--Scenario 2

UPDATE Customers
SET IsVIP = 1
WHERE Balance > 10000;

--verification
SELECT * FROM Customers WHERE IsVIP = 1;


--Scenario 3

DECLARE @CustomerID INT, @EndDate DATE;

DECLARE LoanCursor CURSOR FOR 
SELECT CustomerID, EndDate FROM Loans WHERE EndDate BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE());

OPEN LoanCursor;
FETCH NEXT FROM LoanCursor INTO @CustomerID, @EndDate;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Reminder: Loan for customer ' + CAST(@CustomerID AS VARCHAR) + ' is due on ' + CAST(@EndDate AS VARCHAR);
    FETCH NEXT FROM LoanCursor INTO @CustomerID, @EndDate;
END

CLOSE LoanCursor;
DEALLOCATE LoanCursor;

--verification
SELECT CustomerID, EndDate FROM Loans WHERE EndDate BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE());



