using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Repository.IRepository
{
    public interface IAccountRepository
    {
        Task<Account> GetById(int id);
        Task<Account> GetByNameAsync(string name);

        Task<IEnumerable<Account>> GetAllAsync();

        Task UpdateAccountCurrentBalanceAsync(Account account);
    }
}
