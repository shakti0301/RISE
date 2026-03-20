using System;

namespace StaticAndReadonltDemo
{
    static class Utility
    {
        public static void Show()
        {
            Console.WriteLine("Utility class");
        }
    }

    class Demo
    {
        public static int staticVar = 10;
        public int normalVar = 5;

        public const double PI = 3.14;
        public readonly int value;

        static Demo()
        {
            Console.WriteLine("Static constructor called");
        }

        public Demo(int v)
        {
            value = v;
        }

        public void NormalMethod()
        {
            Console.WriteLine(staticVar); // allowed
            Console.WriteLine(normalVar); // allowed
        }

        public static void StaticMethod()
        {
            Console.WriteLine(staticVar); // allowed
            // Console.WriteLine(normalVar); // not allowed
        }
    }

    class Program
    {
        static void Main()
        {
            Demo.StaticMethod();

            Demo obj = new Demo(100);
            obj.NormalMethod();

            Console.WriteLine(Demo.PI);
            Utility.Show();
        }
    }
}
