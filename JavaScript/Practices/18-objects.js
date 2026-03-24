// Objects - collection of key-value pairs (properties)

// Creating objects
const person1 = {
  firstName: 'Shakti',
  lastName: 'Raolji',
  age: 20,
  hobbies: ['cricket', 'basketball'], // Array inside object
};

const person2 = {
  firstName: 'Kushal',
  lastName: 'Raolji',
  age: 20,
  hobbies: ['cricket', 'basketball'],
};

// Accessing object properties
console.log(person1.firstName); // Output: 'Shakti'
console.log(person1['age']); // Output: 20 (bracket notation)

// Modifying properties
person1.age = 25;
console.log(person1.age); // Output: 25

// Adding new properties
person1.city = 'New York';

// Deleting properties
delete person1.city;

// Nested objects and arrays
const company = {
  name: 'Tech Corp',
  employees: [
    { name: 'Alice', role: 'Developer' },
    { name: 'Bob', role: 'Designer' },
  ],
};
console.log(company.employees[0].name); // Output: 'Alice'
