package OOPS.Inheritance;

public class ClassB extends ClassA {

    public ClassB() {
        super(11, 17);
        System.out.println("ClassB constructor called");
    }

    public void feature() {
        System.out.println("Feature of ClassB");
    }

    public void anotherFeature() {
        System.out.println("Another feature of ClassB");
    }

    @Override
    public void add(int a, int b) {
        System.out.println("Multiplication: " + (a * b));
        super.add(a, b);
    }
}
