// ============================================================
// VARIABLES - Storing and using data
// ============================================================

// Variables are containers that hold data values
// Declaring with LET - modern way (recommended)
let firstname1 = 'suresh';
let lastname1 = 'sharma';

// const - variable CANNOT be changed (prevent accidents)
const country = 'India';

// ============================================================
// CONCATENATION - Joining strings
// ============================================================

// Method 1: Using + operator
console.log(firstname1 + ' ' + lastname1); // Using + to join strings

// Method 2: Using comma in console.log
console.log(firstname1, lastname1); // Prints with space between

// Method 3: Template literal (BEST)
console.log(`Hello ${firstname1} ${lastname1}`);

// ============================================================
// NAMING CONVENTION (Best Practices)
// ============================================================

// ✅ Good: camelCase - descriptive names
let studentName = 'John';
let userAge = 25;
let isActive = true;

// ❌ Bad: unclear abbreviations
let sn = 'John'; // What is sn?
let ua = 25; // Unclear

// Rules:
// 1. Cannot start with numbers
// 2. Can contain letters, numbers, _, $
// 3. Case-sensitive: name !== Name
// 4. Use camelCase for multiple words
