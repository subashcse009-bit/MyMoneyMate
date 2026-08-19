IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'Status')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('Status', '', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'CategoryNature')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CategoryNature', '', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Codes WHERE Name = 'CategoryType')
BEGIN
    INSERT INTO dbo.Codes (Name, Description ,StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES ('CategoryType', '', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END
GO

DECLARE @CodeId INT;

SELECT @CodeId = CodeID FROM Codes WHERE Name ='Status';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'ACTV')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'ACTV', 'Active', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INAC')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INAC', 'InActive', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='CategoryNature';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'NEED')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'NEED', 'Need', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'WANT')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'WANT', 'Want', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INVT')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INVT', 'Investmet', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CodeId = CodeID FROM Codes WHERE Name ='CategoryType';

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'OPEX')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'OPEX', 'Operating Expense', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'HLON')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'HLON', 'Hidden Loan', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'FINC')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'FINC', 'Finacing', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INCO')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INCO', 'Income', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'INVS')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'INVS', 'Investment', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'TRNS')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'TRNS', 'Transfer', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.CodeValues WHERE CodeValue = 'LERE')
BEGIN
    INSERT INTO dbo.CodeValues(CodeId, CodeValue, Description, StartDate ,EndDate
           ,CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (@CodeId, 'LERE', 'Lending/Recovery', '2026-03-01', '2026-03-01'
        ,'System', GETDATE(), 'System', GETDATE(), 1);
END