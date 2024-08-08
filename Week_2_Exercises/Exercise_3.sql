--Exercise 3: Stored Procedures

--Scenario_1

CREATE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';
END

--verification

EXEC ProcessMonthlyInterest;

SELECT * FROM Accounts WHERE AccountType = 'Savings';

--Scenario_2

CREATE PROCEDURE UpdateEmployeeBonus (
    @Department VARCHAR(50),
    @BonusPercentage DECIMAL(5, 2)
)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * @BonusPercentage / 100)
    WHERE Department = @Department;
END

--verification

EXEC UpdateEmployeeBonus 'IT', 5;

SELECT * FROM Employees WHERE Department = 'IT';

--Scenario 3

CREATE PROCEDURE TransferFunds (
    @SourceAccount INT,
    @TargetAccount INT,
    @Amount DECIMAL(18, 2)
)
AS
BEGIN
    DECLARE @Balance DECIMAL(18, 2);

    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT @Balance = Balance FROM Accounts WHERE AccountID = @SourceAccount;
        IF @Balance < @Amount
        BEGIN
            RAISERROR ('Insufficient funds.', 16, 1);
        END

        UPDATE Accounts SET Balance = Balance - @Amount WHERE AccountID = @SourceAccount;
        UPDATE Accounts SET Balance = Balance + @Amount WHERE AccountID = @TargetAccount;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END

--verification

EXEC TransferFunds 1, 2, 100;

SELECT * FROM Accounts WHERE AccountID IN (1, 2);


