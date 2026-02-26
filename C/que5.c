#include <stdio.h>
int main (){
    printf("Traffic Signal Simulator\n");
    int Red = 1, Yellow = 2, Green = 3;
    int signal;
    
    while (signal != 0){
        printf("Enter the signal color code (1 for Red, 2 for Yellow, 3 for Green): ");
        scanf("%d", &signal);
        switch(signal){
            case 1:
                printf("Red Signal: Stop\n");
                break;
            case 2:
                printf("Yellow Signal: Ready to move\n");
                break;
            case 3:
                printf("Green Signal: Move now\n");
                break;
            case 0:
                printf("Exiting the simulator\n");
                break;
            default:
                printf("Invalid signal color code\n");
        }
    }
}