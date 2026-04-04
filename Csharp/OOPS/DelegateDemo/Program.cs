using System;

namespace DelegateDemo
{
    public delegate void delmethod();         //singlecast delegate method
    public delegate void delmethod2(int x, int y);    //Multicast delegate method
    public delegate void anonymousDel();          //Anonymous delegate method

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

    //I create this class for multiple delegate 
    class Calc
    {
        public void addition(int x, int y)
        {
            int sum = x + y;
            Console.WriteLine("Addition : " +sum);
        }

        public void substract(int x, int y)
        {
            int sub = x - y;
            Console.WriteLine("Substraction : " +sub);
        }

        public void multiple(int x, int y)
        {
            int mul = x * y;
            Console.WriteLine("Multiplication : " +mul);
        }
    }

    //Now for Anonymous Delegate we dont need to create a class and define method for that

    class Project
    {
        static void Main()
        {
            //Single cast 
            delmethod dl1 = new delmethod(myClass.show); //Static method in myClass

            delmethod dl2 = myClass.display;

            //for normal method we have to create object of the class 
            myClass p = new myClass();

            delmethod dl3 = new delmethod(p.method1);

            Console.WriteLine("Singlecast Delegate methods :");
            dl1();
            dl2();
            dl3();

            //Now passing a deligate method in a normal method 
            Console.WriteLine("\n");

            p.test(dl2);        //it will pass dl3 as an arguement in to a test method -> at 't'

            //Multiplecast 

            //Object of Calc Class
            Calc c = new Calc();
            delmethod2 dlm = new delmethod2(c.addition);

            //Now add another method in 'dlm' by using '+=' operator
            dlm += new delmethod2(c.substract);
            dlm += new delmethod2(c.multiple);

            //Now calling dlm 
            Console.WriteLine("\nMulticast Delegate methods :");
            dlm(12, 10);

            //Now remove a method from 'dlm' by using '-=' operator
            dlm -= new delmethod2(c.substract);
            Console.WriteLine("\nAfter removing substract method from dlm");
            dlm(12, 10);

            //Anonymous Delegate
            // Here we are not creating any method for anonymous delegate and directly writing the code in the body of the delegate method
            anonymousDel Display = delegate()
            {
                Console.WriteLine("\nAnonymous Delegate method");
            };
            Display();
        }
    }
}