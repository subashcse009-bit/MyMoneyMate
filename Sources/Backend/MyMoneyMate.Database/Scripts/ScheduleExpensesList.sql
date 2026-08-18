DECLARE @AccountID INT;
DECLARE @CategoryID INT;
DECLARE @StartDate DATE = '2026-03-01';

SELECT @AccountID = AccountID FROM dbo.Accounts WHERE AccountName = 'HDFC';
SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Daily Expense';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 1 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 4500)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1, @AccountID, @CategoryID, 4500, 0, @StartDate, NULL,
        'UPI Week 1', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 1 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 2500)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1, @AccountID, @CategoryID, 2500, 0, @StartDate, NULL,
        'Suganya SBI', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 8 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 2500)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (8, @AccountID, @CategoryID, 2500, 0, @StartDate, NULL,
        'UPI Week 2', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 15 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 2500)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (15, @AccountID, @CategoryID, 2500, 0, @StartDate, NULL,
        'UPI Week 3', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 22 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 2500)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (22, @AccountID, @CategoryID, 2500, 0, @StartDate, NULL,
        'UPI Week 4', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Account Transfer';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 1 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 1000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1, @AccountID, @CategoryID, 1000, 0, @StartDate, NULL,
        'To Subash CUB', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Parental Support';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 1 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 4000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1, @AccountID, @CategoryID, 4000, 0, @StartDate, NULL,
        'Parental Support', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Mutual Funds';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 2 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 10000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (2, @AccountID, @CategoryID, 10000, 0, @StartDate, NULL,
        'Mutual Funds', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 3 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 8000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (3, @AccountID, @CategoryID, 8000, 0, @StartDate, NULL,
        'Mutual Funds', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Life Insurance';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 4 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 5000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (4, @AccountID, @CategoryID, 5000, 0, @StartDate, NULL,
        'Life Insurance', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 5 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 5000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (5, @AccountID, @CategoryID, 5000, 0, @StartDate, NULL,
        'Life Insurance', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 9 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 5020)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (9, @AccountID, @CategoryID, 5020, 0, @StartDate, NULL,
        'Life Insurance', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 10 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 1000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (10, @AccountID, @CategoryID, 1000, 0, @StartDate, '07-10-2026',
        'Life Insurance', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 13 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 5000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (13, @AccountID, @CategoryID, 5000, 0, @StartDate, NULL,
        'Life Insurance', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Life Insurance Income';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 4 AND AccountId = @AccountID AND CategoryId = @CategoryID AND IncomeAmount = 1006)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (4, @AccountID, @CategoryID, 0, 1006, @StartDate, NULL,
        'Life Insurance Income', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 5 AND AccountId = @AccountID AND CategoryId = @CategoryID AND IncomeAmount = 1840)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (5, @AccountID, @CategoryID, 0, 1840, @StartDate, NULL,
        'Life Insurance Income', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'School Fees';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 5 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 8000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (5, @AccountID, @CategoryID, 8000, 0, @StartDate, NULL,
        'School Fees', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Hidden Loan';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 6 AND AccountId = @AccountID AND CategoryId = @CategoryID AND IncomeAmount = 74807)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (6, @AccountID, @CategoryID, 0, 74807, @StartDate, NULL,
        'Hidden Loan', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 7 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 42455)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (7, @AccountID, @CategoryID, 42455, 0, @StartDate, NULL,
        'Hidden Loan', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 10 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 32352)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (10, @AccountID, @CategoryID, 32352, 0, @StartDate, NULL,
        'Hidden Loan', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Rent';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 6 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 16500)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (6, @AccountID, @CategoryID, 16500, 0, @StartDate, NULL,
        'Rent', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Loan';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 7 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 16369)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (7, @AccountID, @CategoryID, 16369, 0, @StartDate, '07-07-2027',
        'HDFC Loan', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 8 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 5000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (8, @AccountID, @CategoryID, 5000, 0, @StartDate, '01-08-2028',
        'Gaja Loan', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Second Income';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 13 AND AccountId = @AccountID AND CategoryId = @CategoryID AND IncomeAmount = 10000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (13, @AccountID, @CategoryID, 0, 10000, @StartDate, NULL,
        'Maya Krish', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @AccountID = AccountID FROM dbo.Accounts WHERE AccountName = 'CUB';
SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Account Transfer';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 1 AND AccountId = @AccountID AND CategoryId = @CategoryID AND IncomeAmount = 1000)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (1, @AccountID, @CategoryID, 0, 1000, @StartDate, NULL,
        'From HDFC', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

SELECT @AccountID = AccountID FROM dbo.Accounts WHERE AccountName = 'HDFC Credit Card';
SELECT @CategoryID = CategoryID FROM dbo.Categories WHERE CategoryName = 'Life Insurance';

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 4 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 10596)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (4, @AccountID, @CategoryID, 10596, 0, @StartDate, NULL,
        'Life Insurance', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM dbo.ScheduledExpenses WHERE ScheduledDay = 8 AND AccountId = @AccountID AND CategoryId = @CategoryID AND ExpenseAmount = 8500)
BEGIN
    INSERT INTO dbo.ScheduledExpenses (ScheduledDay, AccountId, CategoryId,ExpenseAmount, IncomeAmount, StartDate, EndDate,
            Description, Notes, StatusID, StatusValue, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, UpdateSeq)
    VALUES (8, @AccountID, @CategoryID, 8500, 0, @StartDate, NULL,
        'Life Insurance', '', 0, 'ACTV', 'System', GETDATE(), 'System', GETDATE(), 1);
END