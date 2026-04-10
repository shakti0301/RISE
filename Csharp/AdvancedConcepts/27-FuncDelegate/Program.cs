using System;
using System.Runtime.InteropServices;

namespace FuncDelegate
{
    class Program
    {
        //Func is a generic delegate included in the System namespace. It has zero or more input parameters and one out parameter. The last parameter is considered as an out parameter.
        static int Sum(int x, int y)
        {
            return x + y;
        }
        static void Main()
        {
            //First 2 int is for input and 3rd one is for output
            Func<int, int, int> add = Sum;

            int result = add(12,12);

            Console.WriteLine("Sum : "+result);

            //Func with Anonymous Method

            // Func<int> generateRandomNumber = delegate()
            // {
            //     Random rd = new Random();
            //     return rd.Next(1, 100);    //Generate random number between 1 and 100
            // };
            
            //-> Func with Lambda Expression
            Func<int> generateRandomNumber = () => new Random().Next(1, 100);

            int randomNumber = generateRandomNumber();
            Console.WriteLine(randomNumber);
        }
    }
}