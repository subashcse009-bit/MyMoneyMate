IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Daily Expense' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Daily Expense', 1, 1,22000, 1, 0, 0,
        1, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Fuel' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Fuel', 1, 1,2000, 1, 0, 0,
        2, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Groceries' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Groceries', 1, 1,4000, 1, 0, 0,
        3, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Rent' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Rent', 1, 1,16500, 1, 0, 0,
        4, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'School Fees' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('School Fees', 1, 1,8000, 1, 0, 0,
        5, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Parental Support' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Parental Support', 1, 1,4000, 1, 0, 0,
        6, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Loan Disbursement' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Loan Disbursement', 1, 1,21369, 1, 0, 0,
        7, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Food' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Food', 2, 1,2000, 1, 0, 0,
        8, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Shopping' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Shopping', 2, 1,2000, 1, 0, 0,
        9, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Medical' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Medical', 2, 1,4000, 1, 0, 0,
        10, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Bills' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Bills', 2, 1,2000, 1, 0, 0,
        11, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Others' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Others', 2, 1,2000, 1, 0, 0,
        12, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Mutual Funds' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Mutual Funds', 3, 1,18000, 0, 0, 1,
        13, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Life Insurance' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Life Insurance', 3, 1,39116, 0, 0, 1,
        14, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'PF' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('PF', 3, 1, 0, 0, 0, 1,
        15, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'PPF' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('PPF', 3, 1, 0, 0, 0, 1,
        16, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Salary' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Salary', 2, 4, 0, 0, 1, 0,
        17, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Second Income' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Second Income', 2, 4, 0, 0, 1, 0,
        18, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Annual Income' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Annual Income', 2, 4, 0, 0, 1, 0,
        19, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Mutual Fund Income' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Mutual Fund Income', 2, 4, 0, 0, 1, 0,
        20, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Life Insurance Income' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Life Insurance Income', 2, 4, 0, 0, 1, 0,
        21, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Account Transfer' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Account Transfer', 2, 4, 0, 0, 0, 0,
        22, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Categories WHERE CategoryName = 'Hidden Loan' AND StatusCode = 'ACTV')
BEGIN
    INSERT INTO dbo.Categories (CategoryName, NSWID ,TransactionTypeID ,Budget ,IncludeExpense ,IncludeIncome, IncludeSavings
           ,DisplayOrder, StatusID, StatusCode, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Hidden Loan', 2, 4, 0, 0, 0, 0,
        23, 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

