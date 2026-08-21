using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    using System.ComponentModel.DataAnnotations;

    public class ImportBatch
    {
        public int ImportBatchId { get; set; }

        [MaxLength(255)]
        public string FileName { get; set; } = string.Empty;

        public int TotalRecords { get; set; }

        public int TotalSuccessRecords { get; set; }

        public int TotalFailedRecords { get; set; }

        public string? Remarks { get; set; }

        public int? StatusId { get; set; }

        //Pending, Processing, Completed, CompletedWithErrors, Failed, Cancelled
        public string? StatusValue { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime ModifiedDate { get; set; }

        public int UpdateSeq { get; set; }
    }
}
