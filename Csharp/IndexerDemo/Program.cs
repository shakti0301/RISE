using System;

class Student
{
    private int[] marks = new int[5];

    // Indexer
    public int this[int index]
    {
        get
        {
            if (index >= 0 && index < marks.Length)
            {
                return marks[index];
            }
            else
            {
                Console.WriteLine("Invalid index!");
                return 0;
            }
        }
        set
        {
            if (index >= 0 && index < marks.Length)
            {
                marks[index] = value;
            }
            else
            {
                Console.WriteLine("Invalid index!");
            }
        }
    }
}

class Program
{
    static void Main()
    {
        Student s = new Student();

        // Setting values using indexer
        s[0] = 85;
        s[1] = 90;
        s[2] = 78;
        s[3] = 88;
        s[4] = 92;

        // Getting values using indexer
        Console.WriteLine("Student Marks:");

        for (int i = 0; i < 5; i++)
        {
            Console.WriteLine("Subject " + i + ": " + s[i]);
        }
    }
}