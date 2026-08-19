IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'HDFC' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('HDFC', 'Bank', 104847.59, 0, 1,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'SBI' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('SBI', 'Bank', 0, 0, 2,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'CUB' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CUB', 'Bank', 25980, 0, 3,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'Cash' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Cash', 'Cash', 500, 0, 4,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'Loan' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Loan', 'Loan', -328431, 0, 5,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'Lending/Recovery' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Lending/Recovery', 'Lending/Recovery', 0, 0, 6,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'HDFC Credit Card' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('HDFC Credit Card', 'Credit Card', 0, 80000, 7,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'HDFC Food Card' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('HDFC Food Card', 'Food Card', 2227.36, 0, 8,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'PF' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('PF', 'Investment', 937523, 0, 9,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'PPF' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('PPF', 'Investment', 166509, 0, 10,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'Life Insurance' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Life Insurance', 'Investment', 2250000, 0, 11,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'Mutual Fund' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountType ,OpeningBalance ,CreditLimit, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Mutual Fund', 'Investment', 157199, 0, 12,  1, 'ACTV',
        'System', GETDATE(), 'System', GETDATE(), 1);
END
GO