package Queue;

public class DoubleQueue {
    private final int size;
    private final int[] dqueue;
    private int front;
    private int rear;

    public DoubleQueue() {
        this(5);
    }

    public DoubleQueue(int size) {
        if (size <= 0) {
            throw new IllegalArgumentException("Size must be greater than 0");
        }
        this.size = size;
        this.dqueue = new int[size];
        this.front = -1;
        this.rear = -1;
    }

    private boolean isFull() {
        return (front == 0 && rear == size - 1) || (front == rear + 1);
    }

    private boolean isEmpty() {
        return front == -1;
    }

    void insertRear(int value) {
        if (isFull()) {
            System.out.println("Queue is full");
            return;
        }

        if (isEmpty()) {
            front = 0;
            rear = 0;
        } else if (rear == size - 1) {
            rear = 0;
        } else {
            rear++;
        }

        dqueue[rear] = value;
        System.out.println("Inserted from rear: " + value);
    }

    void insertFront(int value) {
        if (isFull()) {
            System.out.println("Queue is full");
            return;
        }

        if (isEmpty()) {
            front = 0;
            rear = 0;
        } else if (front == 0) {
            front = size - 1;
        } else {
            front--;
        }

        dqueue[front] = value;
        System.out.println("Inserted from front: " + value);
    }

    void deleteFront() {
        if (isEmpty()) {
            System.out.println("Queue is empty");
            return;
        }

        int deleted = dqueue[front];
        if (front == rear) {
            front = -1;
            rear = -1;
        } else if (front == size - 1) {
            front = 0;
        } else {
            front++;
        }

        System.out.println("Deleted from front: " + deleted);
    }

    void deleteRear() {
        if (isEmpty()) {
            System.out.println("Queue is empty");
            return;
        }

        int deleted = dqueue[rear];
        if (front == rear) {
            front = -1;
            rear = -1;
        } else if (rear == 0) {
            rear = size - 1;
        } else {
            rear--;
        }

        System.out.println("Deleted from rear: " + deleted);
    }

    int getFront() {
        if (isEmpty()) {
            throw new IllegalStateException("Queue is empty");
        }
        return dqueue[front];
    }

    int getRear() {
        if (isEmpty()) {
            throw new IllegalStateException("Queue is empty");
        }
        return dqueue[rear];
    }

    void display() {
        if (isEmpty()) {
            System.out.println("Queue is empty");
            return;
        }

        System.out.print("Deque elements: ");
        int i = front;
        while (true) {
            System.out.print(dqueue[i] + " ");
            if (i == rear) {
                break;
            }
            i = (i + 1) % size;
        }
        System.out.println();
    }

    public static void main(String[] args) {
        DoubleQueue d1 = new DoubleQueue(5);

        d1.insertFront(45);
        d1.insertRear(60);
        d1.insertFront(30);
        d1.insertRear(75);
        d1.display();

        d1.deleteFront();
        d1.deleteRear();
        d1.display();

        System.out.println("Front: " + d1.getFront());
        System.out.println("Rear: " + d1.getRear());
    }
}
