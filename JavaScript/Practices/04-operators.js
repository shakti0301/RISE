// ============================================================
// OPERATORS - Performing operations on values
// ============================================================

// ============================================================
// ARITHMETIC OPERATORS
// ============================================================

console.log('--- ARITHMETIC OPERATORS ---');

let a = 20;
let b = 5;

// Addition
console.log('Addition:', a + b); // 25

// Subtraction
console.log('Subtraction:', a - b); // 15

// Multiplication
console.log('Multiplication:', a * b); // 100

// Division
console.log('Division:', a / b); // 4

// Modulus (remainder)
console.log('Modulus:', a % b); // 0 (no remainder)
console.log('Modulus:', 23 % 5); // 3 (remainder when 23 ÷ 5)

// Exponentiation (power)
console.log('Power:', a ** 2); // 400 (20 squared)
console.log('Power:', 2 ** 3); // 8 (2 cubed)

let agesuresh = 2026 - 1990;
console.log('\nAge calculations:');
console.log('Age * 2:', agesuresh * 2); // multiply
console.log('Age / 2:', agesuresh / 2); // divide
console.log('Age ** 2:', agesuresh ** 2); // power

// ============================================================
// ASSIGNMENT OPERATORS
// ============================================================

console.log('\n--- ASSIGNMENT OPERATORS ---');

let x = 10;
console.log('Initial x:', x); // 10

// Addition assignment (x = x + value)
x += 5; // Same as: x = x + 5
console.log('After x += 5:', x); // 15

// Subtraction assignment
x -= 3; // Same as: x = x - 3
console.log('After x -= 3:', x); // 12

// Multiplication assignment
x *= 2; // Same as: x = x * 2
console.log('After x *= 2:', x); // 24

// Division assignment
x /= 4; // Same as: x = x / 4
console.log('After x /= 4:', x); // 6

// ============================================================
// INCREMENT & DECREMENT
// ============================================================

console.log('\n--- INCREMENT & DECREMENT ---');

let counter = 10;

// Increment (add 1)
counter++; // Same as: counter = counter + 1
console.log('After counter++:', counter); // 11

// Decrement (subtract 1)
counter--; // Same as: counter = counter - 1
console.log('After counter--:', counter); // 10

// Difference: ++/-- before vs after
let num = 5;
console.log('num++:', num++); // Prints 5, then increments
console.log('After num++:', num); // Now 6

let num2 = 5;
console.log('++num2:', ++num2); // Increments first, then prints 6

// ============================================================
// COMPARISON OPERATORS (return true/false)
// ============================================================

console.log('\n--- COMPARISON OPERATORS ---');

let num1 = 10,
  num2 = 20;

console.log('10 > 20:', num1 > num2); // false (greater than)
console.log('10 < 20:', num1 < num2); // true (less than)
console.log('10 >= 10:', num1 >= 10); // true (greater or equal)
console.log('20 <= 20:', num2 <= 20); // true (less or equal)
console.log('10 == 10:', num1 == 10); // true (equal)
console.log('10 != 20:', num1 != num2); // true (not equal)

// ============================================================
// OPERATOR PRECEDENCE (Order of operations - BODMAS)
// ============================================================

console.log('\n--- OPERATOR PRECEDENCE ---');

// Without understanding precedence, mistakes happen:
console.log('2 + 3 * 4:', 2 + 3 * 4); // 14 (multiply first, then add)
console.log('(2 + 3) * 4:', (2 + 3) * 4); // 20 (parentheses first)

let result = 10 + 5 * 2; // 20 (5*2 happens first)
console.log('Order matters:', result);

// Rules (highest to lowest priority):
// 1. Parentheses ()
// 2. Exponentiation **
// 3. Multiplication * Division / Modulus %
// 4. Addition + Subtraction -
// 5. Assignment =
