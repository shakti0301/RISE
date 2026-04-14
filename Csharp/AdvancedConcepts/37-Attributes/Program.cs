using System;

// Step 1: Create Custom Attribute
class MyInfoAttribute : Attribute
{
    public string Message;

    public MyInfoAttribute(string msg)
    {
        Message = msg;
    }
}

// Step 2: Use Attribute on Class
[MyInfo("This is Student class")]
class Student
{
    public void Show()
    {
        Console.WriteLine("Inside Student class");
    }
}

class Program
{
    static void Main()
    {
        // Step 3: Read Attribute using Reflection
        Type t = typeof(Student);

        object[] attrs = t.GetCustomAttributes(false);

        foreach (object attr in attrs)
        {
            MyInfoAttribute a = (MyInfoAttribute)attr;
            Console.WriteLine("Attribute Message: " + a.Message);
        }
    }
}