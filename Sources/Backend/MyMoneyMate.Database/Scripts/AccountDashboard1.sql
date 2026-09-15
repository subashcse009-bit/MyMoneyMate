CREATE PROCEDURE usp_GetAccountDashboard
(
    @UserId INT
)
AS
BEGIN

    --------------------------------------------------
    -- Summary
    --------------------------------------------------

    SELECT
        SUM(CASE WHEN AccountSideValue='ASSET'
                 THEN CurrentBalance ELSE 0 END) TotalAssets,

        SUM(CASE WHEN AccountSideValue='LIABILITY'
                 THEN CurrentBalance ELSE 0 END) TotalLiabilities,

        SUM(CASE WHEN AccountSideValue='ASSET'
                 THEN CurrentBalance ELSE 0 END)
         -
        SUM(CASE WHEN AccountSideValue='LIABILITY'
                 THEN CurrentBalance ELSE 0 END) NetWorth,

        COUNT(*) TotalActiveAccounts,

        0 AssertIncreasePercentage,
        0 LiabilitiesIncreasePercentage,
        0 NetWorthIncreasePercentage
    FROM Accounts
    WHERE UserId=@UserId
      AND StatusValue='ACTIVE';

    --------------------------------------------------
    -- Account Details
    --------------------------------------------------

    SELECT
        *
    FROM Accounts
    WHERE UserId=@UserId
      AND StatusValue='ACTIVE'
    ORDER BY DisplayOrder;

    --------------------------------------------------
    -- Net Worth Trend
    --------------------------------------------------

    SELECT
        SnapshotDate AS [Date],
        NetWorth
    FROM NetWorthHistory
    WHERE UserId=@UserId
    ORDER BY SnapshotDate;

    --------------------------------------------------
    -- Account Type Summary
    --------------------------------------------------

    SELECT
        AccountTypeValue AS AccountType,
        SUM(CurrentBalance) TotalBalance
    FROM Accounts
    WHERE UserId=@UserId
    GROUP BY AccountTypeValue;

    --------------------------------------------------
    -- Asset Allocation
    --------------------------------------------------

    ;WITH AssetCTE AS
    (
        SELECT
            AccountTypeValue,
            SUM(CurrentBalance) TotalBalance
        FROM Accounts
        WHERE UserId=@UserId
          AND AccountSideValue='ASSET'
        GROUP BY AccountTypeValue
    )
    SELECT
        AccountTypeValue AccountType,
        TotalBalance,
        CAST(
             TotalBalance * 100.0 /
             SUM(TotalBalance) OVER()
             AS DECIMAL(18,2)
        ) Percentage
    FROM AssetCTE;

END