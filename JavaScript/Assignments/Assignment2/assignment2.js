//Assignment 1: Smart Discount Calculator

let name = 'Shaktisinh';
let age = 22;
let purchaseAmount = 12000;
let discount;

if (age < 18) {
  discount = 0.1;
} else if (age >= 60) {
  discount = 0.2;
} else {
  discount = 0;
}

if (purchaseAmount > 5000) {
  discount = discount + 0.05;
}

let finalAmount = purchaseAmount - purchaseAmount * discount;

console.log(
  `Hello ${name}, your final amount after discount is: ${finalAmount}`,
);

//----------------------------------------------------------------
//Assignment 2: Login Validation System

let actualUsername = 'shakti0301';
let actualPassword = 'pass12345';

let enteredUsername = 'shakti0301';
let enteredPassword = 'pass12345';

if (enteredUsername != actualUsername) {
  if (enteredPassword != actualPassword) {
    console.log('Both Username and Password is wrong');
  } else {
    console.log('Your Username OR Password is worng');
  }
} else if (enteredPassword != actualPassword) {
  console.log('Incorrect Password');
} else {
  console.log('Login Successful!');
}

//---------------------------------------------------------------
//Assignment 3: Number Analyzer Tool

let number = -4;

if (number === 0) {
  console.log('Entered number is zero');
} else if (number > 0) {
  if (number % 2 == 0) {
    console.log(`The number ${number} is positive and even.`);
  } else {
    console.log(`The number ${number} is positive and odd.`);
  }
} else if (number % 2 == 0) {
  console.log(`The number ${number} is negative and even.`);
} else {
  console.log(`The number ${number} is negative and odd.`);
}

//---------------------------------------------------------------
//Assignment 4: Shopping Eligibility Checker
let isMember = false;
let cartValue = 2200;

if ((isMember && cartValue > 1000) || cartValue > 2000) {
  console.log('You are eligible for free delivery!');
} else {
  console.log('You are not eligible for free delivery!');
}

//---------------------------------------------------------------
//Assignment 5: Grade Evaluation System

let marks = 40;
let Grade;

if (marks > 100 || marks < 0) {
  console.log('Invalid Input');
} else {
  if (marks >= 90) {
    Grade = 'A';
  } else if (marks <= 89 && marks >= 75) {
    Grade = 'B';
  } else if (marks <= 74 && marks >= 50) {
    Grade = 'C';
  } else {
    Grade = 'F (Fail)';
  }
}

console.log(`Your Grade is ${Grade}`);
