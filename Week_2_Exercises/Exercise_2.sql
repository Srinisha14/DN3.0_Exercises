--Exercise 2: Error Handling

--Scenario 1

CREATE PROCEDURE SafeTransferFunds (
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

EXEC SafeTransferFunds 1, 2, 500;

SELECT * FROM Accounts WHERE AccountID IN (1, 2);



--Scenario 2

CREATE PROCEDURE UpdateSalary (
    @EmployeeID INT,
    @Percentage DECIMAL(5, 2)
)
AS
BEGIN
    BEGIN TRY
        DECLARE @Salary DECIMAL(18, 2);
        SELECT @Salary = Salary FROM Employees WHERE EmployeeID = @EmployeeID;

        IF @Salary IS NULL
        BEGIN
            RAISERROR ('Employee ID does not exist.', 16, 1);
        END

        UPDATE Employees
        SET Salary = Salary + (Salary * @Percentage / 100)
        WHERE EmployeeID = @EmployeeID;

        PRINT 'Salary updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END

--verification

EXEC UpdateSalary 1, 10; -- Successful case
EXEC UpdateSalary 999, 10; -- Error case (non-existent employee)

SELECT * FROM Employees WHERE EmployeeID = 1;

--Scenario 3

CREATE PROCEDURE AddNewCustomer (
    @CustomerID INT,
    @Name VARCHAR(100),
    @DOB DATE,
    @Balance DECIMAL(18, 2)
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
        VALUES (@CustomerID, @Name, @DOB, @Balance, GETDATE());

        PRINT 'Customer added successfully.';
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 2627 -- Primary key violation
        BEGIN
            PRINT 'Customer ID already exists.';
        END
        ELSE
        BEGIN
            PRINT ERROR_MESSAGE();
        END
    END CATCH
END

--verification

EXEC AddNewCustomer 3, 'New Customer', '1975-01-01', 500;
EXEC AddNewCustomer 1, 'Existing Customer', '1980-01-01', 600; -- Error case

SELECT * FROM Customers WHERE CustomerID = 3;



