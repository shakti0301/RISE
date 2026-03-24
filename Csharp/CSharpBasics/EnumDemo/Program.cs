using System;

namespace EnumDemo
{
    // Enum declaration
    // Enum is a value type used to define named constants
    enum Day
    {
        Sunday = 1,      // explicitly assigned value
        Monday,          // automatically 2
        Tuesday,         // automatically 3

        // value reset
        Wednesday = 8,   // explicitly assigned

        Thursday,        // automatically 9

        // duplicate value allowed
        Friday = 9,      // explicitly assigned again

        Saturday         // automatically 10
    }

    class EnumExample
    {
        public void ShowEnumValues()
        {
            Console.WriteLine("----- Enum Values -----");

            // Printing enum names with their integer values
            Console.WriteLine("Sunday = " + (int)Day.Sunday);
            Console.WriteLine("Monday = " + (int)Day.Monday);
            Console.WriteLine("Tuesday = " + (int)Day.Tuesday);
            Console.WriteLine("Wednesday = " + (int)Day.Wednesday);
            Console.WriteLine("Thursday = " + (int)Day.Thursday);
            Console.WriteLine("Friday = " + (int)Day.Friday);
            Console.WriteLine("Saturday = " + (int)Day.Saturday);
        }

        public void CastIntegerToEnum()
        {
            Console.WriteLine("\n----- Casting Integer to Enum -----");

            // Casting integer to enum
            Day d = (Day)9;

            // C# searches for enum names with value 9
            // Thursday = 9
            // Friday = 9

            // When duplicates exist, C# prints the LAST declared name
            Console.WriteLine("Casting (Day)9 gives: " + d);
        }

        public void InvalidEnumValue()
        {
            Console.WriteLine("\n----- Casting Unknown Value -----");

            // Casting a value that doesn't exist in enum
            Day d = (Day)100;

            // Since no enum name has value 100
            // C# prints the number itself
            Console.WriteLine("Casting (Day)100 gives: " + d);
        }
    }

    class Program
    {
        static void Main()
        {
            // Creating object of EnumExample class
            EnumExample example = new EnumExample();

            // Calling methods
            example.ShowEnumValues();
            example.CastIntegerToEnum();
            example.InvalidEnumValue();
        }
    }
}