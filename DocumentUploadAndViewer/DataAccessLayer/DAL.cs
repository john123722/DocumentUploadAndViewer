using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;
using DocumentUploadAndViewer.Models;
using System.Reflection;

namespace DocumentUploadAndViewer.DataAccessLayer
{
    public class DAL
    {
        private readonly string constring = ConfigurationManager.ConnectionStrings["StringConnection"].ToString();
        public bool Upload(UploadModel model)
        {
            using (SqlConnection conn = new SqlConnection(constring))
            {
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "SP_UploadFiles";
                command.Parameters.AddWithValue("@AccessionId", model.AccessionID);
                command.Parameters.AddWithValue("@FilePath", model.FilePath);
                command.Parameters.AddWithValue("@FileName", model.FileName);
                command.Parameters.AddWithValue("@FileType", model.FileType);
                command.Parameters.AddWithValue("@FileSize", model.FileSize);
                command.Parameters.AddWithValue("@UploadDate", model.UploadDate);
                if (model.Version>=0)
                {
                    command.Parameters.AddWithValue("@Version",model.Version);
                }
                else
                {
                    command.Parameters.AddWithValue("@Version", 0);
                }
                if(model.Reason != null)
                {
                    command.Parameters.AddWithValue("@Reason", model.Reason);
                }
                else
                {
                    command.Parameters.AddWithValue("@Reason","NULL");
                }
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
                return true;
            }
        }
        public List<UploadModel> GetFiles()
        {
            List<UploadModel> data = new List<UploadModel>();
            using (SqlConnection connection = new SqlConnection(constring))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "SP_DisplayFile";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                connection.Open();
                adapter.Fill(dt);
                connection.Close();
                foreach (DataRow dr in dt.Rows)
                {
                    data.Add(new UploadModel
                    {
                        AccessionID = (int)Convert.ToInt64(dr["AccessionId"]),
                        FileName = dr["FileName"].ToString(),
                        FileSize = (int)Convert.ToInt64(dr["FileSize"]),
                        FileType = dr["FileType"].ToString(),
                        FilePath = dr["FilePath"].ToString(),
                        UploadDate = Convert.ToDateTime(dr["UploadDate"]),
                    });
                    
                }
                return data;
            }
        }



        public int GetMaxVersionForAccessionId(int accessionId)
        {
            int maxVersion = 0;

            using (SqlConnection connection = new SqlConnection(constring))
            {
                connection.Open();

                string query = "SELECT MAX(Version) FROM UploadTable WHERE AccessionId = @AccessionId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@AccessionId", accessionId);
                    object result = command.ExecuteScalar();

                    if (result != DBNull.Value && result != null)
                    {
                        maxVersion = Convert.ToInt32(result);
                    }
                    else
                    {
                        maxVersion = -1;
                    }
                }
            }

            return maxVersion;
        }

        public List<UploadModel> ViewById(int id)
        {
            List<UploadModel> data = new List<UploadModel>();
            using (SqlConnection connection = new SqlConnection(constring))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "SP_DisplayFileById";
                command.Parameters.AddWithValue("@AccessionId",id);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                connection.Open();
                adapter.Fill(dt);
                connection.Close();
                foreach (DataRow dr in dt.Rows)
                {
                    data.Add(new UploadModel
                    {
                        AccessionID = (int)Convert.ToInt64(dr["AccessionId"]),
                        FileName = dr["FileName"].ToString(),
                        FileSize = (int)Convert.ToInt64(dr["FileSize"]),
                        FileType = dr["FileType"].ToString(),
                        FilePath = dr["FilePath"].ToString(),
                        UploadDate = Convert.ToDateTime(dr["UploadDate"]),
                    });

                }
                return data;
            }
        }


        public List<UploadModel> ViewFilesById(int id)
        {
            List<UploadModel> data = new List<UploadModel>();
            using (SqlConnection connection = new SqlConnection(constring))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "SP_DisplayAllFileById";
                command.Parameters.AddWithValue("@AccessionId", id);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                connection.Open();
                adapter.Fill(dt);
                connection.Close();
                foreach (DataRow dr in dt.Rows)
                {
                    data.Add(new UploadModel
                    {
                        AccessionID = (int)Convert.ToInt64(dr["AccessionId"]),
                        FileName = dr["FileName"].ToString(),
                        FileSize = (int)Convert.ToInt64(dr["FileSize"]),
                        FileType = dr["FileType"].ToString(),
                        FilePath = dr["FilePath"].ToString(),
                        Version = (int)Convert.ToInt32(dr["Version"]),
                        UploadDate = Convert.ToDateTime(dr["UploadDate"]),
                        Reason = dr["Reason"].ToString(),
                    });

                }
                return data;
            }
        }

    }
}