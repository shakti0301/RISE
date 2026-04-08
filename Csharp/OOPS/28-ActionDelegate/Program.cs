using System;

namespace ActionDelegate
{
    // Action is a delegate type defined in the System namespace. An Action type delegate is the same as Func delegate except that the Action delegate doesn't return a value. In other words, an Action delegate can be used with a method that has a void return type.
    class Program
    {
        static void PrintMethod(string n)
        {
            Console.WriteLine("Name : "+n);
        }
        static void Main()
        {
            //You can initialize an Action delegate using the new keyword or by directly assigning a method

            // Action<string> printName = PrintMethod;
            // printName("Shakti");

            Action<string> printName = new Action<string>(PrintMethod);
            printName("Shakti");

            // Anonymous method can also be assigned to an Action delegate

            // Action<int> printNumber = delegate(int i)
            // {
            //     Console.WriteLine("Number : "+i);
            // };

            //-> Action with Lambda 
            Action<int> printNumber = (i) => Console.WriteLine("Number : "+i);
            printNumber(110);

        }
    }
}