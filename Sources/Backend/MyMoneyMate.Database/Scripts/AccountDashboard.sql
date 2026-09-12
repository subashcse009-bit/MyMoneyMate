DECLARE @DateTime DATE = '2026-09-01';

DECLARE @AsOfDate DATE = DATEADD(DAY, -1, @DateTime);

SELECT
    AccountId,
    AccountName,
    CurrentBalance,
    AccountSideId,
    AccountSideValue,
    AccountTypeId,
    AccountTypeValue,
    StatusId,
    StatusValue,
    LastTransactionDate,
    LastMonthIncome-LastMonthExpense As AsOfCurrentBalance
FROM
(
    SELECT
        A.AccountId,
        A.AccountName,
        A.CurrentBalance,
        A.AccountSideId,
        A.AccountSideValue,
        A.AccountTypeId,
        A.AccountTypeValue,
        A.StatusId,
        A.StatusValue,
        LT.LastTransactionDate,
        ISNULL(LMI.Amount, 0) AS LastMonthIncome,
        ISNULL(LME.Amount, 0) AS LastMonthExpense
    FROM Accounts A
    OUTER APPLY
    (
        SELECT MAX(T.EffectiveDate) AS LastTransactionDate
        FROM Transactions T
        WHERE T.AccountId = A.AccountId
    ) LT
    OUTER APPLY
    (
        SELECT SUM(T.Amount) AS Amount
        FROM Transactions T
        WHERE T.AccountId = A.AccountId
          AND T.TransactionTypeValue = 'INCO'
          AND T.EffectiveDate < @AsOfDate
    ) LMI
    OUTER APPLY
    (
        SELECT SUM(T.Amount) AS Amount
        FROM Transactions T
        WHERE T.AccountId = A.AccountId
          AND T.TransactionTypeValue = 'EXPE'
          AND T.EffectiveDate < @AsOfDate
    ) LME
    WHERE A.StatusValue = 'ACTV'
) AccountsSummary;


WITH CTE_MonthlyIncome AS
(
    SELECT DISTINCT
        MONTH(T.EffectiveDate) AS MonthNum,
        FORMAT(T.EffectiveDate, 'MMM') AS MonName,
        A.AccountName,
        A.AccountTypeValue,
        A.AccountSideValue,
        SUM(T.Amount) OVER
        (
            PARTITION BY
                MONTH(T.EffectiveDate),
                T.AccountId
        ) AS TotalIncome
    FROM Accounts A
    LEFT JOIN Transactions T
        ON T.AccountId = A.AccountId
    WHERE A.StatusValue = 'ACTV'
      AND T.TransactionTypeValue = 'INCO'
),

CTE_MonthlyExpense AS
(
    SELECT DISTINCT
        MONTH(T.EffectiveDate) AS MonthNum,
        FORMAT(T.EffectiveDate, 'MMM') AS MonName,
        A.AccountName,
        A.AccountTypeValue,
        A.AccountSideValue,
        SUM(T.Amount) OVER
        (
            PARTITION BY
                MONTH(T.EffectiveDate),
                T.AccountId
        ) AS TotalExpense
    FROM Transactions T
    INNER JOIN Accounts A
        ON T.AccountId = A.AccountId
    WHERE A.StatusValue = 'ACTV'
      AND T.TransactionTypeValue = 'EXPE'
)


SELECT
    I.MonthNum,
    I.MonName,
    I.AccountName,
    I.TotalIncome,
    E.TotalExpense,
    I.TotalIncome - E.TotalExpense AS Balance
FROM CTE_MonthlyIncome I
INNER JOIN CTE_MonthlyExpense E
    ON I.AccountName = E.AccountName
   AND I.MonthNum = E.MonthNum
ORDER BY
    I.MonthNum,
    I.AccountName;



    SELECT
    A.AccountId,
    A.AccountName,
    MONTH(T.EffectiveDate) AS MonthNum,
    FORMAT(T.EffectiveDate, 'MMM') AS MonName,
    ISNULL(
        SUM(CASE
                WHEN T.TransactionTypeValue = 'INCO'
                THEN T.Amount
                ELSE 0
            END),
        0
    ) AS TotalIncome,
    ISNULL(
        SUM(CASE
                WHEN T.TransactionTypeValue = 'EXPE'
                THEN T.Amount
                ELSE 0
            END),
        0
    ) AS TotalExpense,
    ISNULL(
        SUM(CASE
                WHEN T.TransactionTypeValue = 'INCO'
                THEN T.Amount
                ELSE 0
            END),
        0
    )
    -
    ISNULL(
        SUM(CASE
                WHEN T.TransactionTypeValue = 'EXPE'
                THEN T.Amount
                ELSE 0
            END),
        0
    ) AS Balance
FROM Accounts A
LEFT JOIN Transactions T
    ON T.AccountId = A.AccountId
WHERE A.StatusValue = 'ACTV'
GROUP BY
    A.AccountId,
    A.AccountName,
    MONTH(T.EffectiveDate),
    FORMAT(T.EffectiveDate, 'MMM')
ORDER BY
    MonthNum,
    A.AccountId;


-- Monthly running balance

