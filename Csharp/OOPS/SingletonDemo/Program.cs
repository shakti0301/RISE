using System;

namespace SingletonDemo
{
    // in singleton pattern Only ONE object (instance) of a class is allowed in the entire program.
    sealed class Singleton         //Here I write sealed keyword because no class can inherite it 
    {
        // create a static variable (store single object)
        private static Singleton instance;

        // private constructor (no outside object creation)
        private Singleton()
        {
            Console.WriteLine("Singleton Object Created");
        }
        // public method to get object
        public static Singleton GetInstance()
        {
            if (instance == null)
            {
                instance = new Singleton();
            }
            return instance;
        }
        public void ShowMessage()
        {
            Console.WriteLine("Hello from Singleton");
        }
    }
    class Program
    {
        static void Main()
        {
            Singleton obj1 = Singleton.GetInstance();
            Singleton obj2 = Singleton.GetInstance();

            obj1.ShowMessage();

            // Check both objects
            Console.WriteLine(obj1 == obj2); // True
        }
    }
}