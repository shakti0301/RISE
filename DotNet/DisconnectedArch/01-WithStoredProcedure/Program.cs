using System;
using System.IO;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

class Program
{
    static void Main()
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json");

        IConfiguration config = builder.Build();

        string connStr = config.GetConnectionString("MyConn");

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            Console.WriteLine("Connected with DB");

            // ✅ ONE DataAdapter
            SqlDataAdapter da = new SqlDataAdapter("sp_GetEmployees", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            // INSERT
            da.InsertCommand = new SqlCommand("sp_InsertEmployee", conn);
            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            da.InsertCommand.Parameters.Add("@Name", SqlDbType.VarChar, 50, "Name");
            da.InsertCommand.Parameters.Add("@Salary", SqlDbType.Int, 0, "Salary");

            // UPDATE
            da.UpdateCommand = new SqlCommand("sp_UpdateEmployee", conn);
            da.UpdateCommand.CommandType = CommandType.StoredProcedure;
            da.UpdateCommand.Parameters.Add("@Id", SqlDbType.Int, 0, "Id");
            da.UpdateCommand.Parameters.Add("@Name", SqlDbType.VarChar, 50, "Name");
            da.UpdateCommand.Parameters.Add("@Salary", SqlDbType.Int, 0, "Salary");

            // DELETE
            da.DeleteCommand = new SqlCommand("sp_DeleteEmployee", conn);
            da.DeleteCommand.CommandType = CommandType.StoredProcedure;
            da.DeleteCommand.Parameters.Add("@Id", SqlDbType.Int, 0, "Id");

            // Fetch data
            DataSet ds = new DataSet();
            da.Fill(ds, "Employee");

            // PRINT DATA
            Console.WriteLine("Id | Name | Salary");
            Console.WriteLine("------------------------");

            foreach (DataRow row in ds.Tables["Employee"].Rows)
            {
                Console.WriteLine($"{row["Id"]} | {row["Name"]} | {row["Salary"]}");
                Console.WriteLine("------------------------");
            }

            // INSERT
            DataRow newRow = ds.Tables["Employee"].NewRow();
            newRow["Name"] = "Shakti";
            newRow["Salary"] = 50000;
            ds.Tables["Employee"].Rows.Add(newRow);

            // UPDATE
            ds.Tables["Employee"].Rows[0]["Salary"] = 60000;

            // DELETE
            ds.Tables["Employee"].Rows[0].Delete();

            // APPLY CHANGES
            da.Update(ds, "Employee");

            Console.WriteLine("Changes applied successfully!");
        }
    }
}