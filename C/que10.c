#include <stdio.h>

void calculate_bill(){

    float bill, charges;
    char name[10];
    printf("\nEnter Your Name : ");
    scanf("%s", &name);
    
    long int cust_id;
    printf("Enter Your Customer ID : ");
    scanf("%ld", &cust_id);

    int units;
    printf("Enter the Units : ");
    scanf("%d", &units);


    if(units <= 100){
        bill = units * 5;
    }else if(units > 100 && units<=200){
        bill = units * 7;
    }else{
        bill = units * 10;
    }


    if(bill > 2000){
        charges = bill * 0.05;
        bill = bill + charges;
    }
    printf("\nElectricity Bill");
    printf("\nName             : %s", name);
    printf("\nCustomer id      : %ld", cust_id);
    printf("\nUnits Consumed   : %d", units);
    printf("\nTotal Bill       :%.2f", bill);
}

int main(){

    int val = -1;
        
    while (val != 0){
        printf("\n\nEnter 1 to calcluate bill and 0 for stop): ");
        scanf("%d", &val);
        switch(val){
            case 1:
                calculate_bill();
                break;
            case 0:
                printf("Exiting\n");
                break;
            default:
                printf("Invalid code\n");
        }
    }
    
}