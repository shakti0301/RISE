// DESTRUCTURING - Extract values from arrays/objects

// Destructuring makes code cleaner by unpacking values

// ARRAY DESTRUCTURING

const arr = [1, 2, 3, 4, 5];

// Extract specific positions
const [first, second] = arr;
console.log('First:', first); // Output: 1
console.log('Second:', second); // Output: 2

// Extract first and remaining with rest operator (...)
const [head, ...tail] = arr;
console.log('Head:', head); // Output: 1
console.log('Tail:', tail); // Output: [2, 3, 4, 5]

// Skip elements by leaving gaps
const [first2, , third] = arr; // Skip second element
console.log('Skipped first2:', first2); // Output: 1
console.log('Skipped third:', third); // Output: 3

// OBJECT DESTRUCTURING

const person = {
  name: 'Shakti',
  age: 20,
  city: 'New York',
  job: 'Developer',
};

// Extract specific properties by name
const { name, age } = person;
console.log('Name:', name); // Output: 'Shakti'
console.log('Age:', age); // Output: 20

// Rename properties during extraction
const { name: personName, age: personAge } = person;
console.log('Person name:', personName); // Output: 'Shakti'

// Extract with rest operator
const { name: n, ...otherData } = person;
console.log('Name:', n); // Output: 'Shakti'
console.log('Other:', otherData); // { age, city, job }

// PRACTICAL EXAMPLES

// Example 1: Function parameters
function greet({ name, age }) {
  console.log(`${name} is ${age} years old`);
}
greet(person); // Shakti is 20 years old

// Example 2: Swapping values
let p = 5,
  q = 10;
[p, q] = [q, p];
console.log('Swapped - p:', p, 'q:', q); // 10, 5

// KEY BENEFITS

/*
Why use destructuring?
✓ Less repetitive code
✓ More readable
✓ Fewer mistakes
✓ Clear variable names
*/
