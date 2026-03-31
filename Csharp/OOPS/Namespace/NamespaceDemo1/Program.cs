using System;
using Demo2; //import namespace
class Program
{
    static void Main()
    {
        Demo1.A a = new Demo1.A();  //using full name (namespace.classname)
        a.show();

        B b = new B();  //demo 2 is already imported by 'using Demo2;' above here we dont need to write full name
        b.display();
    }
}