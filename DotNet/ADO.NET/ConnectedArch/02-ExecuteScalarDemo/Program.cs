using System;
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

        using(SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            Console.WriteLine("\nConnection to DB - Success");

            SqlCommand countCmd = new SqlCommand("SELECT COUNT(Id) FROM Students", conn);
            int count = (int)countCmd.ExecuteScalar();
            Console.WriteLine("Total Students: " + count);

            SqlCommand avgCmd = new SqlCommand("SELECT AVG(AGE) FROM Students", conn);
            int average = (int)avgCmd.ExecuteScalar();
            Console.WriteLine("Total Students: " + averagexxaa);

            conn.Close();
        }
    }
}
