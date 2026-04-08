using System;

namespace LambdaDemo
{
    class Program
    {
        static void Main()
        {
            Console.Write("Enter the value of A : ");
            int a = int.Parse(Console.ReadLine() ?? "0");

            Console.Write("Enter the value of B : ");
            int b = int.Parse(Console.ReadLine() ?? "0");

            // Basic lambda expression using Func<in, in, out>
            Func<int, int, int> sum = (x, y) => x + y;

            int result = sum(a, b);
            Console.WriteLine("Sum of A and B is : " + result);
        }
    }
}