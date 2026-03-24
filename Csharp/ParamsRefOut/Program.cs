using System;

class Program
{
    // Method using array, ref, and out
    static void ProcessData(int[] arr, ref int sum, out double average)
    {
        sum = 0;

        // Array parameter used here
        foreach (int num in arr)
        {
            sum += num;   // modifying ref variable
        }

        // out parameter must be assigned
        average = (double)sum / arr.Length;
    }

    static void Main()
    {
        int[] numbers = { 10, 20, 30, 40 };

        int total = 0;     // required for ref
        double avg;        // not required for out initialization

        ProcessData(numbers, ref total, out avg);

        Console.WriteLine("Sum = " + total);
        Console.WriteLine("Average = " + avg);
    }
}