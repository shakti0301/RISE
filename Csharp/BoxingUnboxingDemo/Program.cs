using System;

namespace BoxingUnboxingDemo
{
    // Class for Boxing
    class BoxingExample
    {
        public void PerformBoxing()
        {
            int number = 100;     // Value Type
            object obj = number;  // Boxing
            // The integer value is boxed into an object type, which is a reference type.
            //Stack memory to heap memory transfer is called boxing.

            Console.WriteLine("Boxing Example:");
            Console.WriteLine("Value type (int): " + number);
            Console.WriteLine("Boxed object: " + obj);
        }
    }

    // Class for Unboxing
    class UnboxingExample
    {
        public void PerformUnboxing()
        {
            object obj = 200;      // Boxing happens here
            int number = (int)obj; // Unboxing
            // The object is unboxed back to an integer type.
            //Heap memory to stack memory transfer is called unboxing.
            // Unboxing requires an explicit cast to the original value type becaues the object can hold any type of data, and the runtime needs to know the specific type to unbox it correctly.

            Console.WriteLine("\nUnboxing Example:");
            Console.WriteLine("Object value: " + obj);
            Console.WriteLine("Unboxed int value: " + number);
        }
    }

    class Program
    {
        static void Main()
        {
            // Create object of Boxing class
            BoxingExample boxing = new BoxingExample();
            boxing.PerformBoxing();

            // Create object of Unboxing class
            UnboxingExample unboxing = new UnboxingExample();
            unboxing.PerformUnboxing();
        }
    }
}