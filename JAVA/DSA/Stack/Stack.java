package Stack;

public class Stack {
    int size = 5;
    int stack[] = new int[size];
    int top = -1;


    void push(int value) {
        if (top == size - 1) {
            System.out.println("Stack Overflow");
        } else {
            top++;
            stack[top] = value;
            System.out.println("Push the element : " + value);
        }
    }

    void display() {
        if (top == -1) {
            System.out.println("Stack Underflow");
        } else {
            for (int i = top; i >= 0; i--) {
                System.out.println("Element at " +i + " is " + stack[i]);
            }
        }
    }

    void pop(){
        if (top == -1){
            System.out.println("Stack Underflow");
        }
        else {
            System.out.println("Popped Element is "+stack[top]);
            top--;
        }
    }

    void peek(){
        if(top == -1){
            System.out.println("Stack Underflow");
        }else {
            System.out.println("Top is at : " +top);
            System.out.println("PEEK Value is : " +stack[top]);
        }

    }

    public static void main(String[] args) {
        Stack s1 = new Stack();
        s1.push(23);
        s1.push(25);
        s1.push(23);
        s1.push(24);
        s1.push(89);

        System.out.println();
        System.out.println("Printing Values : ");

        s1.display();

        System.out.println();
        System.out.println("Popping Values : ");

        s1.pop();
        s1.pop();

        System.out.println();
        System.out.println("Printing Values : ");

        s1.display();

        System.out.println();
        System.out.println("Printing Peak Value : ");
        s1.peek();

    }

}