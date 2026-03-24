// Ternary Operator - shorthand for if-else statements
// Syntax: condition ? valueIfTrue : valueIfFalse

const score = 70;

// Using ternary operator
const result = score > 70 ? 'Great Job' : 'Need Improvement';
console.log(result); // Output: "Need Improvement" (because 70 is not > 70)

// This is equivalent to using if-else statement
let result1;
if (score > 70) {
  result1 = 'Great Job';
} else {
  result1 = 'Need Improvement';
}
console.log(result1); // Same output as ternary operator

// Ternary is more concise for simple conditions
