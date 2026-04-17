using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using Microsoft.Extensions.Configuration;

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

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Employee", conn);

            // INSERT
            da.InsertCommand = new SqlCommand(
                "INSERT INTO Employee(Name, Salary) VALUES(@Name, @Salary)", conn);
            da.InsertCommand.Parameters.Add("@Name", SqlDbType.VarChar, 50, "Name");
            da.InsertCommand.Parameters.Add("@Salary", SqlDbType.Int, 0, "Salary");

            // UPDATE
            da.UpdateCommand = new SqlCommand(
                "UPDATE Employee SET Name=@Name, Salary=@Salary WHERE Id=@Id", conn);
            da.UpdateCommand.Parameters.Add("@Name", SqlDbType.VarChar, 50, "Name");
            da.UpdateCommand.Parameters.Add("@Salary", SqlDbType.Int, 0, "Salary");
            da.UpdateCommand.Parameters.Add("@Id", SqlDbType.Int, 0, "Id");

            // DELETE
            da.DeleteCommand = new SqlCommand(
                "DELETE FROM Employee WHERE Id=@Id", conn);
            da.DeleteCommand.Parameters.Add("@Id", SqlDbType.Int, 0, "Id");

            DataSet ds = new DataSet();
            da.Fill(ds, "Employee");

            DataTable table = ds.Tables["Employee"];

            Console.WriteLine("Before Changes:");
            foreach (DataRow row in table.Rows)
            {
                Console.WriteLine($"{row["Id"]} {row["Name"]} {row["Salary"]}");
            }

            // INSERT
            DataRow newRow = table.NewRow();
            newRow["Name"] = "Happy";
            newRow["Salary"] = 50000;
            table.Rows.Add(newRow);

            // UPDATE (update first row)
            if (table.Rows.Count > 0)
            {
                table.Rows[0]["Salary"] = 99999;
            }

            // DELETE (delete second row)
            if (table.Rows.Count > 1)
            {
                table.Rows[1].Delete();
            }

            // APPLY ALL CHANGES
            da.Update(ds, "Employee");

            Console.WriteLine("\nChanges applied!\n");

            // Reload
            ds.Clear();
            da.Fill(ds, "Employee");

            Console.WriteLine("After Changes:");
            foreach (DataRow row in ds.Tables["Employee"].Rows)
            {
                Console.WriteLine($"{row["Id"]} {row["Name"]} {row["Salary"]}");
            }
        }
    }
}