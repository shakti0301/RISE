using System;

namespace OverHidingDemo
{
    class Parent
    {
        public virtual void show()  // virtual is used to allow the method to be overridden in the child class
        {
            Console.WriteLine(" [PARENT] Base implementation - Original behavior");
        }
    }
    class Child : Parent    // This will inherit the Parent class
    {

        public override void show() // override is used to provide a new implementation of the method in the child class
        {
            base.show(); // Here Base keyword is like a super keyword in java, it is used to call the method of the parent class.
            Console.WriteLine(" [CHILD - OVERRIDE] Enhanced version - calling parent + adding own behavior");
        }
    }

    class Child2 : Parent
    {
        public new void show() // new is used to hide the method of the parent class, it will not call the method of the parent class.
        {
            Console.WriteLine(" [CHILD2 - HIDE] Completely replaced - ignoring parent implementation (Method Hiding)");
        }
    }
    class Program
    {
        static void Main()
        {
            Console.WriteLine("===== METHOD OVERRIDING vs METHOD HIDING =====\n");

            Console.WriteLine(" Parent class instance:");
            Parent p = new Parent();
            p.show(); // This will call the show method of the parent class

            Console.WriteLine("\n Child class instance (OVERRIDE - Respects Polymorphism):");
            Child c = new Child();
            c.show(); // This will call the show method of the child class, but it will also call the show method of the parent class because of the base keyword.

            Console.WriteLine("\n Parent reference pointing to Child (OVERRIDE - POLYMORPHISM IN ACTION):");
            Parent p1 = new Child();
            p1.show(); // This will call the show method of the child class because of polymorphism, but it will also call the show method of the parent class because of the base keyword.

            Console.WriteLine("\n Child2 class instance (HIDING - Direct call):");
            Child2 c2 = new Child2();
            c2.show(); // This will call the show method of the child2 class, it will not call the show method of the parent class because of the new keyword.

            Console.WriteLine("\n Parent reference pointing to Child2 (HIDING - Doesn't respect Polymorphism):");
            Parent p2 = new Child2();
            p2.show(); // This will call the show method of the parent class, it will not call the show method of the child2 class because of the new keyword.

        }
    }
}