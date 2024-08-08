--Exercise 5: Triggers

--Scenario 1
CREATE TRIGGER UpdateCustomerLastModified
ON Customers
AFTER UPDATE
AS
BEGIN
    UPDATE Customers
    SET LastModified = GETDATE()
    FROM Customers INNER JOIN inserted ON Customers.CustomerID = inserted.CustomerID;
END

--Scenario 2

CREATE TRIGGER LogTransaction
ON Transactions
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog (AccountID, TransactionDate, Amount, TransactionType)
    SELECT AccountID, TransactionDate, Amount, TransactionType
    FROM inserted;
END

CREATE TABLE AuditLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(18, 2),
    TransactionType VARCHAR(10)
);

--Scenario 3

CREATE TRIGGER CheckTransactionRules
ON Transactions
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @AccountID INT, @Amount DECIMAL(18, 2), @TransactionType VARCHAR(10);
    DECLARE @Balance DECIMAL(18, 2);

    SELECT @AccountID = AccountID, @Amount = Amount, @TransactionType = TransactionType
    FROM inserted;

    SELECT @Balance = Balance FROM Accounts WHERE AccountID = @AccountID;

    IF @TransactionType = 'Withdrawal' AND @Balance < @Amount
    BEGIN
        RAISERROR ('Insufficient balance for withdrawal.', 16, 1);
    END
    ELSE IF @TransactionType = 'Deposit' AND @Amount <= 0
    BEGIN
        RAISERROR ('Deposit amount must be positive.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Transactions (AccountID, TransactionDate, Amount, TransactionType)
        SELECT AccountID, TransactionDate, Amount, TransactionType
        FROM inserted;

        UPDATE Accounts
        SET Balance = Balance + 
                      CASE WHEN @TransactionType = 'Deposit' THEN @Amount ELSE -@Amount END
        WHERE AccountID = @AccountID;
    END
END


