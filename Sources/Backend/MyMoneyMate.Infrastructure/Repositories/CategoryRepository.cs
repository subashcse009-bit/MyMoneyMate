using Microsoft.EntityFrameworkCore;
using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Infrastructure.Repositories
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly MyMoneyMateDBContext _context;
        public CategoryRepository(MyMoneyMateDBContext context)
        {
            _context = context;
        }

        public async Task<Category> GetByNameAsync(string name)
        {
            return await _context.Categories.FirstOrDefaultAsync(c => c.CategoryName == name && c.StatusValue == "ACTV");
        }
    }
}
