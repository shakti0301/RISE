using System;
using System.Runtime.Intrinsics.Arm;

namespace StructDemo
{
    // A struct is similar to a class, but: its is a value type
    struct Students
    { 
        public int id;
        public string name;
    } 

    //Reference can be change but value can’t
    //Class is a reference type but struct is a value type
    class A
    {
        public int x;
    }

    //In struct over riding is possible but overloading is not possible 
    // Struct cannot inherit
    // So no normal overriding like class
    struct Calc
    {
        public void Add(int a, int b)
        {
            Console.WriteLine("a + b = "+(a+b));
        }

        public void Add(int a, int b, int c)
        {
            Console.WriteLine("a + b + c = "+(a+b+c));
            
        }
    }
    //No inheritance
    struct newA
    {
        public int age;
        public string name;
        //We also can able to add Constructor
        public newA(int a, string n)
        {
            name = n;
            age = a;

            Console.WriteLine("Constructor 'newA' Called :::>    name : "+name +" And age : "+age);
        }

        //We can define property in struct also
        private int age;

        public int Age
        {
            get { return age; }
            set { age = value; }
        }
    }

    // struct B : newA  -> ERROR


    //Static variable
    // Static constructor
    // Static methods
    struct Counter
    {
        public static int count;

        static Counter()
        {
            count = 0;
        }

        public static void Increment()
        {
            count++;
        }

        
    }

    class Program
    {
        static void Main()
        {
            //using struct (Students)
            Students s1;

            s1.id = 101;
            s1.name = "Shakti";

            Console.WriteLine("Name is " +s1.name +" and ID is " +s1.id);


            //Class
            A a1 = new A();
            a1.x = 10;

            A a2 = a1;   //reference copy
            a2.x = 20;

            //Here we make changes in a2.x and now we try to print a1.x
            Console.WriteLine("Reference type after change : "+a1.x);   //It will give 20

            //Now this is not going to happen in struct (value type)

            Students s2 = s1;
            //Now make changes
            s2.id = 110;

            Console.WriteLine("Value type after change : "+s1.id);   //It will give 101

            //Overloading
            Calc c1;
            c1.Add(10, 10);
            c1.Add(10, 10, 10);

            newA na = new newA(22, "Shakti");  //Sturct's Constructor called 

            
        }
    }
}