#include <stdio.h>

void change( int *x ){
    *x= 100;
    //printf("Inside change function: x = %d\n", x);
}

int main(){
    int a = 10;
    printf ("Before change function: a = %d\n", a);
    change(&a);
}