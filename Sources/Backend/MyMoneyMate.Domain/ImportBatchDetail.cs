using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class ImportBatchDetail
    {
        [Key]
        public int ImportBatchDetailId { get; set; }
        [Required]
        public int ImportBatchId { get; set; }
        [Required]
        public int RecordNumber { get; set; }
        [Required]
        public string Status { get; set; }
        public string ErrorMessage {  get; set; }
    }
}
