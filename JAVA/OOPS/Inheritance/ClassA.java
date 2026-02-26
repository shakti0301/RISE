package OOPS.Inheritance;

public class ClassA {

    public ClassA(int a, int b) {
        System.out.println("ClassA constructor sum: " + (a + b));
    }

    public void featureOne() {
        System.out.println("Feature one");
    }

    public void featureTwo() {
        System.out.println("Feature two");
    }

    public void add(int a, int b) {
        System.out.println("Addition: " + (a + b));
    }
}
