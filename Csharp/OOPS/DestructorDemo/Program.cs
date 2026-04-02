namespace DestructorDemo
{
    using System;

    // Simple class used to demonstrate constructor and destructor behavior.
    class FileLogger
    {
        public FileLogger()
        {
            // Runs as soon as the object is created.
            Console.WriteLine("File opened");
        }

        ~FileLogger()
        {
            // Runs when the garbage collector finalizes the object.
            Console.WriteLine("File closed (Destructor called)");
        }
    }

    class Program
    {
        static void Main()
        {
            // Create the object so the constructor message is displayed.
            FileLogger obj = new FileLogger();

            // Remove the reference and force collection so the destructor can run.
            obj = null;
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }
}