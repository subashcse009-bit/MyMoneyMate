using MyMoneyMate.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Interfaces
{
    public interface IImporter
    {
        bool CanImport(string fileName, string? contentType = null);
        IEnumerable<TransactionImportRow> ReadTransactions(Stream stream);
    }
}
