//1. Write a function that merges two objects using the Spread Operator.
let obj1 = {
  name: 'Shaktisinh',
  age: 22,
  Id: 1101,
};

let obj2 = {
  Address: '1101, Abc xyz',
  Domain: 'Full Stack',
  Org: 'Rishabh Soft.',
};

const mergeTwoObj = { ...obj1, ...obj2 };

console.log('Result is ', mergeTwoObj);

//2. Given an array of transaction objects [{amt: 100, type: 'deposit'}, {amt: 50, type: 'withdrawal'}], calculate the final balance in a single line.
let arr = [
  { amt: 100, type: 'deposit' },
  { amt: 50, type: 'withdrawal' },
];
const finalBalance = arr.reduce((acc, ob) => {
  return ob.type === 'deposit' ? acc + ob.amt : acc - ob.amt;
}, 0);

console.log('Total Balance is ', finalBalance);

//3. Write a function that can take any number of numerical arguments and returns their total sum.
function calculateSum(...args) {
  let arr1 = [...args];
  let sum = arr1.reduce((res, num) => res + num, 0);
  return sum;
}
let result = calculateSum(1, 2, 3, 4, 5, 6);

console.log('Total sum is ', result);

// 4. Create a class Vehicle with a constructor for brand. Create a sub-class Car that adds a model property and a method displayInfo() that logs both.
class Vehicle {
  constructor(b) {
    // WRONG: using let creates a local variable, not a class property. Should use this.brand
    this.brand = b;
  }
}

class Car extends Vehicle {
  constructor(modal) {
    // WRONG: super() was called incorrectly with super.Vehicle(). Should be super(brandValue)
    super('BMW');
    // WRONG: using let creates local variables. Should use this.model
    this.model = modal;
  }
  displayInfo() {
    // WRONG: this.brand1 and this.modal1 don't exist. Should be this.brand and this.model
    console.log('Brand : ', this.brand);
    console.log('Modal : ', this.model);
  }
}

// WRONG: Car.displayInfo() calls method on class, not instance. Need to create instance first
let car = new Car('X7');
car.displayInfo();

// 5.Create a function timeoutPromise(ms) that returns a promise which rejects after ms milliseconds. Use Promise.race to stop a fetch request if it takes longer than 5 seconds
function timeoutPromise(ms) {
  // WRONG: first parameter should be 'resolve', not 'response'
  return new Promise((resolve, reject) => {
    // resolve('Hello There');
    setTimeout(() => {
      reject(new Error('Request timed out'));
    }, ms);
  });
}

let afterTimeout = timeoutPromise(3000);
console.log(afterTimeout);
