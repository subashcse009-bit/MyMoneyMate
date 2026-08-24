IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'HDFC' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('HDFC', 1002, 'BAAC', 'HDFC Bank', '123456',
            104847.59, 0, 0, 0, '2026-03-01', NULL,
            1003, 'ASST',1,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'SBI' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('SBI', 1002, 'BAAC', 'SBI Bank', '789012',
            0, 0, 0, 0, '2026-03-01', NULL,
            1003, 'ASST',2,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'CUB' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CUB', 1002, 'BAAC', 'CUB Bank', '345678',
            25980, 0, 0, 0, '2026-03-01', NULL,
            1003, 'ASST',3,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'Cash' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Cash', 1002, 'CASH', 'Cash', 'CASH001',
            500, 0, 0, 0, '2026-03-01', NULL,
            1003, 'ASST',4,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'Loan' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Loan', 1002, 'LOAN', 'Loan', 'LOAN001',
            -328431, 0, 0, 0, '2026-03-01', NULL,
            1003, 'LIAB',5,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'HDFC Credit Card' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('HDFC Credit Card', 1002, 'CCRD', 'HDFC Bank', 'CCRD001',
            0, 0, 80000, 0, '2026-03-01', NULL,
            1003, 'ASST',7,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'HDFC Food Card' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('HDFC Food Card', 1002, 'FCRD', 'HDFC Bank', 'FCRD001',
            0, 0, 0, 0, '2026-03-01', NULL,
            1003, 'ASST',8,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'PF' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('PF', 1002, 'PRFU', 'Private Fund', 'PRFU001',
            937523, 0, 0, 0, '2026-03-01', NULL,
            1003, 'ASST',9,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Accounts WHERE AccountName = 'PPF' AND StatusValue = 'ACTV')
BEGIN
    INSERT INTO dbo.Accounts (AccountName, AccountTypeId, AccountTypeValue,Institution, AccountNumber,
            OpeningBalance,CurrentBalance, CreditLimit,InterestRate, StartDate, MaturityDate,
            AccountSideId, AccountSideValue, DisplayOrder, StatusID, StatusValue
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('PPF', 1002, 'PPFA', 'PPF', 'PPFA002',
            166509, 0, 0, 0, '2026-03-01', NULL,
            1003, 'ASST',10,  1001, 'ACTV',
            'System', GETDATE(), 'System', GETDATE(), 1);
END
GO