using System;
using System.Collections.Generic;
using System.Collections;

namespace Collections
{
    class Program
    {
        static void Main()
        {
            //There are 2 type of collections : 1. Generic<T> and 2. Non Generic
            //------Generic------           

            // 1. List Class
            // The List<T> class is used to store multiple elements of the same data type that can be accessed using the indexes. We can add, insert and remove elements inside the list. Moreover, we can dynamically change the size of the list.
            List<int> number1 = new List<int>();
            number1.Add(102);
            number1.Add(112);
            number1.Add(21);
            number1.Add(12);
            number1.Add(14);
            number1.Remove(12);

            number1.Insert(1, 13);     //1 is index and 13 is value 
            number1.RemoveAt(0);       //remove by index 
            
            Console.WriteLine("-----List-----");
            foreach(int i in number1)
            {
                Console.WriteLine(i);
            }

            //2. Stack Class
            //The Stack<T> class is also generic, which means we store data elements of the same data type.
            // In stack, the elements are stored in LIFO(Last In First Out) manner. With the help of methods, we can perform operations in stack:
            // Push()- insert elements
            // Pop()- remove elements

            Stack<int> number2 = new Stack<int>();
            number2.Push(12);
            number2.Push(13);
            number2.Push(11);
            number2.Push(1);
            number2.Pop();

            Console.WriteLine("-----Stack-----");
            foreach(int i in number2)
            {
                Console.WriteLine(i);
            }

            Console.WriteLine("top element of stack is "+ number2.Peek());

            //3. Queue
            // A Queue<T> is a generic class that arranges elements of a specified data type using First In First Out (FIFO) principles. 
            Queue<string> fruits = new Queue<string>();
            fruits.Enqueue("Apple");
            fruits.Enqueue("Banana");
            fruits.Enqueue("Orange");
            fruits.Enqueue("Watermelon");


            string removedElement = fruits.Dequeue();
            Console.WriteLine("\n-----Queue-----");

            Console.WriteLine("Removed (Dequeued) element is " +removedElement+"\n");

            foreach(string item in fruits)
            {
                Console.WriteLine(item);
            }

            Console.WriteLine("\nTop value is "+fruits.Peek());
            
            // check if queue contains "Banana"
            Console.WriteLine("Fruits (Queue) has 'Banana' : "+fruits.Contains("Banana")); //Print True
            

            //4. Dictionary
            // A Dictionary<TKey, TValue> is a generic collection that consists of elements as key/value pairs that are not sorted in an order.
            Dictionary<int, string> country = new Dictionary<int, string>();
            
            country.Add(5, "Brezil");
            country.Add(1, "India");
            country.Add(2, "Russia");
            country.Add(3, "China");
            country.Add(4, "Usa");

            Console.WriteLine("\n-----Dictionary-----");
            Console.WriteLine("Country having key -> 3 is "+country[3]);
            //Change the value using key
            Console.WriteLine("Country having key -> 4 Before change : "+country[4]);

            country[4] = "Sri Lanka";
            Console.WriteLine("Country having key -> 4 After change : "+country[4]);

            //Remove Dictionary Elements
            country.Remove(3);

            Console.WriteLine("\n");
            //to fetch all item ue use foreach 
            foreach(KeyValuePair<int, string> item in country)
            {
                Console.WriteLine("{0} : {1}", item.Key, item.Value);
            } 
            
            //5. HashSet
            // A HashSet<T> is a collection of unique elements. It does not allow duplicates and does not maintain any particular order.
            HashSet<int> hs = new HashSet<int>();
            hs.Add(10);
            hs.Add(5);
            hs.Add(12);
            hs.Add(10);     //It will automatically remove duplicate value

            //Te remove we will use .remove()

            Console.WriteLine("\n-----HashSet-----");
            //For print all values of HashSet
            foreach(int num in hs)
            {
                Console.WriteLine(num);
            }


            Console.WriteLine("\n");
            HashSet<int> set1 = new HashSet<int> { 1, 2, 3, 5 };
            HashSet<int> set2 = new HashSet<int> { 3, 4, 5 };

            // Union of two sets
            set1.UnionWith(set2);
            Console.WriteLine("After Union: "  + string.Join(", ", set1));

            // Intersection of two sets
            set1.IntersectWith(new HashSet<int> { 3, 5 });
            Console.WriteLine("After Intersection: "  + string.Join(", ", set1));

            // Difference of sets
            set1.ExceptWith(new HashSet<int> { 5 });
            Console.WriteLine("After Difference: "  + string.Join(", ", set1));

        }
    }
}