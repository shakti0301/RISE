using Microsoft.Data.SqlClient;
using System.Data;
using CompanyApp.Models;

namespace CompanyApp.Services
{
    public class DepartmentService
    {
        private readonly string _connectionString;

        public DepartmentService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("DefaultConnection");
        }

        public List<Department> GetDepartments()
        {
            List<Department> list = new List<Department>();

            using SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("GetDepartments", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Department
                {
                    Id = (int)reader["Id"],
                    Name = reader["Name"].ToString()
                });
            }

            return list;
        }
    }
}