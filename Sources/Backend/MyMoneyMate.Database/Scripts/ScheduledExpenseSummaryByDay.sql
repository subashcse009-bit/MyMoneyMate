SELECT
    SE.ScheduledDay, A.AccountName, C.CategoryName,
    SUM(SE.ExpenseAmount) OVER
    (
        PARTITION BY SE.ScheduledDay, A.AccountID, C.CategoryID
    ) AS ScheduledExpenseByDate,
    SUM(SE.IncomeAmount) OVER
    (
        PARTITION BY SE.ScheduledDay, A.AccountID, C.CategoryID
    ) AS ScheduledIncomeByDate,
    ROW_NUMBER() OVER
    (
        PARTITION BY SE.ScheduledDay, A.AccountID, C.CategoryID
        ORDER BY A.AccountID, C.CategoryID
    ) AS RN,
    SE.StartDate,
    SE.EndDate,
    SE.Description
FROM ScheduledExpenses SE
INNER JOIN Accounts A
    ON SE.AccountId = A.AccountID
INNER JOIN Categories C
    ON SE.CategoryId = C.CategoryID
ORDER BY
    SE.ScheduledDay,
    A.AccountID,
    C.CategoryID;