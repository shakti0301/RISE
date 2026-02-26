#include <stdio.h>
#include <stdlib.h>


void permenant(){
    float basic, da, hra, per, tax;
    int num;
    printf("How many users's data you want to enter: ");
    scanf("%d",&num);

    int i;
    float a[num];

    for(i=0;i<num;i++){
        printf("Enter the basic salary of employee %d: ",i+1);
        scanf("%f",&basic);
        while (basic < 0)   
        {
            printf("Basic salary cannot be negative. Please enter again: ");
            scanf("%f",&basic);
        }
        
        da = 0.1 * basic;
        hra = 0.2 * basic;
        per = basic + da + hra;
        tax = 0.1 * per;
        per = per - tax;

        if(per > 50000){
            per = per + 5000;
        }


        a[i] = per;
    }

    for(i=0;i<num;i++){
        printf("The total salary of employee %d is: %.2f\n", i+1, a[i]);
    }

    float total = 0;
    for(i=0;i<num;i++){
        total = total + a[i];
    }
    printf("The total salary of all permanent employees is: %.2f\n", total);
    float max_salary=0;
    for(i=0;i<num;i++){
        if(a[i] > max_salary){
            max_salary = a[i];
        }
    }
    printf("The highest salary among all permanent employees is: %.2f\n", max_salary);
    float min_salary=a[i];
    for(i=0;i<num;i++){
        if(a[i] < min_salary || min_salary == 0){
            min_salary = a[i];
        }
    }
    printf("The lowest salary among all permanent employees is: %.2f\n", min_salary);
}

void contract(){
    float basic, tax;
    int num;
    printf("How many users's data you want to enter: ");
    scanf("%d",&num);
    

    int i;
    float a[num];

    for(i=0;i<num;i++){
        printf("Enter the basic salary of employee %d: ",i+1);
        scanf("%f",&basic);
        while (basic < 0)   
        {
            printf("Basic salary cannot be negative. Please enter again: ");
            scanf("%f",&basic);
        }
        tax = 0.05 * basic;
        basic = basic - tax;

        if(basic > 50000){
            basic = basic + 5000;
        }

        a[i] = basic;

    }

    for(i=0;i<num;i++){
        printf("The total salary of employee %d is: %.2f\n", i+1, a[i]);
    }

    float total = 0;
    for(i=0;i<num;i++){
        total = total + a[i];
    }
    printf("The total salary of all permanent employees is: %.2f\n", total);
        float max_salary=0;
    for(i=0;i<num;i++){
        if(a[i] > max_salary){
            max_salary = a[i];
        }
    }
    printf("The highest salary among all permanent employees is: %.2f\n", max_salary);
    float min_salary=a[i];
    for(i=0;i<num;i++){
        if(a[i] < min_salary || min_salary == 0){
            min_salary = a[i];
        }
    }
    printf("The lowest salary among all permanent employees is: %.2f\n", min_salary);
}

void intern(){
    float stipend;
    int num;
    printf("How many users's data you want to enter: ");
    scanf("%d",&num);

    int i;
    float a[num];

    for(i=0;i<num;i++){
        printf("Enter the stipend of employee %d: ",i+1);
        scanf("%f",&stipend);
        while (stipend < 0)   
        {
            printf("Basic salary cannot be negative. Please enter again: ");
            scanf("%f",&stipend);
        }

        if(stipend > 50000){
            stipend = stipend + 5000;
        }


        a[i] = stipend;
    }

    for(i=0;i<num;i++){
        printf("The total salary of employee %d is: %.2f\n", i+1, a[i]);
    }

    float total = 0;
    for(i=0;i<num;i++){
        total = total + a[i];
    }
    printf("The total salary of all permanent employees is: %.2f\n", total);
        float max_salary=0;

    for(i=0;i<num;i++){
        if(a[i] > max_salary){
            max_salary = a[i];
        }
    }
    printf("The highest salary among all permanent employees is: %.2f\n", max_salary);
    float min_salary=a[i];
    for(i=0;i<num;i++){
        if(a[i] < min_salary || min_salary == 0){
            min_salary = a[i];
        }
    }
    printf("The lowest salary among all permanent employees is: %.2f\n", min_salary);
    
}

int main (){
    int choice;
    printf("Select the type of employee:\n1. Permanent\n2. Contract\n3. Intern\n");
    scanf("%d",&choice);

    switch(choice){
        case 1:
            permenant();
            break;
        case 2:
            contract();
            break;
        case 3:
            intern();
            break;
        default:
            printf("Invalid choice\n");
    }
    return 0;
}



// if permanent - %10 tax pay 
// con - 5% tax pay intern no tax if salary > 50000 bonus = 5000


