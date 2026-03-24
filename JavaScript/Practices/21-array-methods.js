// ARRAY METHODS - map(), filter(), reduce()

// These are powerful transformation methods that work with every element
// They DON'T modify the original array (non-destructive)

const arr = [1, 2, 3, 4, 5];

// MAP - TRANSFORM each element using a function

// Used when: you want to modify/transform each element
// Returns: NEW array with transformed elements
// Syntax: array.map((element) => expression)

console.log('\n--- MAP EXAMPLES ---');

// Example 1: Add 5 to each number
const mappedValue = arr.map((num) => num + 5);
console.log('Original:', arr); // [1, 2, 3, 4, 5]
console.log('After +5:', mappedValue); // [6, 7, 8, 9, 10]

// Example 2: Double each number
const doubled = arr.map((num) => num * 2);
console.log('Doubled:', doubled); // [2, 4, 6, 8, 10]

// Example 3: Convert strings to uppercase
const names = ['alice', 'bob', 'charlie'];
const upperNames = names.map((name) => name.toUpperCase());
console.log('Names uppercase:', upperNames);
// Output: ['ALICE', 'BOB', 'CHARLIE']

// Example 4: Extract specific property from objects
const users = [
  { name: 'Alice', age: 25 },
  { name: 'Bob', age: 30 },
  { name: 'Charlie', age: 35 },
];

const userNames = users.map((user) => user.name);
console.log('User names:', userNames); // ['Alice', 'Bob', 'Charlie']

// FILTER - KEEP only elements where condition is true

// Used when: you want to select certain elements based on condition
// Returns: NEW array containing only matching elements
// Syntax: array.filter((element) => condition)

console.log('\n--- FILTER EXAMPLES ---');

// Example 1: Numbers greater than 2
const filterValue = arr.filter((num) => num > 2);
console.log('Numbers > 2:', filterValue); // [3, 4, 5]

// Example 2: Even numbers
const even = arr.filter((num) => num % 2 === 0);
console.log('Even numbers:', even); // [2, 4]

// Example 3: Odd numbers
const odd = arr.filter((num) => num % 2 !== 0);
console.log('Odd numbers:', odd); // [1, 3, 5]

// Example 4: Filter objects by property
const adults = users.filter((user) => user.age >= 30);
console.log('Adults (age >= 30):', adults);
// Output: [{ name: 'Bob', age: 30 }, { name: 'Charlie', age: 35 }]

// REDUCE - COMBINE all elements into SINGLE value

// Used when: you want to calculate sum, product, or aggregate value
// Returns: Single value (any type)
// Syntax: array.reduce((accumulator, element) => expression, initialValue)

console.log('\n--- REDUCE EXAMPLES ---');

// Example 1: Sum of all numbers
const result = arr.reduce((accumulator, num) => accumulator + num, 0);
console.log('Sum:', result); // 15 (1+2+3+4+5)

// How reduce works step-by-step:
// Start: accumulator = 0
// Step 1: 0 + 1 = 1
// Step 2: 1 + 2 = 3
// Step 3: 3 + 3 = 6
// Step 4: 6 + 4 = 10
// Step 5: 10 + 5 = 15

// Example 2: Product of all numbers
const product = arr.reduce((acc, num) => acc * num, 1);
console.log('Product:', product); // 120 (1*2*3*4*5)

// Example 3: Maximum number
const max = arr.reduce((max, num) => (num > max ? num : max));
console.log('Maximum:', max); // 5

// Example 4: Count occurrences
const items = ['apple', 'banana', 'apple', 'orange', 'banana', 'apple'];
const count = items.reduce((acc, item) => {
  acc[item] = (acc[item] || 0) + 1;
  return acc;
}, {});
console.log('Item count:', count);
// Output: { apple: 3, banana: 2, orange: 1 }

// CHAINING - Combine multiple methods together

console.log('\n--- CHAINING EXAMPLES ---');

// Filter then Map: Get uppercase names of older users
const olderUserNames = users
  .filter((user) => user.age > 25)
  .map((user) => user.name.toUpperCase());
console.log('Older users (uppercase):', olderUserNames);
// Output: ['BOB', 'CHARLIE']

// Filter then Reduce: Sum of even numbers
const sumOfEvens = arr
  .filter((num) => num % 2 === 0) // [2, 4]
  .reduce((sum, num) => sum + num, 0); // 6
console.log('Sum of even numbers:', sumOfEvens); // 6

// Complex chain: Filter -> Map -> Reduce
const result2 = arr
  .filter((num) => num > 2) // [3, 4, 5]
  .map((num) => num * 2) // [6, 8, 10]
  .reduce((sum, num) => sum + num, 0); // 24
console.log('Complex chain result:', result2); // 24

// KEY DIFFERENCES TABLE

/*
┌─────────┬──────────────────────┬──────────────┬──────────────┐
│ Method  │ Purpose              │ Returns      │ Original     │
├─────────┼──────────────────────┼──────────────┼──────────────┤
│ map()   │ Transform elements   │ New array    │ Unchanged    │
│ filter()│ Select elements      │ New array    │ Unchanged    │
│ reduce()│ Combine to one value │ Single value │ Unchanged    │
└─────────┴──────────────────────┴──────────────┴──────────────┘

All three do NOT modify the original array!
*/
