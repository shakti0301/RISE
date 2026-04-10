using System;
using MyLibrary;

namespace ExtensionMethodDemo
{
    static class myClass
    {
        public static void myMethod(this Class1 ob)
        {
            Console.WriteLine("Extension Method");
        }
    }
    class Program
    {
        static void Main()
        {
            Class1 a = new Class1();
            a.method1();
            Class1.method2(); //Static method

            a.myMethod();
        }
    }
}