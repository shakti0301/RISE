// Type Coercion - Javascript automatically converts data types during operations
// When + is used with string and number, both convert to string
console.log('I am ' + 23 + ' Years Old!'); // Output: "I am 23 Years Old!"

// With other operators like -, *, strings convert to numbers
console.log('23' - '10' - 3); // Output: 10 (both strings converted to numbers, then calculated)
console.log('23' - 10 - 'Year'); // Output: NaN (last 'Year' cannot be converted to number)

// Key rule: + operator is special - it converts both to strings
let n = '1' + 1; // Output: '11' (both converted to strings and concatenated)
console.log(n);

// Type coercion rules:
// String + Number = String, Number + Number = Number
// String - Number = Number, String * Number = Number
