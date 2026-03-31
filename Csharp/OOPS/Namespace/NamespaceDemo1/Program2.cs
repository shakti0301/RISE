namespace Demo1
{
    public class A
    {
        public void show()
        {
            Console.WriteLine("Inside Demo 1 - class A");
        }
        public static void show2()
        {
            Console.WriteLine("Inside Demo 1 - class A - Static Method"); //for that no need to create an object, we can anle to call by class name
        }
    }
}

namespace Demo2
{
    public class B
    {
        public void display()
        {
            Console.WriteLine("Inside Demo 2 - Class B");
        }
    }
}

//Namespace inside Namespace
namespace Demo3
{
    namespace Demo4
    {
        public class C
        {
            public void show3()
            {
                Console.WriteLine("Nested Namespace Demo3.Demo4");
            }
        }
    }
}


//Nested
namespace Demo5
{
    class Outer
    {
        public class Inner
        {
            public void Show()
            {
                Console.WriteLine("Nested Class");
            }
        }
    }
}
