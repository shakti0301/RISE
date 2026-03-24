// HOISTING - JavaScript's behavior of moving declarations to the top
// Hoisting allows you to use variables and functions before they are declared

// FUNCTION HOISTING

// Function declarations are FULLY hoisted (definition + name)
// You can call a function BEFORE it's declared in the code
sayHello(); // This works! Output: "Hello from function hoisting"

function sayHello() {
  console.log('Hello from function hoisting');
}

// Why it works: JavaScript internally moves the entire function to the top:
// function sayHello() { ... } <- moved here
// sayHello();

// VARIABLE HOISTING - VAR, LET, CONST (Different behavior!)

// 1. VAR - Hoisted and initialized with 'undefined'
console.log(x); // Output: undefined (NOT error!)
var x = 5;
console.log(x); // Output: 5

// Why: JavaScript moves 'var x' to top but initialization (= 5) stays below
// It's like:
// var x;           <- hoisted (initialized as undefined)
// console.log(x);  <- prints undefined
// x = 5;           <- initialization happens here

// ============================================================

// 2. LET - Hoisted but NOT initialized (Temporal Dead Zone)
// Accessing let before declaration causes ReferenceError
try {
  console.log(y); // ReferenceError: Cannot access 'y' before initialization
} catch (error) {
  console.log('Error:', error.message);
}

let y = 10;
console.log(y); // Output: 10

// Why: let is in "Temporal Dead Zone" from start until declaration
// Hoisted declaration:        |---|  (Temporal Dead Zone)
//                             let y = 10;
// Can only use AFTER this line

// ============================================================

// 3. CONST - Same as LET (Hoisted but not initialized)
try {
  console.log(z); // ReferenceError: Cannot access 'z' before initialization
} catch (error) {
  console.log('Error:', error.message);
}

const z = 15;
console.log(z); // Output: 15

// FUNCTION EXPRESSIONS - NOT fully hoisted

// Function expression stored in a variable
// Only the VARIABLE is hoisted, not the function definition

try {
  myFunc(); // TypeError: myFunc is not a function
} catch (error) {
  console.log('Error:', error.message);
}

var myFunc = function () {
  console.log('This is a function expression');
};

// Why: var myFunc is hoisted but = function() is not
// myFunc is undefined initially, so calling it throws TypeError

// ============================================================

// Arrow functions have same hoisting behavior as function expressions
try {
  arrowFunc(); // TypeError: arrowFunc is not a function
} catch (error) {
  console.log('Error:', error.message);
}

const arrowFunc = () => {
  console.log('Arrow function');
};

// PRACTICAL EXAMPLE - Hoisting in Real Scenarios

console.log('\n--- Practical Example ---');

// This works because of hoisting
processOrder(100);

function processOrder(amount) {
  let tax = calculateTax(amount);
  console.log(`Total: ${amount + tax}`);
}

function calculateTax(amount) {
  return amount * 0.18;
}

// BEST PRACTICES - Avoid Hoisting Confusion

// ✅ GOOD - Declare all functions AND variables at the top
function add(a, b) {
  return a + b;
}

const result = add(5, 3);
console.log(result);

// ❌ BAD - Relying on hoisting can make code confusing
// console.log(confusingVar);  // undefined due to hoisting
// var confusingVar = 'This is confusing!';

// ✅ PREFER - Use const/let instead of var (more predictable)
// Declare before using - avoids Temporal Dead Zone issues
const myVariable = 'Clear and predictable';
console.log(myVariable);

// SUMMARY TABLE
/*
┌─────────────┬──────────┬──────────────┬─────────────────────┐
│ Type        │ Hoisted? │ Initialized? │ Temporal Dead Zone   │
├─────────────┼──────────┼──────────────┼─────────────────────┤
│ var         │ Yes      │ undefined    │ No                  │
│ let         │ Yes      │ Not init.    │ Yes                 │
│ const       │ Yes      │ Not init.    │ Yes                 │
│ function    │ Yes      │ Complete fn  │ No                  │
│ function-   │ Yes*     │ Not init.    │ Yes*                │
│ expression  │          │              │ *for var/let/const  │
└─────────────┴──────────┴──────────────┴─────────────────────┘
*/
