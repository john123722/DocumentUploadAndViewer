using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DocumentUploadAndViewer.Models;
using DocumentUploadAndViewer.DataAccessLayer;
using System.Configuration;
using System.IO.Compression;
namespace DocumentUploadAndViewer.Controllers
{
    public class HomeController : Controller
    {
        private readonly DAL con = new DAL();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult UploadFiles()
        {

            return View();
        }

        [HttpPost]
        public ActionResult UploadFiles(UploadModel fileModel)
        {
            if (ModelState.IsValid)
            {
                if (Request.Files != null && Request.Files.Count > 0)
                {
                    int version = CheckAccessionId(fileModel.AccessionID);

                    if (version == -1)
                    {
                        for (int i = 0; i < Request.Files.Count; i++)
                        {
                            var file = Request.Files[i];

                            if (file != null && file.ContentLength > 0)
                            {
                                UploadModel fileCopy = new UploadModel
                                {
                                    AccessionID = fileModel.AccessionID,
                                    Version = fileModel.Version,
                                    FileName = Path.GetFileName(file.FileName),
                                    FileSize = file.ContentLength,
                                    FileType = Path.GetExtension(file.FileName)?.TrimStart('.').ToLower(),
                                    UploadDate = DateTime.Now
                                };

                                string uploadFolderPath = ConfigurationManager.AppSettings["UploadFolderPath"];
                                string folderPath = Server.MapPath(uploadFolderPath);

                                // Create the folder if it doesn't exist
                                if (!Directory.Exists(folderPath))
                                {
                                    Directory.CreateDirectory(folderPath);
                                }

                                string originalFileName = file.FileName;
                                string uniqueFileName = Guid.NewGuid().ToString();
                                string filePath = Path.Combine(folderPath, uniqueFileName + Path.GetExtension(originalFileName));

                                // Save the file without compression
                                file.SaveAs(filePath);

                                fileCopy.FilePath = filePath;
                                fileCopy.FileName = uniqueFileName;

                                con.Upload(fileCopy);
                            }
                        }

                        return RedirectToAction("Index");
                    }
                    else
                    {
                        fileModel.Version = version + 1;
                        return View("ReuploadConfirmation", fileModel);
                    }
                }
            }

            return View();
        }


        public void CompressFile(Stream sourceFileStream, string destinationFilePath)
        {
            using (FileStream destinationFileStream = new FileStream(destinationFilePath, FileMode.Create))
            {
                using (ZipArchive archive = new ZipArchive(destinationFileStream, ZipArchiveMode.Create))
                {
                    ZipArchiveEntry entry = archive.CreateEntry("Path.GetFileName(fileModel.FileName)");

                    using (Stream entryStream = entry.Open())
                    {
                        sourceFileStream.CopyTo(entryStream);
                    }
                }
            }
        }


        public ActionResult ViewFiles()
        {
            var data = con.GetFiles();
            return View(data);
        }
         public ActionResult ViewFile(string filepath)
        {
            string fileExtension = Path.GetExtension(filepath)?.ToLower();
            string contentType;
            switch (fileExtension)
            {
                case ".pdf":
                    contentType = "application/pdf";
                    break;
                case ".png":
                    contentType = "image/png";
                    break;
                case ".jpg":
                case ".jpeg":
                    contentType = "image/jpeg";
                    break;
                default:
                    contentType = "application/octet-stream";
                    break;
            }

            return File(filepath, contentType);
        }




        public int CheckAccessionId(int accessionId)
        {
            int version = con.GetMaxVersionForAccessionId(accessionId);
            return version;
        }

        [HttpPost]
        public ActionResult ReuploadConfirmed(UploadModel fileModel)
        {
            if (ModelState.IsValid)
            {
                if (Request.Files != null && Request.Files.Count > 0)
                {
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        var file = Request.Files[i];

                        if (file != null && file.ContentLength > 0)
                        {
                            UploadModel fileCopy = new UploadModel
                            {
                                AccessionID = fileModel.AccessionID,
                                Version = fileModel.Version,
                                FileName = Path.GetFileName(file.FileName),
                                FileSize = file.ContentLength,
                                FileType = Path.GetExtension(file.FileName)?.TrimStart('.').ToLower(),
                                UploadDate = DateTime.Now,
                                Reason = fileModel.Reason
                            };

                            string uploadFolderPath = ConfigurationManager.AppSettings["UploadFolderPath"];
                            string folderPath = Server.MapPath(uploadFolderPath);

                            // Create the folder if it doesn't exist
                            if (!Directory.Exists(folderPath))
                            {
                                Directory.CreateDirectory(folderPath);
                            }

                            string originalFileName = file.FileName;
                            string uniqueFileName = Guid.NewGuid().ToString();
                            string filePath = Path.Combine(folderPath, uniqueFileName + Path.GetExtension(originalFileName));

                            // Save the file without compression
                            file.SaveAs(filePath);

                            fileCopy.FilePath = filePath;
                            fileCopy.FileName = uniqueFileName;

                            con.Upload(fileCopy);
                        }
                    }

                    return RedirectToAction("Index");
                }
            }
            

            return View("ReuploadConfirmation", fileModel);
        }

        public ActionResult ViewFilesById(int id)
        {
            ViewBag.accessionid = id;
            var result = con.ViewById(id);
            return View(result);
        }

        public ActionResult ViewAllFiles(int id)
        {
            var result = con.ViewFilesById(id);
            return View(result);
        }
    }
}