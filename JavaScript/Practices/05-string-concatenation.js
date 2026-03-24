// Using const for constants (cannot be changed)
const firstName = 'Suresh';
const year = 2010;
const birthYear = 1990;
const job = 'professional';

// String concatenation with + operator (requires + signs between each part)
console.log(
  'I am ' + firstName + ' ' + (year - birthYear) + ' years - old ' + job,
);

// Template Literals using backticks - cleaner syntax for interpolation
// Variables are placed inside ${} for string interpolation
console.log(`I am ${firstName} ${year - birthYear} year old ${job}`);
