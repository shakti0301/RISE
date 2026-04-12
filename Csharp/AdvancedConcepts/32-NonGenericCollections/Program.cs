using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NonGenericCollections
{
    class Program
    {
        static void Main()
        {
            // 1.ArrayList
            // ArrayList is a non-generic collection that can hold items of any type. It is part of the System.Collections namespace.
            ArrayList aL = new ArrayList();
            aL.Add(1);
            aL.Add("Hello");
            aL.Add(3.14);
            Console.WriteLine("ArrayList contents:");
            foreach (var item in aL)
            {
                Console.WriteLine(item);
            }

            //Methods
            Console.WriteLine("\nArrayList Methods:");
            Console.WriteLine("Count: " + aL.Count);
            Console.WriteLine("Contains 'Hello': " + aL.Contains("Hello"));
            aL.Remove(1);
            Console.WriteLine("After removing 1:");
            foreach (var item in aL)
            {
                Console.WriteLine(item);    
            }
            Console.WriteLine("Contains 1: " + aL.Contains(1)); // False


            //2. Hashtable
            // Hashtable is a non-generic collection that stores key-value pairs. It is part of the System.Collections namespace.
            Hashtable ht = new Hashtable();
            ht.Add("Name", "Alice");
            ht.Add("Age", 30);
            Console.WriteLine("\nHashtable contents:");
            foreach (DictionaryEntry entry in ht)
            {
                Console.WriteLine($"{entry.Key}: {entry.Value}");
            }   

            //Methods
            Console.WriteLine("\nHashtable Methods:");
            Console.WriteLine("Count: " + ht.Count);
            Console.WriteLine("Contains key 'Name': " + ht.ContainsKey("Name"));
            Console.WriteLine("Contains value 30: " + ht.ContainsValue(30));
            ht.Remove("Age");
            Console.WriteLine("After removing 'Age':");
            foreach (DictionaryEntry entry in ht)
            {
                Console.WriteLine($"{entry.Key}: {entry.Value}");  
            }

            // 3. Stack
            // Stack is a non-generic collection that represents a last-in-first-out (LIFO
            Stack stack = new Stack();
            stack.Push(1);
            stack.Push("Hello");
            stack.Push(3.14);
            Console.WriteLine("\nStack contents:");
            foreach (var item in stack)
            {
                Console.WriteLine(item);
            }
            //Methods
            Console.WriteLine("\nStack Methods:");
            Console.WriteLine("Count: " + stack.Count);
            Console.WriteLine("Peek: " + stack.Peek());
            Console.WriteLine("Pop: " + stack.Pop());
            Console.WriteLine("After Pop:");
            foreach (var item in stack)
            {
                Console.WriteLine(item);
            }

             // 4. Queue
            // Queue is a non-generic collection that represents a first-in-first-out (FIFO)
            Queue queue = new Queue();
            queue.Enqueue(1);
            queue.Enqueue("Hello");
            queue.Enqueue(3.14);
            Console.WriteLine("\nQueue contents:");
            foreach (var item in queue)
            {
                Console.WriteLine(item);
            }

            //Methods
            Console.WriteLine("\nQueue Methods:");
            Console.WriteLine("Count: " + queue.Count);
            Console.WriteLine("Peek: " + queue.Peek());
            Console.WriteLine("Dequeue: " + queue.Dequeue());
            Console.WriteLine("After Dequeue:");
            foreach (var item in queue)
            {
                Console.WriteLine(item);
            }

             // 5. SortedList
            // SortedList is a non-generic collection that stores key-value pairs in sorted order based on the keys. It is part of the System.Collections namespace.
            SortedList sortedList = new SortedList();
            sortedList.Add("Name", "Alice");
            sortedList.Add("Age", 30);
            Console.WriteLine("\nSortedList contents:");
            foreach (DictionaryEntry entry in sortedList)
            {
                Console.WriteLine($"{entry.Key}: {entry.Value}");
            }

            //Methods
            Console.WriteLine("\nSortedList Methods:");
            Console.WriteLine("Count: " + sortedList.Count);
            Console.WriteLine("Contains key 'Name': " + sortedList.ContainsKey("Name"));
            Console.WriteLine("Contains value 30: " + sortedList.ContainsValue(30));
            sortedList.Remove("Age");
            Console.WriteLine("After removing 'Age':");
            foreach (DictionaryEntry entry in sortedList)
            {
                Console.WriteLine($"{entry.Key}: {entry.Value}");
            }

            // 6. BitArray
            // BitArray is a non-generic collection that represents an array of bits. It is part of the System.Collections namespace.
            BitArray bitArray = new BitArray(8);
            bitArray.Set(0, true);
            bitArray.Set(3, true);
            Console.WriteLine("\nBitArray contents:");
            for (int i = 0; i < bitArray.Length; i++)
            {
                Console.WriteLine($"Bit {i}: {bitArray.Get(i)}");
            }

            //Methods
            Console.WriteLine("\nBitArray Methods:");
            Console.WriteLine("Length: " + bitArray.Length);
            Console.WriteLine("Count of true bits: " + bitArray.Cast<bool>().Count(b => b));


        }

    }
}