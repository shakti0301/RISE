using System;

namespace ArrayExample
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("----- 1D Array Example -----");

            // 1D Array
            int[] numbers = { 5, 2, 8, 1 };

            // foreach loop to print elements
            foreach (int num in numbers)
            {
                Console.Write(num + " ");
            }

            Console.WriteLine("\nLength of array: " + numbers.Length);


            // -------------------------------
            Console.WriteLine("\n\n----- Array.Sort() Example -----");

            Array.Sort(numbers);

            foreach (int num in numbers)
            {
                Console.Write(num + " ");
            }


            // -------------------------------
            Console.WriteLine("\n\n----- Array.Reverse() Example -----");

            Array.Reverse(numbers);

            foreach (int num in numbers)
            {
                Console.Write(num + " ");
            }


            // -------------------------------
            Console.WriteLine("\n\n----- Array.IndexOf() Example -----");

            int index = Array.IndexOf(numbers, 8);

            Console.WriteLine("Index of 8 = " + index);


            // -------------------------------
            Console.WriteLine("\n----- Array.Copy() Example -----");

            int[] copyArray = new int[4];

            Array.Copy(numbers, copyArray, 4);

            foreach (int num in copyArray)
            {
                Console.Write(num + " ");
            }


            // -------------------------------
            Console.WriteLine("\n\n----- Array.Clear() Example -----");

            Array.Clear(numbers, 0, 2);

            foreach (int num in numbers)
            {
                Console.Write(num + " ");
            }


            // -------------------------------
            Console.WriteLine("\n\n----- 2D Array Example -----");

            int[,] matrix =
            {
                {1,2,3},
                {4,5,6}
            };

            for (int i = 0; i < 2; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    Console.Write(matrix[i, j] + " ");
                }

                Console.WriteLine();
            }


            // -------------------------------
            Console.WriteLine("\n----- Jagged Array Example -----");

            int[][] jagged = new int[3][];

            jagged[0] = new int[] { 1, 2, 3 };
            jagged[1] = new int[] { 4, 5 };
            jagged[2] = new int[] { 6, 7, 8, 9 };

            foreach (int[] row in jagged)
            {
                foreach (int num in row)
                {
                    Console.Write(num + " ");
                }

                Console.WriteLine();
            }
        }
    }
}