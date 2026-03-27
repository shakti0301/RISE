using System;

namespace NullableDemo
{
    class NullableMethods
    {
        int? x = null; // Using nullable type

        //method 1 is HasValue() which is in class Nullable (Below)
        //method 2 is GetValueOrDefault() 
        public void method2()
        {
            Console.WriteLine("Value of x: " + x.GetValueOrDefault(10)); // GetValueOrDefault() returns the value if it has one, otherwise it returns the default value provided as an argument (in this case, 10)
        }
        public void method3()
        {
            int? s = 7;
            // Console.WriteLine("Value of x:" +x.Value);
            //Here it will give an value of x but since x is null, it will throw an error at runtime.

            Console.WriteLine("Thala for a reason: " + s.Value); // Here it will give an value of s because s has a value of 7, so it will not throw an error at runtime.
        }

    }
    class Nullable
    {
        //int a = null; // This will cause a compile-time error

        int? a = null; // Using nullable type | ? is used to declare a nullable type

        // Nullable<int> a = null; // This is another way to declare a nullable type
        //<> is used to declare a generic type
        Nullable<int> b = 12; // Using Nullable<T> class

        public int c; // Using null-coalescing '??' operator to provide a default value

        // Console.WriteLine("Value of a: " + a);
        // Console.WriteLine("Value of b: " + b);

        public void CheckNullable()
            // Checking if the nullable variable has a value for a
        {
            if (a.HasValue)     //HasValue is a method of the Nullable<T> class that returns true if the nullable variable has a value, otherwise it returns false
            {
                Console.WriteLine("Value of a: " + a.Value);
            }
            else
            {
                Console.WriteLine("a does not have a value.");
            }

            // Checking if the nullable variable has a value for b
            if (b.HasValue)
            {
                Console.WriteLine("Value of b: " + b.Value);
            }
            else
            {
                Console.WriteLine("b does not have a value.");
            }

            //Nullable type variable cannot passed in value type

            //int c = a; // This will cause a compile-time error
            //int d = b; // This will cause a compile-time error even though b has a value, it cannot be directly assigned to an int variable without checking for null

            c = a ?? 12; // Assign value if a has one, otherwise assign 12
            //it means if 'a' has value then assign it to 'c', otherwise assign 12 to 'c'
        }
    }
    class Program
    {
        static void Main()
        {
            Nullable demo = new Nullable();
            demo.CheckNullable();
            Console.WriteLine("Value of c: " + demo.c); 

            NullableMethods methods = new NullableMethods();
            //method 1 is HasValue() which is in class Nullable (Above)
            methods.method2();
            methods.method3();
            //method 4 is '??' operator which is in class Nullable (Above)
        }
    }
}