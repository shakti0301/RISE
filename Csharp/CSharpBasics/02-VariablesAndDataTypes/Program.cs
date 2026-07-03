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
            string name = "John Doe";  // String variable
            var autoVariable = 42;  // Implicitly typed variable

            // ToByte() - This method is used to convert a value to a byte. 
            // ToInt16() - This method is used to convert a value to a short (Int16).
            // ToInt32() - This method is used to convert a value to an int.
            // ToInt64() - This method is used to convert a value to a long (Int64).

            Console.WriteLine("Integer: " + number);
            Console.WriteLine("Float: " + temperature);
            Console.WriteLine("Char: " + grade);
            Console.WriteLine("Boolean: " + isStudent);
            Console.WriteLine("Double: " + price);
            Console.WriteLine("String: " + name);
            Console.WriteLine("Auto Variable: " + autoVariable);


            /*
            Data Type Mappings:
            Int8 = sbyte (signed 8-bit integer)
            Int16 = short (signed 16-bit integer)
            Int32 = int (signed 32-bit integer)
            Int64 = long (signed 64-bit integer)
            UInt8 = byte (unsigned 8-bit integer)
            UInt16 = ushort (unsigned 16-bit integer)
            UInt32 = uint (unsigned 32-bit integer)
            UInt64 = ulong (unsigned 64-bit integer)
            */
            
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