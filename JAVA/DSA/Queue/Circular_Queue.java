package Queue;

public class Circular_Queue {

    int size = 5;
    int Cqueue[] = new int[size];
    int front = -1;
    int rear = -1;

    // Display Queue
    void display() {

        if (front == -1) {
            System.out.println("Queue is Empty");
            return;
        }

        System.out.println("Queue Elements:");

        int i = front;

        while (true) {
            System.out.println("Element at index " + i + " is " + Cqueue[i]);

            if (i == rear)
                break;

            i = (i + 1) % size;
        }
    }

    // Enqueue
    void equeue(int value) {

        // Check Full
        if ((rear + 1) % size == front) {
            System.out.println("Queue is Full");
            return;
        }

        // First Element Insert
        if (front == -1) {
            front = 0;
            rear = 0;
        }
        else {
            rear = (rear + 1) % size;
        }

        Cqueue[rear] = value;
        System.out.println("Inserted: " + value);
    }

    // Dequeue
    void dqueue() {

        if (front == -1) {
            System.out.println("Queue is Empty");
            return;
        }

        System.out.println("Removed: " + Cqueue[front]);

        // If only one element
        if (front == rear) {
            front = -1;
            rear = -1;
        }
        else {
            front = (front + 1) % size;
        }
    }

    public static void main(String[] args) {

        Circular_Queue c1 = new Circular_Queue();

        c1.equeue(34);
        c1.equeue(23);
        c1.equeue(24);
        c1.equeue(90);
        c1.equeue(100);  // Should fill queue

        c1.display();

        c1.dqueue();
        c1.dqueue();

        c1.display();

        c1.equeue(55);   // This will use circular position
        c1.equeue(66);

        c1.display();
    }
}
