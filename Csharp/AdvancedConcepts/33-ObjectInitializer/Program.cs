//Object Initializer allows you to create an object and assign values at the same time without writing a constructor manually.

using System;

namespace ObjectInitializer
{
    class Student
    {
        public string Name { get; set; }
        public int Age { get; set; }
    }
    class Program
    {
        // Cleaner code
        // No need for constructor
        // Easy initialization
        static void Main()
        {
            Student s1 = new Student()
            {
              Name = "Shakti",
              Age = 21  
            };
            Console.WriteLine($"Your name is {s1.Name} and Age is {s1.Age}");
        }
    }
}