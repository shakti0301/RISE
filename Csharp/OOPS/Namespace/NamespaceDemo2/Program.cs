using System;

//now i want to use namesaces from Demo1 we have to reference it : in terminal (at perticular folder) write :
// dotnet add NamespaceDemo2 reference NamespaceDemo1

using Demo1;
using rr = Demo3.Demo4; //alias

namespace namespaceDemo2
{
    class Program
    {
        static void Main()
        {
            rr.C c = new rr.C();
            c.show3();

            A a = new A(); //from Demo1 
            a.show();

            A.show2();  //static method
        }
    }
}


//So this is how we can add namespace of one project in to another project and use them

//to use them we neeed to create reference of Demo1 (Which we want to use) in to Demo2 (Where we want to use)