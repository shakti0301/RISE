//'use strict';

// console.log('Hello, World! This is a simple JavaScript file.');

// let firstname = 'suresh';
// console.log(firstname);

// let firstname1 = 'suresh';
// let lastname1 = 'sharma';
// console.log(firstname1 + ' ' + lastname1);
// console.log(firstname1, lastname1);
// console.log(firstname1);
// console.log(lastname1);

// // DATATYPE //

// let year = 20;
// let firstname2 = 'ramesh';
// let age = 20.5;
// console.log(age);
// console.log(age);
// console.log(age);

// let javaisfun = true;
// console.log(typeof javaisfun);

// let undefinedVariable;
// console.log(undefinedVariable);

// let agesuresh = 2026 - 1990;
// let agesurewh = 1990 - 2026;
// let ageramesh = 2026 - 1995;
// console.log(agesuresh);
// console.log(agesurewh);
// console.log(ageramesh);

// console.log(agesuresh * 2, agesuresh / 2, agesuresh ** 2);

// let x = 10 + 5;
// x += 10; // x= x+10
// x++;
// x--;
// console.log(x);

// const firstName = 'Suresh';
// const year = 2010;
// const birthYear = 1990;
// const job = 'professional';
// console.log(
//   'I am ' + firstName + ' ' + (year - birthYear) + ' years - old ' + job, //without backticks we need to write + sign
// );
// console.log(`I am ${firstName} ${year - birthYear} year old ${job}`); //String literals using backticks

//If - else statemant
// const age = 17;
// if (age > 18) {
//   console.log('You are eligible for vote');
// } else if (age > 80) {
//   console.log(`You are above threshould limit`);
// } else {
//   const yearLeft = 18 - age;
//   console.log(`Wait for ${yearLeft} Year!`);
// }

// const year = '2010';
// console.log(Number(year)); //if year is a number then we also able to convert it into number
// console.log(String(year));

// const year = 'TwentyTen';
// console.log(Number(year)); //Gives outout NaN - Not a Number and its data type is number
// console.log(typeof NaN);

//Type Coercion
// console.log('I am ' + 23 + ' Years Old!');
// console.log('23' - '10' - 3); //gives 10
// console.log('23' - 10 - 'Year');

//Here + sign -> 23 convert into string (Only with + sign not with others)
// String + Number = String
// Number + Number = Number

// let n = '1' + 1 //-> its 11

//falsy values 0, Null, NaN, Undefined, ''

// console.log(Boolean(0));
// console.log(Boolean(NaN));
// console.log(Boolean(null));
// console.log(Boolean(''));
// console.log(Boolean(undefined));

// let money;

// if (money > 500) {
//   console.log('Dont Sent it all ');
// } else {
//   console.log('save More');
// }

//Strict equakity == VS ===

// let money = '100';

// if (money == 100) {
//   console.log('Message print successfilly');
// }

// if (money === 100) {
//   console.log('This msg is for strict equality check');
// }

//=== will check data type also

// Ternary Operator :->.    ?(if) : (else)

// const score = 70;

// const result = score > 70 ? 'Great Job' : 'Need inprovement';

// console.log(result);

// let result1;
// if (score > 70) {
//   result1 = 'Great Job';
// } else {
//   result1 = 'Need Improvement';
// }

//Logical Operator &&, ||, !

// const givenProgrammingAssess = true;
// const givenDBAssess = true;

// console.log(givenDBAssess && givenProgrammingAssess); //AND
// console.log(givenDBAssess || givenProgrammingAssess); //OR
// console.log(!givenDBAssess); //NOT

// Here we can passed it in if else

// Functions - Reusability
// function greetings() {
//   console.log('Good Morning');
// }

// greetings();

// function greetings(firstName = 'there', lastName) {
//   //here 'there' is a default parameter
//   //Variable inside a function
//   console.log('Hello ' + firstName + lastName);
// }

// greetings('shakti', 'raolji'); //value you passed

// function add(a, b) {
//   return a + b;
// }

// let sum = add(2, 2);
// console.log(sum);

const greet = function () {
  console.log('Hello World');
};

console.log(greet);
greet();
