// FUNCTIONS - Reusable blocks of code

// A function is a reusable block of code that performs a specific task
// Benefits: Avoid code repetition, organize code, easier to maintain

// FUNCTION DECLARATION

// Basic function without parameters
function greetings() {
  console.log('Good Morning');
}

// To execute the function, you CALL it:
greetings(); // Output: Good Morning

// You can call the same function multiple times
greetings(); // Called again
greetings(); // Called again

// FUNCTIONS WITH PARAMETERS

// Parameters are inputs to the function
// They go in the parentheses ()
function greetings2(firstName, lastName) {
  // Inside the function, use parameters like variables
  console.log('Hello ' + firstName + ' ' + lastName);
}

// When calling, provide VALUES (arguments) for parameters
greetings2('Shakti', 'Raolji'); // Output: Hello Shakti Raolji
greetings2('Kushal', 'Patel'); // Output: Hello Kushal Patel
greetings2('John', 'Doe'); // Output: Hello John Doe

// DEFAULT PARAMETERS - Fallback values

// Default parameter is used if no argument is provided
function greetings3(firstName = 'Guest', lastName = 'User') {
  console.log('Hello ' + firstName + ' ' + lastName);
}

greetings3('Shakti', 'Raolji'); // Uses provided values
greetings3('Mahesh'); // lastName uses default 'User'
greetings3(); // Both use defaults

// RETURN STATEMENT - Get a value back from function

// A function can RETURN a value that you can use later
function add(a, b) {
  return a + b; // Returns the sum, function stops here
}

// Capture the returned value
let sum = add(5, 3); // sum = 8
console.log(sum); // Output: 8
console.log(add(10, 20)); // Direct use: Output: 30

// Function without return
function printMessage() {
  console.log('This just prints, returns nothing');
  // Implicitly returns undefined
}

let result = printMessage(); // result = undefined

// FUNCTION EXPRESSIONS - Storing function in variable

// Instead of function keyword, store in a const/let
const greet = function () {
  console.log('Hello World');
};

// Call using the variable name
greet(); // Output: Hello World

// You can pass functions to other functions
function executeFunction(fn) {
  fn(); // Call the function parameter
}

executeFunction(greet); // Output: Hello World

// DIFFERENCE: Function vs Function Expression

// Function declaration - hoisted (can call before defining)
sayHi(); // Works! Hoisting

function sayHi() {
  console.log('Hi there!');
}

// Function expression - not hoisted (must define before calling)
// callMeLater();  // Error if uncommented - not yet defined

const callMeLater = function () {
  console.log('Now I can be called');
};

callMeLater(); // Now it works

// PRACTICAL EXAMPLES - Real-world function usage

// Example 1: Calculate discount price
function calculateDiscountedPrice(originalPrice, discountPercent) {
  const discount = (originalPrice * discountPercent) / 100;
  const finalPrice = originalPrice - discount;
  return finalPrice;
}

const price = calculateDiscountedPrice(1000, 20); // 20% off
console.log('Price after 20% discount: ' + price); // Output: 800

// Example 2: Validate age
function isEligibleToVote(age) {
  if (age >= 18) {
    return true;
  } else {
    return false;
  }
  // OR shorter: return age >= 18;
}

console.log(isEligibleToVote(20)); // Output: true
console.log(isEligibleToVote(15)); // Output: false

// KEY CONCEPTS SUMMARY

/*
1. FUNCTION - Named block of reusable code
2. PARAMETER - Input variable defined in function
3. ARGUMENT - Actual value passed when calling function
4. RETURN - Value sent back to caller
5. SCOPE - Where variables are accessible (inside/outside function)

Example:
function multiply(a, b) {      // a, b are PARAMETERS
  return a * b;
}

const result = multiply(5, 3);  // 5, 3 are ARGUMENTS
                                 // result stores RETURNED value
*/
