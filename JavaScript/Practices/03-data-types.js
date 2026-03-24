// ============================================================
// PRIMITIVE DATA TYPES
// ============================================================

// 1. STRING - Text data
let firstname2 = 'ramesh';
console.log(typeof firstname2); // Output: string

// 2. NUMBER - Integers and decimals
let year = 20;
let age = 20.5; // Decimal number
console.log(typeof age); // Output: number

// 3. BOOLEAN - true or false
let javaisfun = true;
console.log(typeof javaisfun); // Output: boolean

// 4. UNDEFINED - No value assigned
let undefinedVariable; // Not assigned any value
console.log(undefinedVariable); // Output: undefined

// 5. NULL - Intentional no value
let nothing = null;

// ============================================================
// ARITHMETIC CALCULATIONS
// ============================================================

let agesuresh = 2026 - 1990; // 36
let agesurewh = 1990 - 2026; // -36
let ageramesh = 2026 - 1995; // 31

console.log('Age Suresh:', agesuresh);
console.log('Age Surewh:', agesurewh);
console.log('Age Ramesh:', ageramesh);

// ============================================================
// TYPEOF OPERATOR - Check data type of any value
// ============================================================

console.log(typeof 42); // number
console.log(typeof 'hello'); // string
console.log(typeof true); // boolean
console.log(typeof undefined); // undefined
console.log(typeof null); // object (quirk in JS!)
