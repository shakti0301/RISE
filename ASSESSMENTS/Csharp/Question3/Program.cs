// 1. Write a program to use all the static data members available in C# such as static class, static function, static constructors
using System;

namespace Question3
{
    static class ClassA
    {
        public static int b;
        public static void StaticMethod()
        {
            Console.WriteLine("Static Method Called");
            Console.WriteLine("Value of b = " +b);
        }
    }
    class Program
    {
        static void Main()
        {
            ClassA.b = 12;
            ClassA.StaticMethod();
        }
    }
}