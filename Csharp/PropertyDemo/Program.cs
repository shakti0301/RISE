using System;
using System.Diagnostics.Contracts;
using System.Runtime.CompilerServices;

namespace PropertyDemo
{
    class NormalProperty
    {
        int x;
        //Instead of making getter setter method we can make property 
        public int Y
        {

            get
            {
                return x;
            }
            set
            {
                x = value;   
            }
        }

    }

    class AutoImplementedProperty
    {
        public int T1 { get; set; }
        public int T2 { get; set; } = 23; //giving default value
        public static int T3 { get; set; } = 24;
    }

    class Program
    {
        static void Main()
        {
            NormalProperty a = new NormalProperty();
            a.Y = 12;
            Console.WriteLine(a.Y);


            AutoImplementedProperty b = new AutoImplementedProperty();
            b.T1 = 231;
            System.Console.WriteLine(b.T1);

            System.Console.WriteLine(b.T2);

            //Static property 
            System.Console.WriteLine(AutoImplementedProperty.T3);
        }
    }
}