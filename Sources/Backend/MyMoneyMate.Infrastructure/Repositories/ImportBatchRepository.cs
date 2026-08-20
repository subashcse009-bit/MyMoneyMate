using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using MyMoneyMate.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Repository
{
    public class ImportBatchRepository : IImportBatchRepository
    {
        private readonly MyMoneyMateDBContext _context;
        public ImportBatchRepository(MyMoneyMateDBContext context)
        {
            _context = context;
        }

        public int SaveAsync(ImportBatch entity)
        {
            _context.ImportBatch.Add(entity);
            _context.SaveChanges();
            return entity.ImportBatchId;
        }
    }
}
