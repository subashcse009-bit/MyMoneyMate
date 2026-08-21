DECLARE @CodeId INT;

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'ImportBatchStatus')
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1000, 'ImportBatchStatus', '', '2026-03-01', NULL
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

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'TransactionStagingStatus')
BEGIN
    INSERT INTO dbo.Codes (CodeId, Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1001, 'TransactionStagingStatus', '', '2026-03-01', NULL
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


IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'Status')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Status', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'CategoryNature')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CategoryNature', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'CategoryType')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CategoryType', '', '2026-03-01', NULL
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

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