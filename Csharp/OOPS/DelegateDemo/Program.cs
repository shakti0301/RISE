using System;

namespace DelegateDemo
{
    public delegate void delmethod();         //delegate method
    class myClass
    {
        public void test(delmethod t)         //Passing delegate method in method as an arguement
        {
            t();
        }

        public static void show()           //Static method 
        {
            Console.WriteLine("Static Show method from myClass");
        }
        public static void display()
        {
            Console.WriteLine("Static Display method from myClass");
        }
        public void method1()          //Normal method 
        {
            Console.WriteLine("Normal method1 method from myClass");
        }
    }
    class Project
    {
        static void Main()
        {
            delmethod dl1 = new delmethod(myClass.show); //Static method in myClass

            delmethod dl2 = myClass.display;

            //for normal method we have to create object of the class 
            myClass p = new myClass();

            delmethod dl3 = new delmethod(p.method1);

            dl1();
            dl2();
            dl3();

            //Now passing a deligate method in a normal method 
            Console.WriteLine("");

            p.test(dl2);        //it will pass dl3 as an arguement in to a test method -> at 't'
        }
    }
}