//  Write a program to create a collection and use Lambda to get the data printed based on lambda condition 
using System;

namespace Question7
{
    class Program
    {
        static void Main()
        {
            List<int> li = new List<int>();
            li.Add(12);
            li.Add(13);
            li.Add(14);

            int sum = 0;
            li.ForEach( n=>
            {
                if(n % 2 == 0)
                {
                    Console.WriteLine(n + " is an even number");
                }
                else
                {
                    Console.WriteLine(n + " is a odd number");
                }
            });


        }
    }
}
