--Exercise 6: Cursors

--Scenario 1

DECLARE @CustomerID INT, @Name VARCHAR(100), @Balance DECIMAL(18, 2);

DECLARE CustomerCursor CURSOR FOR
SELECT CustomerID, Name, Balance FROM Customers;

OPEN CustomerCursor;
FETCH NEXT FROM CustomerCursor INTO @CustomerID, @Name, @Balance;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Monthly Statement for ' + @Name + ': Balance = ' + CAST(@Balance AS VARCHAR);
    FETCH NEXT FROM CustomerCursor INTO @CustomerID, @Name, @Balance;
END

CLOSE CustomerCursor;
DEALLOCATE CustomerCursor;

--Scenario 2

DECLARE @AccountID INT, @Balance DECIMAL(18, 2);

DECLARE AccountCursor CURSOR FOR
SELECT AccountID, Balance FROM Accounts;

OPEN AccountCursor;
FETCH NEXT FROM AccountCursor INTO @AccountID, @Balance;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Accounts
    SET Balance = Balance - 100 -- Assuming the annual fee is 100
    WHERE AccountID = @AccountID;

    FETCH NEXT FROM AccountCursor INTO @AccountID, @Balance;
END

CLOSE AccountCursor;
DEALLOCATE AccountCursor;

--Scenario 3

DECLARE @LoanID INT, @InterestRate DECIMAL(5, 2);

DECLARE LoanCursor CURSOR FOR
SELECT LoanID, InterestRate FROM Loans;

OPEN LoanCursor;
FETCH NEXT FROM LoanCursor INTO @LoanID, @InterestRate;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Loans
    SET InterestRate = InterestRate + 1 -- Assuming the new policy increases the rate by 1%
    WHERE LoanID = @LoanID;

    FETCH NEXT FROM LoanCursor INTO @LoanID, @InterestRate;
END

CLOSE LoanCursor;
DEALLOCATE LoanCursor;
