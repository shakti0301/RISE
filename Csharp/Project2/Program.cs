using System;

// Variables
namespace Project2
{
    class Program
    {
        static unsafe void Main()
        {
            // Basic Data Types
            int number = 10;  // Integer variable
            float temperature = 36.5f;  // Float variable
            char grade = 'A';  // Character variable
            bool isStudent = true;  // Boolean variable
            double price = 99.99;  // Double variable

            Console.WriteLine("Integer: " + number);
            Console.WriteLine("Float: " + temperature);
            Console.WriteLine("Char: " + grade);
            Console.WriteLine("Boolean: " + isStudent);
            Console.WriteLine("Double: " + price);

            /*
            Pointers in C# are used in unsafe contexts and allow you to work with memory directly. 
            They can be used to manipulate data at a low level, but they require careful handling to avoid memory leaks and other issues.
            */
            Console.WriteLine("\n--- Pointer Example ---");
            
            int value = 50;

            // Pointer declaration
            int* ptr = &value; 

            Console.WriteLine("Value of variable: " + value);
            Console.WriteLine("Address of variable: " + (long)ptr);
            Console.WriteLine("Value using pointer: " + *ptr);
        }
    }
}