using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DocumentUploadAndViewer.Models
{
    public class UploadModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Accession ID is required.")]
        public int AccessionID { get; set; }
        public string FilePath { get; set; }
        public long FileSize { get; set; }
        public string FileType { get; set; }
        public string FileName { get; set; }
        public DateTime UploadDate { get; set; }
        public int Version { get; set; }
        
        [Required(ErrorMessage = "File is required.")]
        public HttpPostedFileBase File { get; set; }
        public string Reason { get; set; }

    }
}