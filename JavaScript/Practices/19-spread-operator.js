// Spread Operator (...) - unpacks elements from arrays or objects

// Spreading objects - combines multiple objects
const person1 = {
  firstName: 'Shakti',
  lastName: 'Raolji',
  age: 20,
  hobbies: ['cricket', 'basketball'],
};

const person2 = {
  a: 10,
  b: 20,
};

// Merging two objects using spread operator
const person3 = { ...person1, ...person2 };
console.log(person3); // Contains all properties from both objects

// Important: Spread creates a shallow copy (doesn't change original)
const person4 = { ...person1 }; // Creates copy of person1
person4.age = 30;
console.log(person1.age); // Still 20 (original unchanged)
console.log(person4.age); // 30 (copied object modified)

// Without spread operator (points to same object)
let a = 20;
a = 30;
console.log(a); // 30

// Arrays with spread operator
const arr = [1, 2, 3];
const arr2 = [...arr, 4, 5]; // Combines array with new elements
console.log(arr2); // Output: [1, 2, 3, 4, 5]

// Spreading in function calls
const numbers = [1, 2, 3];
Math.max(...numbers); // Same as Math.max(1, 2, 3)
console.log(Math.max(...numbers)); // Output: 3
