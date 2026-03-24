// Functions - reusable blocks of code

// Basic function without parameters
function greetings() {
  console.log('Good Morning');
}
greetings(); // Call the function

// Function with parameters and default values
function greetings2(firstName = 'there', lastName) {
  // 'there' is a default parameter if firstName is not provided
  console.log('Hello ' + firstName + ' ' + lastName);
}
greetings2('shakti', 'raolji'); // Pass arguments to function

// Function with return statement - returns a value
function add(a, b) {
  return a + b; // Function exits here and returns the result
}

let sum = add(2, 2); // Call function and store returned value
console.log(sum); // Output: 4

// Function expressions - storing function in a variable
const greet = function () {
  console.log('Hello World');
};

// Calling function expression
greet();

// Difference between printing function vs calling it
console.log(greet); // Prints the function definition
greet(); // Executes the function
