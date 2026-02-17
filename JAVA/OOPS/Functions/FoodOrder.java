package OOPS.Functions;


/* online food order system
food category - create Enum
array - list of item order
constructor - to create order
variable length argument - multiple prices to pass dynamically */


public class FoodOrder {
    int order_ID;
    foodType FoodType;
    String items[];



    public FoodOrder(int order_ID, foodType FoodType, String items[]){
        this.FoodType = FoodType;
        this.order_ID = order_ID;
        this.items = items;
    }

    public double calculatePrice(double ...price){
        double total = 0;
        for (double i : price){
            total = i + total;
        }
        return total;
    }

    public void displayOrder(){
        System.out.println("Order ID: " + order_ID);
        System.out.println("Food Type: " +FoodType);
        System.out.println("Your orders are: ");
        for (String i : items){
            System.out.println(i);
        }
        System.out.println(calculatePrice(345,230,456));
    }

}