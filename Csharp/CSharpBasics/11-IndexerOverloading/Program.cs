using System;

class Student
{
    private string[] names = { "Shakti", "Rahul", "Kushal", "Abhay" };

    // Indexer 1 → using int
    public string this[int index]
    {
        get
        {
            return names[index];
        }
        set
        {
            names[index] = value;
        }
    }

    // Indexer 2 → using string
    public string this[string name]
    {
        get
        {
            foreach (string n in names)
            {
                if (n == name)
                    return "Found: " + n;
            }
            return "Not Found";
        }
    }
}

class Program
{
    static void Main()
    {
        Student s = new Student();

        // Using int indexer
        Console.WriteLine(s[0]);        // Shakti

        // Using string indexer
        Console.WriteLine(s["Rahul"]); // Found: Rahul
        Console.WriteLine(s["Raj"]);   // Not Found
    }
}