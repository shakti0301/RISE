using System;

// Base class (Parent)
class Vehicle
{
    public void Start()
    {
        Console.WriteLine("Vehicle started");
    }
}

// HAS-A class
class Engine
{
    public int power;

    public Engine(int p)
    {
        power = p;
    }

    public void EngineStart()
    {
        Console.WriteLine("Engine is running with power: " + power);
    }
}

// Child class (Inheritance + Composition)
class Car : Vehicle   // IS-A
{
    public Engine engine;  // reference only 

    public void Drive()
    {
        engine.EngineStart();  
        Console.WriteLine("Car is driving");
    }
}

class Program
{
    static void Main()
    {
        Car c = new Car();

        // manually initializing Engine (like s.objA = new A(10))
        c.engine = new Engine(150);

        c.Start();   // inherited
        c.Drive();   // uses Engine
    }
}