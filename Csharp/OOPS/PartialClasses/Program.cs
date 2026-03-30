using System;
using System.Diagnostics;

namespace PartialClass
{
    /// <summary>
    /// PARTIAL CLASSES DEMONSTRATION
    /// 
    /// Partial classes allow you to split the definition of a class across multiple files or locations
    /// in the same file. This is useful for:
    /// - Separating auto-generated code from manually written code
    /// - Organizing large classes into logical sections (e.g., properties, methods, events)
    /// - Collaborating with multiple developers on the same class
    /// - Code maintainability and organization
    /// </summary>

    /// <summary>
    /// First partial declaration of class D - Contains data members (fields)
    /// This part focuses on storing data/state of the object
    /// </summary>
    partial class D
    {
        /// <summary>
        /// A sample integer field initialized with value 12
        /// In real applications, this would represent meaningful data like ID, age, etc.
        /// </summary>
        public int x = 12;
    }

    /// <summary>
    /// Second partial declaration of class D - Contains methods/behavior
    /// This part focuses on the operations/functionality of the object
    /// 
    /// NOTE: Both declarations must have the 'partial' keyword and same class name
    /// They will be combined into a single class at compile time
    /// </summary>
    partial class D
    {
        /// <summary>
        /// Displays information to the console
        /// This method is part of the second partial declaration
        /// </summary>
        public void display()
        {
            Console.WriteLine("Hello from partial class D!");
        }

        /// <summary>
        /// Additional method to display the value of x
        /// Demonstrates how both parts of the partial class work together
        /// </summary>
        public void displayValue()
        {
            Console.WriteLine($"The value of x is: {x}");
        }
    }

    /// <summary>
    /// Main program class - Entry point of the application
    /// </summary>
    class Program
    {
        /// <summary>
        /// Main method - Entry point for the console application
        /// Demonstrates how partial classes are used as a single unified class
        /// </summary>
        static void Main()
        {
            // Create an instance of class D (which is actually combining both partial declarations)
            D d = new D();

            // Access the field 'x' defined in the first partial declaration
            Console.WriteLine($"Value from first partial class: {d.x}");

            // Call the method from the second partial declaration
            d.display();

            // Call additional method from second partial declaration
            d.displayValue();

            // Create another instance to demonstrate that partial classes create normal classes
            D d2 = new D();
            d2.display();

            // Keep console window open to see output
            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
    }
}