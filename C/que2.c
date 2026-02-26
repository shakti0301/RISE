#include <stdio.h>
int main(){
    printf("Electricity Bill");
    int units;
    float bill;
    printf("Enter the number of units consumed: ");
    scanf("%d", &units);
    if (units <= 100){
        bill = units * 2;
    }
    else if (units >= 101 && units <=300){
        bill = units * 3;
    }
    else {
        bill = units * 5;
    }

    printf("Total Electricity Bill: %.2f", bill);
}