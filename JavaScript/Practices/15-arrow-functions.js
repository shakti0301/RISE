// Arrow Functions - modern syntax for writing functions
// Syntax: const name = (parameters) => { body }

// Arrow function with curly braces (must use return keyword)
const add = (a, b) => {
  return a + b;
};
console.log(add(5, 3)); // Output: 8

// Arrow function without curly braces (implicit return)
const multiply = (a, b) => a * b;
console.log(multiply(5, 3)); // Output: 15

// Arrow function for side effects (like logging)
const greet = (name) => {
  console.log('Hello ' + name);
  console.log('Welcome!');
};
greet('Shakti');

// Arrow function with single parameter (parentheses optional)
const square = (x) => x * x;
console.log(square(5)); // Output: 25

// Important: 'this' keyword behavior in arrow functions
// Arrow functions do NOT have their own 'this' - they inherit from surrounding context
const person = {
  name: 'Suresh',
  age: 20,
  greet: () => {
    // 'this' refers to global object, not person object
    console.log(this.name); // May not work as expected
  },
};
// person.greet();

// Use regular function when you need 'this' to refer to the object:
const person2 = {
  name: 'Mahesh',
  age: 25,
  greet: function () {
    console.log(this.name); // 'this' refers to person2
  },
};
person2.greet(); // Output: "Mahesh"
