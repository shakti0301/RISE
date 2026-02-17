#include <stdio.h>

/* Grocery Billing */
float calculate_grocery_bill() {
    printf("\n--- Grocery Billing ---\n");

    float price, quantity;
    float total = 0;
    float highest = 0;
    float tax_rate = 0.05;
    float tax_collected;
    int item_count = 0;

    int n;
    printf("How many items? : ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        printf("Enter price of item %d: ", i + 1);
        scanf("%f", &price);

        if (price < 0) {
            printf("Invalid price! Try again.\n");
            i--;
            continue;
        }

        printf("Enter quantity of item %d: ", i + 1);
        scanf("%f", &quantity);

        if (quantity <= 0) {
            printf("Invalid quantity! Try again.\n");
            i--;
            continue;
        }

        float item_total = price * quantity;
        total += item_total;
        item_count++;

        if (item_total > highest) {
            highest = item_total;
        }
    }

    /* Discount */
    if (total >= 5000)
        total -= total * 0.20;
    else if (total >= 3000)
        total -= total * 0.10;

    tax_collected = total * tax_rate;
    float final_amount = total + tax_collected;

    /* Summary */
    printf("\n--- Grocery Summary ---\n");
    printf("Total Bill Amount  : %.2f\n", final_amount);
    printf("Highest Price Item : %.2f\n", highest);
    printf("Total Tax Collected: %.2f\n", tax_collected);
    printf("Item Count         : %d\n", item_count);

    return final_amount;
}

/* Electronics Billing */
float calculate_electronics_bill() {
    printf("\n--- Electronics Billing ---\n");

    float price, quantity;
    float total = 0;
    float highest = 0;
    float tax_rate = 0.18;
    float tax_collected;
    int item_count = 0;

    int n;
    printf("How many items? : ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        printf("Enter price of item %d: ", i + 1);
        scanf("%f", &price);

        if (price < 0) {
            printf("Invalid price! Try again.\n");
            i--;
            continue;
        }

        printf("Enter quantity of item %d: ", i + 1);
        scanf("%f", &quantity);

        if (quantity <= 0) {
            printf("Invalid quantity! Try again.\n");
            i--;
            continue;
        }

        float item_total = price * quantity;
        total += item_total;
        item_count++;

        if (item_total > highest) {
            highest = item_total;
        }
    }

    if (total >= 5000)
        total -= total * 0.20;
    else if (total >= 3000)
        total -= total * 0.10;

    tax_collected = total * tax_rate;
    float final_amount = total + tax_collected;

    printf("\n--- Electronics Summary ---\n");
    printf("Total Bill Amount  : %.2f\n", final_amount);
    printf("Highest Price Item : %.2f\n", highest);
    printf("Total Tax Collected: %.2f\n", tax_collected);
    printf("Item Count         : %d\n", item_count);

    return final_amount;
}

/* Clothing Billing */
float calculate_clothing_bill() {
    printf("\n--- Clothing Billing ---\n");

    float price, quantity;
    float total = 0;
    float highest = 0;
    float tax_rate = 0.12;
    float tax_collected;
    int item_count = 0;

    int n;
    printf("How many items? : ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        printf("Enter price of item %d: ", i + 1);
        scanf("%f", &price);

        if (price < 0) {
            printf("Invalid price! Try again.\n");
            i--;
            continue;
        }

        printf("Enter quantity of item %d: ", i + 1);
        scanf("%f", &quantity);

        if (quantity <= 0) {
            printf("Invalid quantity! Try again.\n");
            i--;
            continue;
        }

        float item_total = price * quantity;
        total += item_total;
        item_count++;

        if (item_total > highest) {
            highest = item_total;
        }
    }

    if (total >= 5000)
        total -= total * 0.20;
    else if (total >= 3000)
        total -= total * 0.10;

    tax_collected = total * tax_rate;
    float final_amount = total + tax_collected;

    printf("\n--- Clothing Summary ---\n");
    printf("Total Bill Amount  : %.2f\n", final_amount);
    printf("Highest Price Item : %.2f\n", highest);
    printf("Total Tax Collected: %.2f\n", tax_collected);
    printf("Item Count         : %d\n", item_count);

    return final_amount;
}

/* Main Function */
int main() {
    printf("=== Smart Retail Billing System ===\n");

    int prod_type;
    printf("1. Grocery\n2. Electronics\n3. Clothing\n");
    printf("Select Product Type (1-3): ");
    scanf("%d", &prod_type);

    float final_amount = 0;

    switch (prod_type) {
        case 1:
            final_amount = calculate_grocery_bill();
            break;
        case 2:
            final_amount = calculate_electronics_bill();
            break;
        case 3:
            final_amount = calculate_clothing_bill();
            break;
        default:
            printf("Invalid Product Type Selected\n");
            return 0;
    }

    printf("\nFinal Payable Amount: %.2f\n", final_amount);
    return 0;
}
