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

// const greet = function () {
//   console.log('Hello World');
// };

// console.log(greet);
// greet();

//Function calling another function
//calculate total orice with tax

// function calculateTax(amount) {
//   return amount * 0.18; // 18% tax
// }

// function calculateTotal(amount) {
//   let tax = calculateTax(amount); //calling another function
//   let total = amount + tax;
//   return total;
// }

// let finalAmount = calculateTotal(100);
// console.log(finalAmount);

//Arrow Function == When you want to skip return keyword and curley bracies

// const add = (a, b) => {
//   return a + b;
// };

//we can use it without curley brecies

// const greet = (name) => {
//   console.log('Hello ' + name);
//   console.log('Helloooooo' + name);
// };

// greet('Shakti');

// const person = {
//   name: 'Suresh',
//   age: 20,
//   greet: () => {
//     console.log(this.name);
//   },
// };

// person.greet();

// //this keyword is not used in aerrow function

// const persons = ['Suresh', 'Mahesh', 'Jayesh', 'Ramesh', 20];
// //its start with zero because of (n-1) e.g. days Thu 0 , Fri 1 left
// console.log(persons[5]);
// console.log(persons.length); //to get length
// persons.push('40'); // to add
// persons.splice(0, 0, 'Naresh'); //index, deletedCount, insertedValue
// console.log(persons);

//loops

// for (let res = 1; res <= 5; res++) {
//   //Initialize, check, increment
//   console.log('Congratulations ' + res);
// }

// let res = 1; //initialize
// while (res <= 5) {
//   // Check
//   console.log('Congratulations ' + res);
//   res++; //inc
// }

// //Object
// const person1 = {
//   firstName: 'Shakti',
//   lastName: 'Raolji',
//   age: 20,
//   hobbies: ['cricket', 'basketball'],
// };
// const person2 = {
//   firstName: 'Kushal',
//   lastName: 'Raolji',
//   age: 20,
//   hobbies: ['cricket', 'basketball'],
// };

// const person2 = {
//   a: 10,
//   b: 20,
// };

// const person3 = { ...person1, ...person2 }; //Spread

// console.log(person3);

// // const person3 = person1;   //It can change the base object value (person 1)
// const person3 = { ...person1 }; // it doesnt change the base object value (perosn 2)
// // person3.age = 30;
// // console.log(person1);

// let a = 20;
// a = 30;

// const b = [1, 2, 3];

// b.push(23);
// console.log(b);

// Rest
// const arr = [1, 2, 3, 4, 5];
// const [first, ...rest] = arr;
// console.log(rest);

// const arr = [1, 2, 3, 4, 5];
// const [first, ...rest] = arr;
// console.log(first + 1); //here it dosent get 2 from the array, it add both value 1 (first ) + 1

//MAP, REDUCE, FILTER

//Map - To modify
//Filter - To filter output
//Reduce - Generate single output

// const arr = [1, 2, 3, 4];
// const mappedValue = arr.map((num) => num + 5);
// console.log(mappedValue);

// const filterValue = arr.filter((num) => num > 2);
// console.log(filterValue);

// const result = arr.reduce((num, res) => num + res, 0); //0 is the initial number
// console.log(result);

// const arr = [1, 2, 3, 4];
// arr.shift();
// arr.unshift(5, 6);

// console.log(arr);

//Promise, Async/Await, Error Handling
