using System;

namespace AbstractDemo
{
    abstract class Animal   //use abstract keyword to make class abstract
    {
        public string name; //define a variable in abstract class
        //We can able to make constructor in abstract class (Parameterized and Non Parameterized)
        public Animal(string n)
        {
            name = n;
            Console.WriteLine("Animal name is " +name);
        }
        //We can't able to make an object of abstract class so we are going to pass value of 'n' in childs object

        //Abstract method does not have body
        public abstract void animalSound();

        //Normal method 
        public void eat()
        {
            Console.WriteLine("Animal is eating");
        }

        //Property
        public abstract int Age { get; set;} //Must be implemented in child class

    }

    class Dog : Animal
    {
        private int age;
        // Child class constructor calling base constructor
        public Dog(string n) : base(n)
        {
            Console.WriteLine("Dog constructor called");
        }
        public override void animalSound()
        {
            // The body of animalSound() is provided here
            Console.WriteLine("The Dog says: Bhow Bhow");
        }
        public override int Age
        {
            get { return age; }
            set { age = value; }
        }
    }

    class Program
    {
        static void Main()
        {
            // Animal a = new Animal();   - Cannot possible it will gives an error (we cant able to create an object of abstract class)
            //Because abstract class is incomplete, so object cannot be created.
            //But we can able to made reference
            // Animal a; -- Like this 

            //Object of child class
            Dog d = new Dog("Tommy");
            d.animalSound();
            d.eat();
            d.Age = 3;  //set

            Console.WriteLine("Age of dog is "+d.Age);   //get

        }
    }
}