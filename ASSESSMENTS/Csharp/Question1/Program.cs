// Write a program to demonstrate the use of OUT and REF keyword in method arguments.
using System;
namespace Question1
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 5;
            int b = 10;

            // OUT keyword
            int addition;
            CalculateSum(a, b, out addition);
            Console.WriteLine("method with OUT keyword:");
            Console.WriteLine($"Sum: {addition}");

            // REF keyword
            UpdateValues(ref a, ref b);
            Console.WriteLine("method with REF keyword:");
            Console.WriteLine($"a: {a}, b: {b}");
        }

        static void CalculateSum(int x, int y, out int result)
        {
            result = x + y;
        }

        static void UpdateValues(ref int x, ref int y)
        {
            x = 90;
            y = 100;
        }
    }
}