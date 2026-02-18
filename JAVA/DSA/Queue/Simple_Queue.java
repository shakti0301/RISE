package Queue;

public class Simple_Queue {
    int size = 5;
    int Queue[] = new int[size];
    int rear = -1;
    int front = -1;

    void equeue(int value){
        if(rear == size-1){
            System.out.println("Queue is Full");
        }else{
            if(front == -1){
                front = 0;
            }
            rear++;
            Queue[rear] = value;
            System.out.println("Insert the element " + value);
        }
    }

    void  dqueue(){
        if(front == -1 || front > rear) {
            System.out.println("Queue is empty");
        }else{
            System.out.println("Remove the element" +Queue[front]);
            front++;
        }
    }

    void  display(){
        if(front == -1 || front > rear) {
            System.out.println("Queue is empty");
        }else {
            for (int i = front; i <= rear; i++) {
                System.out.println("Element at " + i + " is " + Queue[i]);
            }
        }
    }

    public static void main(String[] args){
        Simple_Queue q1 = new Simple_Queue();
        q1.equeue(23);
        q1.equeue(90);
        q1.equeue(103);
        q1.equeue(93);
        q1.equeue(33);


        q1.dqueue();
        q1.dqueue();
        q1.dqueue();

        q1.display();
    }
}
