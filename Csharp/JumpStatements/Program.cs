using System;

namespace JumpStatements
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("----- BREAK Example -----");
            BreakExample();

            Console.WriteLine("\n----- CONTINUE Example -----");
            ContinueExample();

            Console.WriteLine("\n----- RETURN Example -----");
            int result = Square(5);
            Console.WriteLine("Square of 5 = " + result);

            Console.WriteLine("\n----- GOTO Example -----");
            GotoExample();

            Console.WriteLine("\n----- REF RETURN Example -----");
            RefReturnExample();
        }

        // -------------------------------
        // BREAK Example
        // -------------------------------
        static void BreakExample()
        {
            // break stops the loop immediately
            for (int i = 0; i < 10; i++)
            {
                if (i == 5)
                {
                    Console.WriteLine("Break triggered at i = 5");
                    break;  // exits the loop
                }

                Console.WriteLine(i);
            }
        }

        // -------------------------------
        // CONTINUE Example
        // -------------------------------
        static void ContinueExample()
        {
            // continue skips the current iteration
            for (int i = 0; i < 5; i++)
            {
                if (i < 3)
                {
                    Console.WriteLine($"Iteration {i} skipped");
                    continue;   // skip remaining code
                }

                Console.WriteLine($"Iteration {i} executed");
            }
        }

        // -------------------------------
        // RETURN Example
        // -------------------------------
        static int Square(int number)
        {
            // return ends the method and sends value back
            return number * number;
        }

        // -------------------------------
        // GOTO Example
        // -------------------------------
        static void GotoExample()
        {
            int i = 0;

        StartLoop:   // label

            if (i >= 3)
            {
                goto EndLoop;  // jump to EndLoop
            }

            Console.WriteLine("Goto loop iteration: " + i);
            i++;

            goto StartLoop;   // jump back to label

        EndLoop:
            Console.WriteLine("Exited loop using goto");
        }

        // -------------------------------
        // REF RETURN Example
        // -------------------------------
        static void RefReturnExample()
        {
            int[] numbers = { 10, 20, 30, 40 };

            // get reference to array element
            ref int found = ref FindNumber(numbers, 30);

            // modifying returned reference
            found = 999;

            Console.WriteLine("Modified array:");
            foreach (int n in numbers)
            {
                Console.WriteLine(n);
            }
        }

        // method returning reference
        static ref int FindNumber(int[] arr, int value)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i] == value)
                {
                    return ref arr[i];  // return reference
                }
            }

            throw new Exception("Value not found");
        }
    }

}