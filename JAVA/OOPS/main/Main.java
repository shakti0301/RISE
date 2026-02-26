package OOPS.main;
import OOPS.Functions.*;
import OOPS.Inheritance.*;
import OOPS.Interface.*;



public class Main {

    void my_function(){
        System.out.println("My Function");
        System.out.println("----------------------");
    }

    public static void main(String[] args) {
        System.out.println("Hello and welcome!");



        // calling

        Main m1 = new Main();
        m1.my_function();

        RISE r1 = new RISE();
        r1.getDetails(7, "Shaktisinh Raolji", "Fullstack .NET");

        r1.display();

        Movie movie1 = new Movie("Dhurandhar", 5);
        movie1.display();

        BankAccount b1 = new BankAccount("Shakti Raolji", 89888543, 2000);
        b1.displayAccountDetails();
        b1.deposit(1000);
        b1.withdraw(1200);
        b1.displayAccountDetails();

        CoffeeMachine order1 = new CoffeeMachine("Espresso");
        order1.displayOrder();

        CoffeeMachine order2 = new CoffeeMachine("Latte", 2);
        order2.displayOrder();

        CoffeeMachine order3 = new CoffeeMachine("Cappuccino", 3, "Large");
        order3.displayOrder();

        System.out.println("Final Total Cups Served: " + CoffeeMachine.cup_served);
        System.out.println("--------------------------------");




//        int a[] = {4, 7, 21, 5, 76, 22};
//        for (int i : a){
//            System.out.println(i);
//        }


        String items[] = {"Pizza", "Pav Bhaji", "Dosa"};

        FoodOrder f = new FoodOrder(14432, FoodType.Veg, items);
        f.displayOrder();
        System.out.println("--------------------------------");


        TrafficManagement t = new TrafficManagement();
        t.displaySignal(TrafficSignals.valueOf("green"));
        System.out.println("--------------------------------");

        double[] items1 = {200, 150, 100};
        OrderSystem order5 = new OrderSystem(101, items1);

        order5.calculateBill();
        order5.displayOrder();

        double[] items2 = {500, 300};
        OrderSystem order6 = new OrderSystem(102, items2);

        order6.calculateBill(10); // 10% discount
        order6.displayOrder();

        double quickBillAmount = OrderSystem.quickBill(120, 180, 200);
        System.out.println("Quick Bill Amount : ₹" + quickBillAmount);
        System.out.println("--------------------------------");

        SmartPhone smartPhone = new SmartPhone();
        smartPhone.clicksPhoto();
        smartPhone.makeCall();
        smartPhone.endCall();
        smartPhone.playMusic();
        smartPhone.stopMusic();

        System.out.println("--------------------------------");

        ClassB classB = new ClassB();
        classB.featureOne();
        classB.feature();
        classB.anotherFeature();
        classB.add(7, 8);

        IPhone17 iPhone17 = new IPhone17();
        iPhone17.dynamicIslandFeature();
        iPhone17.faceIdUnlock();

        System.out.println("--------------------------------");
    }
}
