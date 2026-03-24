// Functions calling other functions - composing complex behavior

// Helper function - calculates tax based on amount
function calculateTax(amount) {
  return amount * 0.18; // 18% tax
}

// Main function that uses the helper function
function calculateTotal(amount) {
  let tax = calculateTax(amount); // Call another function to get tax
  let total = amount + tax; // Add tax to amount
  return total;
}

// Call the main function
let finalAmount = calculateTotal(100);
console.log(finalAmount); // Output: 118 (100 + 18% tax)

// Benefits:
// 1. Code reusability - calculateTax can be used elsewhere
// 2. Cleaner logic - each function has single responsibility
// 3. Easier to test and maintain
