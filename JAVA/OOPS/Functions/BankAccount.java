package OOPS.Functions;

public class BankAccount {

    String nameOfHolder;
    int bankAccNo;
    int balance;
    int minimumBalance;
    boolean isActive;

    public BankAccount(String nameOfHolder, int bankAccNo, int initialBalance) {
        this.nameOfHolder = nameOfHolder;
        this.bankAccNo = bankAccNo;
        this.minimumBalance = 500;

        if (initialBalance >= minimumBalance) {
            this.balance = initialBalance;
            isActive = true;
        } else {
            isActive = false;
        }
    }

    public void deposit(int amount) {
        System.out.println("Deposited amount: " + amount);
        if (isActive) {
            if (amount > 0) {
                balance = balance + amount;
            }else {
                System.out.println("Invalid Amount");
            }
        }
        System.out.println("Total Balance: " + balance);
    }

    public void withdraw(int amount) {
        if (isActive) {
            System.out.println("Withdrawal Amount: " + amount);
            if (amount > 0) {
                if (balance - amount >= minimumBalance) {
                    balance = balance - amount;
                }else{
                    System.out.println("This amount cannot be withdrawn, because the amount is crossing the limit of your required minimum balance!");
                }
            }else{
                System.out.println("Invalid Amount");
            }
        }
        System.out.println("Your Balance: " + balance);
    }

    public void displayAccountDetails() {
        if (isActive) {
            System.out.println("Account Holder Name : " + nameOfHolder);
            System.out.println("Account Number     : " + bankAccNo);
            System.out.println("Minimum Balance    : " + minimumBalance);
            System.out.println("Current Balance    : " + balance);
            System.out.println("Account Status     : Active");
            System.out.println("----------------------");
        } else {
            System.out.println("Account is not active");
            System.out.println("Minimum balance required: " + minimumBalance);
            System.out.println("----------------------");
        }
    }
}
