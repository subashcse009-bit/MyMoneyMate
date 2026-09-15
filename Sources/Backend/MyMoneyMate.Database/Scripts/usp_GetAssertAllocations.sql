CREATE PROCEDURE usp_GetAssertAllocations
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
    AccountTypeValue,
    SUM(CurrentBalance) AS TotalBalance,
    SUM(SUM(CurrentBalance)) OVER (),
    ROUND(
        SUM(CurrentBalance) * 100.0 /
        SUM(SUM(CurrentBalance)) OVER (),
        2
    ) AS BalancePercentage
FROM Accounts
WHERE AccountSideValue = 'ASST'
GROUP BY AccountTypeValue;
END;
GO