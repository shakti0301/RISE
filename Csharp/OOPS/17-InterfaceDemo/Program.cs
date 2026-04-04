using System;

namespace InterfaceDemo
{
    interface HasLegs
    {
        void hasFourLegs();
    }
    interface Mammel
    {
        void isMammel();
    }

    interface Animal : HasLegs   //interface can inherited other interface
    {
        //No readonly variable in Interface
        // int animalAge = 2;  -- we cant able to define variable like a normal class fields
        void animalSound(); // interface method (does not have a body)
        void run(); // interface method (does not have a body)

        //we can add property in interface
        int Age { get; set; }

        //static method
        static void Show()
        {
            Console.WriteLine("Static method in Animal interface");
        }

        //default method
        void info()
        {
            Console.WriteLine("this is an animal");
        }
    }
    
    //When we inherited the interface into a class then all method mush be there and give body in it

    class Dog : Animal, Mammel  //Multiple Inheritance using interface (using comma seperated)
    {
        public int age;
        public void animalSound()
        {
            // The body of animalSound() is provided here
            Console.WriteLine("The dog says : Bhau Bhau");
        }

        public void run()
        {
            Console.WriteLine("Dog runs very fast");
        }

        public int Age
        {
            get { return age; }
            set { age = value; }
        }

        public void isMammel()
        {
            Console.WriteLine("Dog is mammel");
        }

        public void hasFourLegs()
        {
            Console.WriteLine("Dog has four legs");
        }
    }
    class Cat : Animal
    {
        public int age;
        public void animalSound()
        {
            // The body of animalSound() is provided here
            Console.WriteLine("The cat says : Meow Meow");
        }

        public void run()
        {
            Console.WriteLine("Cat runs fast");
        }

        public int Age
        {
            get { return age; }
            set { age = value; }
        }

        public void hasFourLegs()
        {
            Console.WriteLine("Cat has four legs");
        }
    }

    class Program
    {
        static void Main()
        {
            // Animal a = new Animal();  -- Creating object of interface is not possible we can make reference of it

            //Loose Coupling
            Animal a ;
            a = new Dog();  //In a reference if we wirte Dog() then it will access the Dogs method, and if we change it with Cat() then it will access the methods form Cat
            //a = new Cat();

            a.Age = 2; //set
            Console.WriteLine(a.Age);  //get
            a.animalSound();
            a.run();
            a.hasFourLegs();
            a.info(); //Default method
            
            Dog d = new Dog();
            d.isMammel();  //To access isMammel() we need to make an object of Dog or we have to pass Dog as a reference

            //Static method of interface
            Animal.Show();

        }
    }
}