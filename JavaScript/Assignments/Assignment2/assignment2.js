let name = prompt('Enter your Name');
let age = prompt('Enter your Age');
let purchaseAmount = prompt('Enter your Purchase Amount');
let discount;

if (age < 18) {
  discount = 0.1;
} else if (age >= 60) {
  discount = 0.2;
} else {
  discount = 0;
}

if (purchaseAmount > 5000) {
  discount += 0.05;
}

let finalAmount = purchaseAmount - purchaseAmount * discount;

alert(
  `Hello ${name}, your final amount after discount is: ${finalAmount.toFixed(2)}`,
);
