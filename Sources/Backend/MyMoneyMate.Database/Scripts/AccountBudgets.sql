INSERT INTO dbo.AccountBudgets(AccountId, BudgetAmount, StartDate, EndDate, Description, Notes, 
    StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
     VALUES
           (1, 102389, '2026-03-01', NULL, '', '',
           1, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1),
           (7, 30000, '2026-03-01', NULL, '', '',
           1, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1),
           (8, 8800, '2026-03-01', NULL, '', '',
           1, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1)