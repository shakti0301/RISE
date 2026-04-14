using System;
using System.IO;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

class Program
{

    //Execute Reader
    // ExecuteReader is a method of the SqlCommand class used to execute SQL statements (typically SELECT) that return multiple rows from a database. It returns a SqlDataReader object, which provides a high-performance, forward-only, and read-only stream of data. 
    static void Main()
    {
        // 1. Read connection string from appsettings.json
        var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json");

        IConfiguration config = builder.Build();
        string connStr = config.GetConnectionString("MyConn");

        // 2. using block (auto close connection)
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            Console.WriteLine("Connected to DB\n");

            // 3. SQL Query
            SqlCommand cmd = new SqlCommand("SELECT * FROM Students", conn);

            // 4. ExecuteReader (for multiple rows)
            SqlDataReader reader = cmd.ExecuteReader();

            // 5. Read data
            Console.WriteLine("Student Data:\n");

            while (reader.Read())
            {
                Console.WriteLine(
                    reader["Id"] + " - " +
                    reader["Name"] + " - " +
                    reader["Age"]
                );
            }

            reader.Close();
        }
    }
}