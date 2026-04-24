using Microsoft.Data.SqlClient;
using System.Data;
using EmployeeApplication.Models;

namespace EmployeeApplication.Services
{
    public class EmployeeService
    {
        private readonly string _connectionString;

        public EmployeeService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("DefaultConnection");
        }

        // GET ALL
        public List<Employee> GetEmployees()
        {
            List<Employee> list = new List<Employee>();

            using SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("GetEmployees", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Employee
                {
                    Id = (int)reader["Id"],
                    Name = reader["Name"].ToString(),
                    Salary = (decimal)reader["Salary"]
                });
            }

            return list;
        }

        // ADD
        public void AddEmployee(Employee emp)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("AddEmployee", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", emp.Name);
            cmd.Parameters.AddWithValue("@Salary", emp.Salary);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        // GET BY ID
        public Employee GetEmployeeById(int id)
        {
            Employee emp = null;

            using SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("GetEmployeeById", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", id);

            con.Open();
            var reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                emp = new Employee
                {
                    Id = (int)reader["Id"],
                    Name = reader["Name"].ToString(),
                    Salary = (decimal)reader["Salary"]
                };
            }

            return emp;
        }

        // UPDATE
        public void UpdateEmployee(Employee emp)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("UpdateEmployee", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", emp.Id);
            cmd.Parameters.AddWithValue("@Name", emp.Name);
            cmd.Parameters.AddWithValue("@Salary", emp.Salary);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        // DELETE
        public void DeleteEmployee(int id)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("DeleteEmployee", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
}