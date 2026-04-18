using System;
using System.IO;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;


class Program
{
    class Select
    {
        public static string Selectdata()
        {
            Console.WriteLine("---SELECT---");

            Console.Write("Enter name: ");
            string name = Console.ReadLine();
            
            return name;
        }
    }
    class Delete
    {
        public static string DeleteData()
        {
            Console.WriteLine("---DELETE---");

            Console.Write("Enter name: ");
            string name = Console.ReadLine();
            
            return name;
        }
    }
    class Insert
    {
        public static (string name, int age, int id) Insertdata()
        {
            Console.WriteLine("---INSERT---");

            Console.Write("Enter name: ");
            string name = Console.ReadLine();

            Console.Write("Enter age: ");
            int age = Convert.ToInt32(Console.ReadLine());

            Console.Write("Enter Id: ");
            int id = Convert.ToInt32(Console.ReadLine());
            

            return (name, age, id);
        } 
    }
    class Update
    {
        public static (string name, int age) Updatedata()
        {
            Console.WriteLine("---UPDSTE---");

            Console.Write("Enter name: ");
            string name = Console.ReadLine();

            Console.Write("Enter new age: ");
            int age = Convert.ToInt32(Console.ReadLine());

            return (name, age);
        } 
    }
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
            Console.WriteLine("Connected\n");

            int choice = 0;
            while (choice != 5)
            {
                Console.WriteLine("\n\nChoose Operation:");
                Console.WriteLine("1. Insert");
                Console.WriteLine("2. Select");
                Console.WriteLine("3. Update");
                Console.WriteLine("4. Delete");
                Console.WriteLine("5. Exit");

                Console.Write("Enter choice: ");
                choice = Convert.ToInt32(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        var insertedData = Insert.Insertdata();
                        SqlCommand insertCmd = new SqlCommand(
                            "INSERT INTO Students (Id, Name, Age) VALUES (@id, @name, @age)", conn);
                        insertCmd.Parameters.AddWithValue("@id", insertedData.id);
                        insertCmd.Parameters.AddWithValue("@name", insertedData.name);
                        insertCmd.Parameters.AddWithValue("@age", insertedData.age);
                        int rows1 = insertCmd.ExecuteNonQuery();
                        Console.WriteLine($"{rows1} record inserted successfully.");
                        break;

                    case 2:
                        var selectData = Select.Selectdata();
                        SqlCommand selectCmd = new SqlCommand(
                            "SELECT * FROM Students WHERE Name = @name", conn);
                        selectCmd.Parameters.AddWithValue("@name", selectData);

                        using (SqlDataReader reader = selectCmd.ExecuteReader()) 
                        {
                            Console.WriteLine("\nId - Name - Age");
                            Console.WriteLine("----------------");
                            while (reader.Read())
                            {
                                Console.WriteLine(
                                    reader["Id"] + " - " +
                                    reader["Name"] + " - " +
                                    reader["Age"]
                                );
                            }
                        } 
                        break;

                    case 3:
                        var updatedData = Update.Updatedata();
                        SqlCommand updateCmd = new SqlCommand(
                            "UPDATE Students SET Age = @age WHERE Name = @name", conn);
                        updateCmd.Parameters.AddWithValue("@name", updatedData.name);
                        updateCmd.Parameters.AddWithValue("@age", updatedData.age);
                        int rows2 = updateCmd.ExecuteNonQuery();
                        Console.WriteLine($"{rows2} record updated successfully.");
                        break;

                    case 4:
                        var deleteData = Delete.DeleteData();
                        SqlCommand deleteCmd = new SqlCommand(
                            "DELETE FROM Students WHERE Name = @name", conn);
                        deleteCmd.Parameters.AddWithValue("@name", deleteData);
                        int rows3 = deleteCmd.ExecuteNonQuery();
                        Console.WriteLine($"{rows3} record deleted successfully.");
                        break;

                    case 5:
                        Console.WriteLine("You Exit");
                        return;

                    default:
                        Console.WriteLine("Invalid choice!");
                        break;
                }
            }
        }
    }
}