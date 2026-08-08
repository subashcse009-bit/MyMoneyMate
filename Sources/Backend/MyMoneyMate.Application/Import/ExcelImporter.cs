using MyMoneyMate.Application.DTO;
using MyMoneyMate.Application.Interfaces;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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

            using var package = new ExcelPackage(stream);
            var sheet = package.Workbook.Worksheets[0];
            var rowCount = sheet.Dimension.Rows;

            for (int row = 2; row <= rowCount; row++)
            {
                rows.Add(new TransactionImportRow
                {
                    TransactionDate = sheet.Cells[row, 1].Text,
                    Description = sheet.Cells[row, 2].Text,
                    IncomeAmount = sheet.Cells[row, 3].Text,
                    ExpenseAmount = sheet.Cells[row, 4].Text,
                    Category = sheet.Cells[row, 5].Text,
                    Account = sheet.Cells[row, 6].Text
                });
            }

            return rows;
        }
    }
}
