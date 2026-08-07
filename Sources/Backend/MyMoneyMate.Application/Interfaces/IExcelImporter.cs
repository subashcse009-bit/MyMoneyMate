using MyMoneyMate.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Interfaces
{
    public interface IExcelImporter
    {
        List<TransactionImportRow> ReadTransactions(Stream stream);
    }
}
