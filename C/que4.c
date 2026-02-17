#include <stdio.h>
int main(){
    printf("ATM withdrawal validation\n");
    int balance = 10000;
    int withdraw_amount;
    printf("Enter the amount to withdraw: ");
    scanf("%d", &withdraw_amount);

    if(withdraw_amount % 100 == 0){
        if (withdraw_amount <= balance){
            balance -= withdraw_amount;
            printf("Success - Please collect your cash\n");
            printf("Remaining balance: %d\n", balance);
        }
        else{
            printf("Fail - Insufficient balance.\n");
        }
    }else{
        printf("Fail - Please enter the amount in multiples of 100.\n");
    }

}