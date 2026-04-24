//  Write Program to use delegate and anonymous function
using System;

namespace Question6
{
    public delegate void dmethod();
    public delegate void dmethod1(); 
    
    class ClassA
    {
        public static void Show()
        {
            Console.WriteLine("show Method of class");
        }
    }
    class Program
    {
        static void Main()
        {
            dmethod d1 = new dmethod(ClassA.Show);
            d1();
            dmethod1 d2 = delegate () { Console.WriteLine("Anonymous function"); };
            d2();
        }
    }   
}