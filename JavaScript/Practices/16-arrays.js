// Arrays - collection of elements stored in a single variable

const persons = ['Suresh', 'Mahesh', 'Jayesh', 'Ramesh', 20];

// Accessing array elements by index (0-based indexing)
console.log(persons[0]); // Output: 'Suresh' (first element)
console.log(persons[4]); // Output: 20 (fifth element)
console.log(persons[5]); // Output: undefined (doesn't exist)

// Length property - get total number of elements
console.log(persons.length); // Output: 5

// Adding elements
persons.push('40'); // Add to the end of array
console.log(persons);

// Inserting elements at specific position
// splice(index, deleteCount, ...itemsToInsert)
persons.splice(0, 0, 'Naresh'); // Insert 'Naresh' at index 0, delete 0 elements
console.log(persons);

// Common array methods:
// push() - add to end
// pop() - remove from end
// shift() - remove from start
// unshift() - add to start
// splice() - add/remove at specific position
