DECLARE @CodeId INT;

--DS1000 Account Module

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'AccountStatus' AND CodeId = 1001)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1001 ,'AccountStatus', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='AccountStatus';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'ACTV' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'ACTV', 'Active', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INAC' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INAC', 'InActive', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'AccountType' AND CodeId = 1002)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1002 ,'AccountType', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='AccountType';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'BAAC' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'BAAC', 'Bank Account', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'CASH' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'CASH', 'Cash', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'CRCD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'CRCD', 'Credit Card', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'FCRD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'FCRD', 'Food Card', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'LOAN' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'LOAN', 'Loan', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'MUFU' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'MUFU', 'Mutual Fund', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'LIFE' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'LIFE', 'Life Insurance', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'PRFU' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'PRFU', 'Private Fund', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'PPFA' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'PPFA', 'PPF', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'GOLD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'GOLD', 'Gold', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'AccountSide' AND CodeId = 1003)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1003 ,'AccountSide', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='AccountSide';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'ASST' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'ASST', 'Asset', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'LIAB' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'LIAB', 'Liability', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'EQUI' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'EQUI', 'Equity', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

--End Account Module

-- DS2000 Category Module

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'CategoryStatus' AND CodeId = 2001)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (2001 ,'CategoryStatus', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='CategoryStatus';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'ACTV' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'ACTV', 'Active', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INAC' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INAC', 'InActive', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

-- End Category Module

--DS3000 Import Batch Module

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'ImportBatchStatus' AND CodeId = 3001)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (3001, 'ImportBatchStatus', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='ImportBatchStatus';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'PEND' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'PEND', 'Pending', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'ACTV' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'ACTV', 'Active', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'COMP' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'COMP', 'Completed', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'COME' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'COME', 'CompletedWithErrors', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'FALD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'FALD', 'Failed', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'CANC' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'CANC', 'Cancelled', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'TransactionStagingStatus' AND CodeId = 3002)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (3002, 'TransactionStagingStatus', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='TransactionStagingStatus';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'PEND' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'PEND', 'Pending', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'VALD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'VALD', 'Valid', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INVD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INVD', 'Invalid', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'PRMD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'PRMD', 'Promoted', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'TransationStatusSourceType' AND CodeId = 3003)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (3003, 'TransationStatusSourceType', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='TransationStatusSourceType';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'IMBT' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'IMBT', 'Import Batch', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'MANL' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'MANL', 'Manual', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'BSYN' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'BSYN', 'Bank Sync', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'BRFD' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'BRFD', 'Broker Feed', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'SCTN' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'SCTN', 'Scheduled Transaction', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'MIGR' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'MIGR', 'Migration', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

-- End Import Batch Module

-- DS4000 Transaction Module

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'TransactionType' AND CodeId = 4001)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (4001, 'TransactionType', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='TransactionType';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INCO' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INCO', 'Income', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'EXPE' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'EXPE', 'Expense', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'TRAN' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'TRAN', 'Transfer', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'TransactionStatus' AND CodeId = 4002)
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (4002, 'TransactionStatus', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='TransactionStatus';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'ACTV' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'ACTV', 'Active', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INAC' AND CodeId = @CodeId)
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INAC', 'InActive', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

-- End Transaction Module

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'CategoryNature')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CategoryNature', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'CategoryType')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CategoryType', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='Status';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'ACTV')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'ACTV', 'Active', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INAC')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INAC', 'InActive', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='CategoryNature';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'NEED')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'NEED', 'Need', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'WANT')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'WANT', 'Want', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'SAVN')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'SAVN', 'Savings', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='CategoryType';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'OPEX')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'OPEX', 'Operating Expense', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'HLON')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'HLON', 'Hidden Loan', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'FINC')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'FINC', 'Finacing', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INCO')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INCO', 'Income', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INVS')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INVS', 'Investment', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'TRNS')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'TRNS', 'Transfer', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'LERE')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'LERE', 'Lending/Recovery', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END