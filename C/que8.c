#include <stdio.h>

int main() {
    printf ("Online Exam Result of Multiple Students Using Array and pointers\n");
    int n, i, j;
    printf("Enter number of students: ");
    scanf("%d", &n);
    int marks[n][5]; 

    for(i = 0; i < n; i++) {
        printf("Enter marks of student %d:\n", i + 1);
        for(j = 0; j < 5; j++) {
            printf("Subject %d: ", j + 1);
            scanf("%d", &marks[i][j]);
            if(marks[i][j] < 0 || marks[i][j] > 100) {
                printf("Invalid marks entered. Please enter marks between 0 and 100.\n");
                j--; 
            }
        }
    }

    for(i = 0; i < n; i++) {
        int *ptr = marks[i];
        float avg = 0;
        int pass = 1;

        for(j = 0; j < 5; j++) {
            printf("Student %d - Subject %d Marks: %d\n", i + 1, j + 1, *(ptr + j));
            if(*(ptr + j) < 40) {
                pass = 0; 
            }
            avg = avg + *(ptr + j);
        }
        avg = avg / 5;

        printf("\nResults for Student %d:\n", i + 1);
        printf("Average Marks: %.2f\n", avg);
        if(pass && avg >= 50) {
            printf("Result: Pass\n");
        } else {
            printf("Result: Fail\n");
        }
    }

}