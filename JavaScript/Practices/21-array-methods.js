// Array Methods - map(), filter(), reduce()
// These are transformation methods that work on each element

const arr = [1, 2, 3, 4];

// MAP - transform each element using a function, returns new array
// Used when: you want to modify/transform each element
const mappedValue = arr.map((num) => num + 5);
console.log(mappedValue); // Output: [6, 7, 8, 9]

// Map example with strings
const names = ['alice', 'bob', 'charlie'];
const upperNames = names.map((name) => name.toUpperCase());
console.log(upperNames); // Output: ['ALICE', 'BOB', 'CHARLIE']

// FILTER - keep only elements where condition is true, returns new array
// Used when: you want to select certain elements based on condition
const filterValue = arr.filter((num) => num > 2);
console.log(filterValue); // Output: [3, 4]

// Filter example - get even numbers
const even = arr.filter((num) => num % 2 === 0);
console.log(even); // Output: [2, 4]

// REDUCE - combine all elements into single value
// Used when: you want to calculate sum, product, or aggregate value
// Syntax: reduce((accumulator, currentValue, index, array) => {}, initialValue)
const result = arr.reduce((accumulator, num) => accumulator + num, 0);
console.log(result); // Output: 10 (1+2+3+4)

// Reduce example - product of all numbers
const product = arr.reduce((acc, num) => acc * num, 1);
console.log(product); // Output: 24 (1*2*3*4)

// How reduce works step-by-step for sum:
// 0 + 1 = 1
// 1 + 2 = 3
// 3 + 3 = 6
// 6 + 4 = 10

// Chaining methods together
const result2 = arr
  .filter((num) => num > 2) // [3, 4]
  .map((num) => num * 2) // [6, 8]
  .reduce((sum, num) => sum + num, 0); // 14
console.log(result2); // Output: 14
