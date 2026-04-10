using System;

namespace PredicatDelegate
{
    class Program
    {
        //Predicate is the delegate like Func and Action delegates. It represents a method containing a set of criteria and checks whether the passed parameter meets those criteria. A predicate delegate methods must take one input parameter and return a boolean - true or false.
        static bool CheckIsUpperCase(string s)
        {
            return s.Equals(s.ToUpper());
        }
        static bool CheckIsLowerCase(string s)
        {
            return s.Equals(s.ToLower());
        }
        static void Main()
        {
            Predicate<string> isUpper = CheckIsUpperCase;
            bool result1 = isUpper("hi");
            Console.WriteLine("Result for isUpper is "+result1);

            Predicate<string> isLower = CheckIsLowerCase;
            bool result2 = isLower("hi");
            Console.WriteLine("Result for isLower is "+result2);


            //Predicate can also be used with any method, anonymous method, or lambda expression.
            int y = 10;


            //anonymous method
            // Predicate<int> isGrater = delegate(int num)
            // {
            //     return num.CompareTo(y) > 0;
            // };

            // bool result3 = isGrater(2);
            // Console.WriteLine(result3);

            //lambda expression
            Predicate<int> isGrater = (num) => num.CompareTo(y) > 0;
            bool result4 = isGrater(1);
            Console.WriteLine(result4);

        }
    }
}