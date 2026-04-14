// Reflection is used to inspect metadata of classes at runtime.
// Means Inspect class, methods, properties at runtime

using System;
using System.Reflection;

namespace Reflection
{
    class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public void Show()
        {
            Console.WriteLine("Show method of Student called");
        }
        public void Display(string message)
        {
            Console.WriteLine("Your Message : "+message);
        }
    }
    class Program
    {
        static void Main()
        {
            //Get Type Information
            Type t = typeof(Student);   
            Console.WriteLine("Class Type = "+t.Name);

            //Get Properties
            Console.WriteLine("\nProperties:");
            foreach(PropertyInfo prop in t.GetProperties())
            {
                Console.WriteLine("- " + prop.Name + " (" + prop.PropertyType.Name + ")");
            }

            //Get Methods
            Console.WriteLine("\nMethods:");
            foreach (MethodInfo method in t.GetMethods())
            {
                Console.WriteLine(method.Name);
            }

            //Create Object Dynamically
            object obj = Activator.CreateInstance(t);

            PropertyInfo nameProp = t.GetProperty("Name");
            nameProp.SetValue(obj, "Shakti");

            PropertyInfo idProp = t.GetProperty("Id");
            idProp.SetValue(obj, 101);

            // Step 6: Get Property Value
            Console.WriteLine("\nProperty Values:");
            Console.WriteLine("Id: " + idProp.GetValue(obj));
            Console.WriteLine("Name: " + nameProp.GetValue(obj));

            // Step 7: Call Method without parameters
            MethodInfo showMethod = t.GetMethod("Show");
            showMethod.Invoke(obj, null);

            // Step 8: Call Method with parameters
            MethodInfo displayMethod = t.GetMethod("Display");
            displayMethod.Invoke(obj, new object[] { "Hello Reflection!" });
            
        }
    }
}