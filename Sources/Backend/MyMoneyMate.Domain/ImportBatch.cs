using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class ImportBatch
    {
        [Key]
        public int ImportBatchID {  get; set; }
        [Required]
        public string FileName {  get; set; }
        [Required]
        public DateTime ImportDate { get; set; }
        [Required]
        public int TotalRecords{ get; set; }
        [Required]
        public int TotalSuccessRecords {  get; set; }
        [Required]
        public int TotalFailedRecords { get; set; }
        [Required]
        public string Status { get; set; }
    }
}
