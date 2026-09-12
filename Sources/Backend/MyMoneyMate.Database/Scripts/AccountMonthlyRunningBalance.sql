DECLARE @StartDate DATE = '2026-04-01';
DECLARE @EndDate   DATE = DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1);

WITH CTE_Calendar AS
(
    SELECT @StartDate AS MonthDate
    UNION ALL
    SELECT DATEADD(MONTH, 1, MonthDate)
    FROM CTE_Calendar
    WHERE MonthDate < @EndDate
),

CTE_MonthlyTransactions AS
(
    SELECT
        T.AccountId,
        YEAR(T.EffectiveDate) AS YearNum,
        MONTH(T.EffectiveDate) AS MonthNum,
        SUM(
            CASE
                WHEN T.TransactionTypeValue = 'INCO'
                THEN T.Amount
                ELSE 0
            END
        ) AS TotalIncome,
        SUM(
            CASE
                WHEN T.TransactionTypeValue = 'EXPE'
                THEN T.Amount
                ELSE 0
            END
        ) AS TotalExpense
    FROM Transactions T
    GROUP BY
        T.AccountId,
        YEAR(T.EffectiveDate),
        MONTH(T.EffectiveDate)
),

CTE_AccountMonths AS
(
    SELECT
        A.AccountId,
        A.AccountName,
        A.OpeningBalance,
        A.AccountSideValue,
        A.AccountTypeValue,
        YEAR(C.MonthDate)  AS YearNum,
        MONTH(C.MonthDate) AS MonthNum,
        FORMAT(C.MonthDate, 'MMM') AS MonthName
    FROM Accounts A
    CROSS JOIN CTE_Calendar C
    WHERE A.StatusValue = 'ACTV'
),

CTE_MonthlyData AS
(
    SELECT
        AM.AccountId,
        AM.AccountName,
        AM.OpeningBalance,
        AM.AccountSideValue,
        AM.AccountTypeValue,
        AM.YearNum,
        AM.MonthNum,
        AM.MonthName,
        ISNULL(MT.TotalIncome, 0) AS TotalIncome,
        ISNULL(MT.TotalExpense, 0) AS TotalExpense
    FROM CTE_AccountMonths AM
    LEFT JOIN CTE_MonthlyTransactions MT
        ON MT.AccountId = AM.AccountId
       AND MT.YearNum = AM.YearNum
       AND MT.MonthNum = AM.MonthNum
),

CTE_Final AS
(
    SELECT
        YearNum,
        MonthNum,
        MonthName,
        AccountId,
        AccountName,
        AccountSideValue,
        AccountTypeValue,
        TotalIncome,
        TotalExpense,
        OpeningBalance +
        SUM(TotalIncome - TotalExpense)
        OVER
        (
            PARTITION BY AccountId
            ORDER BY YearNum, MonthNum
            ROWS UNBOUNDED PRECEDING
        ) AS Balance
    FROM CTE_MonthlyData
)

SELECT
    YearNum,
    MonthNum,
    MonthName,
    AccountId,
    AccountName,
    AccountSideValue,
    AccountTypeValue,
    TotalIncome,
    TotalExpense,
    Balance,
    SUM(Balance)
    OVER
    (
        PARTITION BY
            YearNum,
            MonthNum,
            AccountTypeValue
    ) AS TotalBalanceByAccountType,    
    SUM(Balance)
    OVER
    (
        PARTITION BY
            YearNum,
            MonthNum,
            AccountSideValue
    ) AS TotalBalanceByAccountSide,
    ROUND((SUM(Balance)
    OVER
    (
        PARTITION BY
            YearNum,
            MonthNum,
            AccountTypeValue
    ) 
    /
    SUM(Balance)
    OVER
    (
        PARTITION BY
            YearNum,
            MonthNum,
            AccountSideValue
    ))*100,2) AllocationPercentage
FROM CTE_Final
ORDER BY
    YearNum,
    MonthNum,
    AccountId
OPTION (MAXRECURSION 100)