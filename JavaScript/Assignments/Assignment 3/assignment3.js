// 1: Student Report System

const Students = [
  { name: 'Shakti', marks: [90, 70, 50, 60, 100] },
  { name: 'Kushal', marks: [80, 78, 67, 45, 90] },
  { name: 'Shyam', marks: [10, 50, 90, 30, 20] },
];

const studentsWithAverage = Students.map((student) => {
  const totalMarks = student.marks.reduce((num, res) => num + res, 0);
  const averageMarks = totalMarks / student.marks.length;
  return { ...student, average: averageMarks };
});

const studentsWithResult = studentsWithAverage.map((student) => {
  let result;
  if (student.average >= 75) {
    result = 'Distinction';
  } else if (student.average >= 50) {
    result = 'Pass';
  } else {
    result = 'Fail';
  }
  return { ...student, result };
});

console.log(studentsWithResult);

//2: Shopping Cart Analyzer

const items = [
  { name: 'Laptop', price: 1000, quantity: 2 },
  { name: 'Phone', price: 500, quantity: 3 },
  { name: 'Headphones', price: 100, quantity: 5 },
];

function calculateTotal(...items) {
  let totalAmount = 0;
  let totalQuantity = 0;
  totalAmount = items.reduce(
    (total, item) => total + item.price * item.quantity,
    0,
  );
  totalQuantity = items.reduce((total, item) => total + item.quantity, 0);
  return { totalAmount, totalQuantity };
}

const total = calculateTotal(...items);
console.log(total);

// 3: User Profile Updater
const userProfile = {
  name: 'Shakti',
  age: 22,
  city: 'Anand',
};

function updateUsrProfile(newCity, profession) {
  return { ...userProfile, city: newCity, profession };
}

const updatedProfile = updateUsrProfile('Ahmedabad', 'Developer');
console.log(updatedProfile);
console.log(userProfile);

//4: Product Filter & Transform
const products = [
  { name: 'Laptop', price: 1500 },
  { name: 'Phone', price: 800 },
  { name: 'Headphones', price: 1200 },
];

const filteredProducts = products.filter((product) => product.price > 1000);

const discountedProducts = filteredProducts.map((product) => {
  const discountedPrice = product.price - product.price * 0.1;
  return { ...product, discountedPrice };
});

console.log(discountedProducts);

//5: Dynamic Number Processor
const numbers = [23, 12, 34, 45, 56, 67, 78, 89, 90];
function dunamicNumberProcessor(...numbers) {
  const evenNumbers = numbers.filter((num) => num % 2 === 0);
  const oddNumbers = numbers.filter((num) => num % 2 !== 0);

  const sumEven = evenNumbers.reduce((total, num) => total + num, 0);
  const sumOdd = oddNumbers.reduce((total, num) => total + num, 0);

  return { evenNumbers, oddNumbers, sumEven, sumOdd };
}

const result = dunamicNumberProcessor(...numbers);
console.log(result);
