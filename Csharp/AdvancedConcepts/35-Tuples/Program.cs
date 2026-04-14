using System;


//Tuple is a generic data structure used to store multiple values of different types.

namespace Tuples
{

    class MyClass
    {
        // Function returning tuple
        public static Tuple<int, string> MyMethod()
        {
            return Tuple.Create(1, "Hello From MyMethod");
        }

        //Tuple as Argument
        public static void Display(Tuple<int, string> data)
        {
            Console.WriteLine("\nTuple passed successfully in Method -> Display");
            Console.WriteLine(data.Item1 + " " + data.Item2);
        }

    }
    class Program
    {
        static void Main()
        {
            //We can create a Tuple by using -> "New" and "Create()"

            Tuple<int, string> t1 = new Tuple<int, string>(1, "Shakti");
            var t2 = Tuple.Create(2, "Rahul");

            Console.WriteLine("\n-> Tuple 1 <-");
            Console.WriteLine(t1.Item1); // 1
            Console.WriteLine(t1.Item2); // Shakti

            Console.WriteLine("\n-> Tuple 2 <-");
            Console.WriteLine(t2.Item1);
            Console.WriteLine(t2.Item2);


            Tuple<int, string> t3 = MyClass.MyMethod();

            Console.WriteLine("\n-> Tuple 3 <-");
            Console.WriteLine(t3.Item1);
            Console.WriteLine(t3.Item2);


            //Passing tuple in method 
            MyClass.Display(t3);


            //Nested Tuple 

            var nested = Tuple.Create(1, Tuple.Create("Shakti", "India"));
            Console.WriteLine("\nNested Tuple :");
            Console.WriteLine(nested.Item2.Item1); // Shakti
        }
    }
}