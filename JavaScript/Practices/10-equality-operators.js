// Equality Operators: == (loose/loose) vs === (strict)
let money = '100'; // String

// Loose equality (==) - only checks value, ignores data type
// '100' == 100 is true because values are equal
if (money == 100) {
  console.log('Message printed successfully (loose equality)');
}

// Strict equality (===) - checks both value AND data type
// '100' === 100 is false because types are different (string vs number)
if (money === 100) {
  console.log('This message is for strict equality check');
} else {
  console.log(
    'Types are different - string "100" is not strictly equal to number 100',
  );
}

// Best practice: Always use === (strict equality) to avoid unexpected type coercion
