using MyMoneyMate.Application.DTO;
using MyMoneyMate.Application.Interfaces;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace MyMoneyMate.Application.Import
{
    public class ExcelImporter : IImporter
    {
        public bool CanImport(string fileName, string? contentType = null)
        {
            var ext = Path.GetExtension(fileName);
            return ext.Equals(".xlsx", StringComparison.OrdinalIgnoreCase) ||
                   ext.Equals(".xls", StringComparison.OrdinalIgnoreCase) ||
                   (contentType != null && contentType.Contains("spreadsheet"));
        }

        public IEnumerable<TransactionImportRow> ReadTransactions(Stream stream)
        {
            var rows = new List<TransactionImportRow>();
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using var package = new ExcelPackage(stream);
            var sheet = package.Workbook.Worksheets[0];
            var rowCount = sheet.Dimension.Rows;

            for (int row = 2; row <= rowCount; row++)
            {
                rows.Add(new TransactionImportRow
                {
                    TransactionDate = DateTime.TryParse(sheet.Cells[row, 1].Text, out var transactionDate) ? transactionDate : DateTime.MinValue,
                    Description = sheet.Cells[row, 2].Text,
                    IncomeAmount = decimal.TryParse(sheet.Cells[row, 3].Text, out var incomeAmount) ? incomeAmount : 0m,
                    ExpenseAmount = decimal.TryParse(sheet.Cells[row, 4].Text, out var expenseAmount) ? expenseAmount : 0m,
                    Category = sheet.Cells[row, 5].Text,
                    Account = sheet.Cells[row, 6].Text
                });
            }

            return rows;
        }
    }
}
