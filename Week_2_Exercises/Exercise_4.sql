--Exercise 4: Functions

--Scenario 1

CREATE FUNCTION CalculateAge (@DOB DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @DOB, GETDATE()) - 
           CASE WHEN MONTH(GETDATE()) * 100 + DAY(GETDATE()) < MONTH(@DOB) * 100 + DAY(@DOB) THEN 1 ELSE 0 END;
END

--verification

SELECT dbo.CalculateAge('1985-05-15') AS Age;

--Scenario 2

CREATE FUNCTION CalculateMonthlyInstallment (
    @LoanAmount DECIMAL(18, 2),
    @InterestRate DECIMAL(5, 2),
    @DurationYears INT
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalInterest DECIMAL(18, 2);
    DECLARE @MonthlyInstallment DECIMAL(18, 2);

    SET @TotalInterest = @LoanAmount * @InterestRate / 100 * @DurationYears;
    SET @MonthlyInstallment = (@LoanAmount + @TotalInterest) / (@DurationYears * 12);

    RETURN @MonthlyInstallment;
END

--veriication

SELECT dbo.CalculateMonthlyInstallment(10000, 5, 5) AS MonthlyInstallment;

--Scenario 3

CREATE FUNCTION HasSufficientBalance (@AccountID INT, @Amount DECIMAL(18, 2))
RETURNS BIT
AS
BEGIN
    DECLARE @Balance DECIMAL(18, 2);

    SELECT @Balance = Balance FROM Accounts WHERE AccountID = @AccountID;

    IF @Balance >= @Amount
        RETURN 1;
    ELSE
        RETURN 0;
END

--verification

SELECT dbo.HasSufficientBalance(1, 500) AS HasBalance;




