// Rest Parameter & Destructuring - extract values from arrays/objects

// Array Destructuring - extract specific elements from array
const arr = [1, 2, 3, 4, 5];

// Extract first element and remaining in 'rest' array
const [first, ...rest] = arr;
console.log(first); // Output: 1
console.log(rest); // Output: [2, 3, 4, 5]

// Extract specific elements
const [a, b, ...others] = arr;
console.log(a); // Output: 1
console.log(b); // Output: 2
console.log(others); // Output: [3, 4, 5]

// Skip elements during destructuring
const [first2, , third] = arr; // Skip second element
console.log(first2); // Output: 1
console.log(third); // Output: 3

// Object Destructuring - extract properties from object
const person = {
  name: 'Shakti',
  age: 20,
  city: 'New York',
  job: 'Developer',
};

// Extract specific properties
const { name, age } = person;
console.log(name); // Output: 'Shakti'
console.log(age); // Output: 20

// Rename during destructuring
const { name: personName, age: personAge } = person;
console.log(personName); // Output: 'Shakti'

// Extract with rest
const { name: n, ...remainingData } = person;
console.log(n); // Output: 'Shakti'
console.log(remainingData); // { age: 20, city: 'New York', job: 'Developer' }

// Important: When calculating with destructured values
const arr2 = [1, 2, 3, 4, 5];
const [first3, ...rest2] = arr2;
console.log(first3 + 1); // Output: 2 (1 + 1, not 2 from array)
