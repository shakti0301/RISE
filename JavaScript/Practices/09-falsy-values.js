// Falsy Values - Values that evaluate to false in boolean context
// In JavaScript, these are: 0, null, NaN, undefined, '', false

console.log(Boolean(0)); // Output: false
console.log(Boolean(NaN)); // Output: false
console.log(Boolean(null)); // Output: false
console.log(Boolean('')); // Output: false (empty string)
console.log(Boolean(undefined)); // Output: false

// Practical example: falsy values in conditions
let money; // undefined variable

if (money > 500) {
  console.log('Dont Spend it all');
} else {
  // This executes because undefined is falsy and undefined > 500 is false
  console.log('Save More');
}
