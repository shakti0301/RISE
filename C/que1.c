#include <stdio.h>
int main(){
    printf("Smart Lock System\n");
    int corr_pin = 4589;
    int pin;
    printf("You have 3 attempts to enter the correct PIN\n");

    for(int i = 1; i <= 3; i++){
        printf("Enter the PIN : ");
        scanf("%d", &pin);

        if(pin == corr_pin){
            printf("login successfull");
            break;
        }
        else{
            printf("Incorrect PIN Try Again\n");
        }
        if(i == 3){
            printf("You have exhausted all attempts. The system is locked.");
        }
    }
    

}