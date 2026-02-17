package OOPS.Inheritence;

public class ClassB extends ClaasA{

    ClassB(){
        super(11,17);

        //

        System.out.println("Helloooo");
    }

    public void feature() {
        System.out.println("Feature of ClassB");
    }

    public void Anotherfeature() {
        System.out.println("Another Feature of ClassB");
    }

    @Override
    public void add(int a, int b){
        System.out.println("Multiplication: " + a*b);
        super.add(100, 50);
    }
}
