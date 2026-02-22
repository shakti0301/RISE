package OOPS.Functions;

/* online food order system
food category - create Enum
array - list of item order
constructor - to create order
variable length argument - multiple prices to pass dynamically */

public class FoodOrder {
    int orderId;
    FoodType foodType;
    String[] items;

    public FoodOrder(int orderId, FoodType foodType, String[] items) {
        this.foodType = foodType;
        this.orderId = orderId;
        this.items = items;
    }

    public double calculatePrice(double... price) {
        double total = 0;
        for (double i : price) {
            total += i;
        }
        return total;
    }

    public void displayOrder() {
        System.out.println("Order ID: " + orderId);
        System.out.println("Food Type: " + foodType);
        System.out.println("Your orders are: ");
        for (String i : items) {
            System.out.println(i);
        }
        System.out.println("Total Price: " + calculatePrice(345, 230, 456));
    }
}
