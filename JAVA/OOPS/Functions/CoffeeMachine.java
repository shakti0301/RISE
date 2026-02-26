package OOPS.Functions;

public class CoffeeMachine {

    String type;
    int quantity;
    String size;
    double price;

    public static int cup_served = 0;   // static variable to count total cups served

    // Constructor: only coffee type
    public CoffeeMachine(String type) {
        this.type = type;
        this.quantity = 1;
        this.size = "Basic";
        calculatePrice();
        updateCupsServed();
    }

    // Constructor: coffee type + quantity
    public CoffeeMachine(String type, int quantity) {
        this.type = type;
        this.quantity = quantity;
        this.size = "Basic";
        calculatePrice();
        updateCupsServed();
    }

    // Constructor: coffee type + quantity + size
    public CoffeeMachine(String type, int quantity, String size) {
        this.type = type;
        this.quantity = quantity;
        this.size = size;
        calculatePrice();
        updateCupsServed();
    }

    // Calculate price based on size
    public void calculatePrice() {
        double pricePerCup = 0;

        if (size.equalsIgnoreCase("Basic")) {
            pricePerCup = 50;
        } else if (size.equalsIgnoreCase("Medium")) {
            pricePerCup = 70;
        } else if (size.equalsIgnoreCase("Large")) {
            pricePerCup = 90;
        } else {
            System.out.println("Invalid size selected");
        }

        price = pricePerCup * quantity;
    }

    // Update static cup counter
    public void updateCupsServed() {
        cup_served += quantity;
    }

    // Single method to display order and price
    public void displayOrder() {
        System.out.println("Coffee Type : " + type);
        System.out.println("Quantity    : " + quantity);
        System.out.println("Size        : " + size);
        System.out.println("Total Price : ₹" + price);
        System.out.println("Total Cups Served (All Orders): " + cup_served);
        System.out.println("--------------------------------");
    }
}


