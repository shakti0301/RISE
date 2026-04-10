using System;
using System.Security.Cryptography.X509Certificates;

namespace ExceptionHandling
{
    //User-defined Exception 
    class InvalidAgeException : Exception
    {
        // constructor for the InvalidAgeException class
        public InvalidAgeException(string message) : base(message)
        {
            
        }
    }
    class Program
    {
        //Built in Exception :
        // StackOverflowException, ArithmeticException, DivideByZeroException, NotFiniteNumberException, OverFlowException, ValidationException, ArgumentException
        public static void RegisterUser(int age)
        {
            if (age < 18)
            {
                throw new InvalidAgeException("User must be at least 18 years old.");      //This act as a 'throws' (in C# there is no throws like JAVA)
            }
        }
        static void Main()
        {
            string[] colors = { "Red", "Blue", "Green" };
            int a = 12;
            int b = 0;
            try
            {
                // Console.WriteLine(colors[5]);
                int result = a / b;
                Console.WriteLine(result);
            }
            catch (IndexOutOfRangeException e1)
            {
                Console.WriteLine("An exception occurred: " + e1.Message);
            }
            catch (DivideByZeroException e2)     //We can able to assign multiple catch function
            {
                Console.WriteLine("An exception occured: " + e2.Message);
            }
            catch (Exception e)        //All Rounder
            {
                Console.WriteLine("Exception: " + e);
            }

            //User define 
            try
            {
                RegisterUser(15);
            }
            catch (InvalidAgeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
            finally
            {
                Console.WriteLine("Finnaly : It will run (No matter what)");
            }
        }
    }
}