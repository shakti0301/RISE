#include <stdio.h>
void parking(){
    int num;
    float hrs, parking_rev;
    printf("Enter Number of Parking Slots : ");
    scanf("%d", &num);
    float slots[num];
    float total_rev = 0;
    float max;
    
    for(int i = 0; i < num; i++){
        printf("How many Hours parked in slot %d : ", i+1);
        scanf("%f", &hrs);
        slots[i] = hrs;

        if(slots[i] <= 2.0){
            parking_rev = slots[i] * 30;
        }else if(slots[i]>=3 && slots[i]<=5){
            parking_rev = slots[i] * 50;
        }else{
            parking_rev = slots[i] * 100;
        }

        if(slots[i] > 8){
            printf("\nWARNING Slot %d is parked more than 8hrs\n\n", i+1);
        }
    }

    for(int i = 0; i < num ; i++){
        total_rev = total_rev + parking_rev;
    }
    printf("\n\nTotal Parking Revenue is ₹ %f", total_rev);

    for(int i = 0; i < num; i++){
        max = slots[i];
        if(max <= slots[i]){
            max = slots[i];
        }
    }

    printf("\n\nHighest Parked Hours is %f hrs", max);

}

int main(){
    printf("Smart Parking Slot Management System\n\n");
    parking();
    
}