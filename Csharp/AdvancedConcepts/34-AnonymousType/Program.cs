using System;
// A type without a class definition
// Created using var
// Properties are read-only (immutable)
// Mostly used for temporary data (like LINQ result

namespace AnonymousType
{
    class Program
    {
        static void Main()
        {
            var Student1 = new
            {
                Id = 1,
                Name = "Shakti",
                Age = 22
            };

            //Anonymous type is read only
            //means after defining it, if we try to change the value than it will give an error 
            // Student.Name = "Rahul";  //this will give an error 
            
            Console.WriteLine("Id : "+Student1.Id);
            Console.WriteLine("Name : "+Student1.Name);
            Console.WriteLine("Age : "+Student1.Age);


            //We can also pass Anonymous type in another Anonymous type (Nested)
            
            var Student2 = new
            {
                Id = 1,
                Name = "Shakti",
                Address = new
                {
                    HouseNo = 1199,
                    Steet = "Raolji Street",
                    City = "Anand"
                }
            };

            Console.WriteLine("\nName : "+Student2.Name);
            Console.WriteLine("Id : "+Student2.Id);

            Console.WriteLine($"Address : {Student2.Address.HouseNo}, {Student2.Address.Steet}, {Student2.Address.City}");


            //We can use in collections also 

            var students = new List<object>
            {
                new { Id = 1, Name = "Shakti" },
                new { Id = 2, Name = "Rahul" },
                new { Id = 3, Name = "Priya" }
            };
            Console.WriteLine("\n");

            int i = 1;
            foreach (var s in students)
            {
                Console.WriteLine($"Student {i} : {s}");
                i++;
            }




        }
    }
}