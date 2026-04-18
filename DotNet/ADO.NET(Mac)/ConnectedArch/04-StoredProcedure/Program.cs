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

        using(SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            Console.WriteLine("\n Connected");

            SqlCommand insertCmd = new SqlCommand("InsertStudent", conn);
            insertCmd.CommandType = CommandType.StoredProcedure;

            insertCmd.Parameters.AddWithValue("@name", "Shakti(sp)");
            insertCmd.Parameters.AddWithValue("@age", 22);

            int rows1 = insertCmd.ExecuteNonQuery();

            Console.WriteLine($"{rows1} row affected");


            SqlCommand selectCmd = new SqlCommand("GetStudents", conn);
            selectCmd.CommandType = CommandType.StoredProcedure;
            
            SqlDataReader reader = selectCmd.ExecuteReader();

            Console.WriteLine("\n Data \n");

            while (reader.Read())
            {
                Console.WriteLine(reader["Id"] + " - " + reader["Name"] + " - " + reader["Age"]);
            }
            conn.Close();
        }
    }
}