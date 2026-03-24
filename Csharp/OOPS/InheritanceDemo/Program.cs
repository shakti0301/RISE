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
    public void EngineStart()
    {
        Console.WriteLine("Engine is running");
    }
}

// Child class (Inheritance + Composition)
class Car : Vehicle   // IS-A relationship
{
    private Engine engine = new Engine();  // HAS-A relationship

    public void Drive()
    {
        engine.EngineStart();  // using Engine
        Console.WriteLine("Car is driving");
    }
}

class Program
{
    static void Main()
    {
        Car c = new Car();

        c.Start();   // inherited (IS-A)
        c.Drive();   // own + HAS-A
    }
}