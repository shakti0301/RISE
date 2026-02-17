#include <stdio.h>
int main() {
    printf ("Online Exam Result\n");
    int marks;
    float avg;
    float maths, oop, dbms, os, se;

    printf("Enter the marks of maths: ");
    scanf("%f", &maths);
    printf("Enter the marks of oop: ");
    scanf("%f", &oop);
    printf("Enter the marks of dbms: ");
    scanf("%f", &dbms);
    printf("Enter the marks of os: ");
    scanf("%f", &os);
    printf("Enter the marks of se: ");
    scanf("%f", &se);

    avg = (maths + oop + dbms + os + se) / 5; 
    printf("The average marks is: %.2f\n", avg);

    if(maths >= 40 && oop >= 40 && dbms >= 40 && os >= 40 && se >= 40 && avg >= 50) {
        printf("Result: Pass\n");
    } else {
        printf("Result: Fail\n");
    }
}