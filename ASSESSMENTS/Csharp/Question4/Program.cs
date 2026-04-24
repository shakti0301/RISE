//  Write a program to use virtual, override and new in Inheritance 
using System;

namespace Question4
{
    class Parent
    {
        public virtual void ShowMethod()
        {
            Console.WriteLine("Show Method from parent class called");
        }
    }
    class Child1 : Parent
    {
        public override void ShowMethod()
        {
            Console.WriteLine("Show Method from child1 class called");
        }
    }
    class Child2 : Parent
    {
        public new void ShowMethod()
        {
            Console.WriteLine("Show Method from child2 class called");
        }
    }
    class Program
    {
        static void Main()
        {
            Parent p = new Parent();
            p.ShowMethod();
            
            //Override:
            Parent p1 = new Child1();
            p1.ShowMethod();

            //New : 
            Parent p2 = new Child2();
            p2.ShowMethod();
        }
    }
}