using System;

namespace Project2
{
    class Program
    {
        static unsafe void Main()
        {
            // Basic Data Types
            int number = 10;
            float temperature = 36.5f;
            char grade = 'A';
            bool isStudent = true;
            double price = 99.99;

            Console.WriteLine("Integer: " + number);
            Console.WriteLine("Float: " + temperature);
            Console.WriteLine("Char: " + grade);
            Console.WriteLine("Boolean: " + isStudent);
            Console.WriteLine("Double: " + price);

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