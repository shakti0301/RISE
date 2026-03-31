using System;
using Demo2; //import namespace
using tt = Demo3.Demo4;  //alias
class Program
{
    static void Main()
    {
        Demo1.A a = new Demo1.A();  //using full name (namespace.classname)
        a.show();

        Demo1.A.show2();  //Static method in Demo1 namespace

        B b = new B();  //demo 2 is already imported by 'using Demo2;' above here we dont need to write full name
        b.display();

        tt.C c = new tt.C();  //nested namespace 
        c.show3();

        Demo5.Outer.Inner obj = new Demo5.Outer.Inner();
        obj.Show();
    }
}