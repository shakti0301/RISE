// ARRAYS - Collection of elements in a single variable

// Arrays store multiple values in order
// Each element has an INDEX (position)
// Indexing starts at 0 (zero-based)

const persons = ['Suresh', 'Mahesh', 'Jayesh', 'Ramesh', 20];

// Visual representation:
// Index:  0        1         2        3        4
// Value: 'Suresh' 'Mahesh' 'Jayesh' 'Ramesh'  20

// ACCESSING ARRAY ELEMENTS

console.log('--- ACCESSING ELEMENTS ---');

// Access by index
console.log(persons[0]); // 'Suresh' (first element)
console.log(persons[1]); // 'Mahesh' (second element)
console.log(persons[4]); // 20 (fifth element)

// Out of bounds - returns undefined
console.log(persons[10]); // undefined (doesn't exist)

// Negative index - doesn't work in JavaScript
// console.log(persons[-1]);  // undefined (not like Python)

// Last element (useful trick)
console.log(persons[persons.length - 1]); // 20 (last element)

// ARRAY LENGTH PROPERTY

console.log('--- LENGTH PROPERTY ---');

console.log('Length:', persons.length); // 5 (array has 5 elements)

// Update length (dangerous - removes elements)
persons.length = 3; // Now only: ['Suresh', 'Mahesh', 'Jayesh']
console.log('After length = 3:', persons);

// Reset for next examples
const arr = ['Suresh', 'Mahesh', 'Jayesh', 'Ramesh', 20];

// ADDING ELEMENTS - PUSH, UNSHIFT

console.log('--- ADDING ELEMENTS ---');

const fruits = ['apple', 'banana'];
console.log('Original:', fruits); // ['apple', 'banana']

// push() - add to END of array
fruits.push('orange'); // Adds 'orange'
fruits.push('mango', 'grape'); // Add multiple
console.log('After push:', fruits); // [..., 'orange', 'mango', 'grape']

// unshift() - add to START of array
fruits.unshift('strawberry'); // Adds to beginning
console.log('After unshift:', fruits); // ['strawberry', ...]

// REMOVING ELEMENTS - POP, SHIFT, SPLICE

console.log('--- REMOVING ELEMENTS ---');

const numbers = [10, 20, 30, 40, 50];
console.log('Original:', numbers);

// pop() - remove from END
numbers.pop(); // Removes 50
console.log('After pop:', numbers); // [10, 20, 30, 40]

// shift() - remove from START
numbers.shift(); // Removes 10
console.log('After shift:', numbers); // [20, 30, 40]

// splice() - remove/insert at specific position
// Syntax: splice(startIndex, deleteCount, ...itemsToInsert)
const items = [1, 2, 3, 4, 5];
items.splice(2, 2); // Start at index 2, delete 2 elements
console.log('After splice(2, 2):', items); // [1, 2, 5]

// Insert while removing
const arr2 = [1, 2, 3, 4, 5];
arr2.splice(2, 1, 'inserted'); // At index 2: delete 1, insert 'inserted'
console.log('After splice(2, 1, "inserted"):', arr2);

// ARRAY SUMMARY TABLE

/*
┌──────────┬─────────────┬────────────────────┐
│ Method   │ Action      │ Effects Original   │
├──────────┼─────────────┼────────────────────┤
│ push()   │ Add end     │ Yes                │
│ pop()    │ Remove end  │ Yes                │
│ shift()  │ Remove start│ Yes                │
│ unshift()│ Add start   │ Yes                │
│ splice() │ Add/Remove  │ Yes                │
│ map()    │ Transform   │ No (new array)     │
│ filter() │ Select      │ No (new array)     │
└──────────┴─────────────┴────────────────────┘
*/
