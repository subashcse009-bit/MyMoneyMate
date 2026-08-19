using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class Codes
    {
        [Key]
        public int CodeId { get; set; }

        public string Name { get; set; }
        
        public string Description { get; set; }
        
        [Column(TypeName = "date")]
        public DateOnly StartDate {  get; set; }
        
        [Column(TypeName = "date")]
        public DateOnly? EndDate { get; set; }
        
        public string CreatedBy { get; set; }
        
        public DateTime CreatedDate { get; set; }
        
        public string ModifiedBy { get; set; }
        
        public DateTime ModifiedDate { get; set; }
        
        public int UpdateSeq { get; set; }
    }
}
