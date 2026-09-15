using MyMoneyMate.Domain.DTO;
using MyMoneyMate.Application.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Formats.Asn1;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Import
{
    public class CSVImporter : IImporter
    {
        public bool CanImport(string fileName, string? contentType = null)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TransactionImportRowDTO> ReadTransactions(Stream stream)
        {
           throw new NotImplementedException();
        }
    }
}
