// Type Conversion - explicitly converting one data type to another
const year = '2010'; // String

// Convert string to number
console.log(Number(year)); // Output: 2010 (number)

// Convert to string
console.log(String(year)); // Output: "2010" (string)

// Invalid conversion - string to number when string is not a numeric value
const year2 = 'TwentyTen';
console.log(Number(year2)); // Output: NaN (Not a Number)
console.log(typeof NaN); // Output: "number" (data type of NaN is number)
