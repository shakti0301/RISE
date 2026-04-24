//  Write a program to demonstrate the use of base keyword to call a base class constructor 
using System;
using System.Security.Cryptography.X509Certificates;

namespace Question2
{
    class Parent
    {
        public Parent(int x)
        {
            int a = x;
            Console.WriteLine("Parent's value of a is " +x);
        }
    }
    
    class Child : Parent
    {
        public Child(int x) : base(x)
        {
            Console.WriteLine("Child's value using base is " + x);
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            Child c = new Child(10);
        }
    }
}