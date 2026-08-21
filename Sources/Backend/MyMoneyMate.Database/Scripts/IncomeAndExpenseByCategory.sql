select 
	DISTINCT
	CategoryName,
	MONTH(TransactionDate) MonthNumber,
	SUM(ExpenseAmount) OVER 
	(PARTITION BY MONTH(TransactionDate), CategoryName) ExpneseAmountByCategory,	
	SUM(IncomeAmount) OVER 
	(PARTITION BY MONTH(TransactionDate), CategoryName) IncomeAmountByCategory
from TransactionStaging
where CategoryName NOT IN ('', 'Opening Balance')