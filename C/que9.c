#include <stdio.h>

int main() {

    float loan_amt, monthly_payment, interest, balance;
    int months = 0;

    printf("Enter loan amount: ");
    scanf("%f", &loan_amt);

    monthly_payment = loan_amt * 0.1;

    balance = loan_amt;

    for(months = 1; months <=10; months++){
        interest = balance * 0.03;
        balance = balance - monthly_payment;
        if (balance < 0){
            balance = 0;
        }

        printf("\nMonth %d", months);
        printf("\nMonthly Principal: %.0f", monthly_payment);
        printf("\nInterest: %.0f", interest);
        printf("\nRemaining Balance: %.0f\n", balance);

    }
}