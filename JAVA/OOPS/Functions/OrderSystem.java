package OOPS.Functions;

public class OrderSystem {
    static double total_orders = 0;
    static double taxRate;
    static double platformFee;
    int orderID;
    double[] itemPrice;
    double itemTotal;
    double finalBill;


    static{
        taxRate = 18;
        platformFee = 18;
        total_orders = 0;
        System.out.println("Total Orders Placed : " + total_orders);
        System.out.println("Current Tax Rate    : " + taxRate + "%");
        System.out.println("Platform Fee        : ₹" + platformFee);
        System.out.println("--------------------------------");
    }

    public OrderSystem(int orderID){
        this.orderID = orderID;
        this.itemTotal = 0.0;
        this.finalBill = 0.0;
        total_orders++;
    }

    public OrderSystem(int orderId, double[] itemPrice) {
        this.orderID = orderId;
        this.itemPrice = itemPrice;

        for (double price : itemPrice) {
            itemTotal += price;
        }

        total_orders++;
    }

    public double calculateBill() {

        double taxAmount = itemTotal * taxRate / 100;
        finalBill = itemTotal + taxAmount + platformFee;

        return finalBill;
    }

    public double calculateBill(double discountPercent) {
        double discountAmount = itemTotal * discountPercent / 100;
        double discountedTotal = itemTotal - discountAmount;
        double taxAmount = discountedTotal * taxRate / 100;

        finalBill = discountedTotal + taxAmount + platformFee;
        return finalBill;
    }

    public static double quickBill(double... prices) {
        double total = 0.0;

        for (double price : prices) {
            total += price;
        }

        double taxAmount = total * taxRate / 100;
        return total + taxAmount + platformFee;
    }



    public void displayOrder() {
        System.out.println("Order ID       : " + orderID);
        System.out.println("Item Total     : ₹" + itemTotal);
        System.out.println("Final Bill     : ₹" + finalBill);
        System.out.println("--------------------------------");
    }

}



