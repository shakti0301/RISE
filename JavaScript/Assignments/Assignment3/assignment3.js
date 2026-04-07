// 1. Employee Salary Processor
const Employee = [
  { name: 'Shakti', salary: 41000 },
  { name: 'Kushal', salary: 75000 },
  { name: 'Shyam', salary: 10000 },
];

const filteredEmployees = Employee.filter(
  (employee) => employee.salary > 40000,
);

const increasedSalary = filteredEmployees.map((employee) => {
  const incrementedSalary = employee.salary * 0.1;
  const finalSalary = employee.salary + incrementedSalary;
  return { ...employee, finalSalary };
});

const employeeLevel = increasedSalary.map((employee) => {
  let level;
  if (employee.finalSalary >= 70000) {
    level = 'Senior';
  } else {
    level = 'Mid';
  }

  return { ...employee, level };
});

console.log(employeeLevel);

// 2. Order Management System

const orders = [
  {
    orderId: 1,
    customerName: 'Shakti',
    items: [
      { itemName: 'Laptop', quantity: 1, price: 1000 },
      { itemName: 'Mouse', quantity: 2, price: 500 },
    ],
  },
  {
    orderId: 2,
    customerName: 'Kushal',
    items: [
      { itemName: 'Keyboard', quantity: 1, price: 1000 },
      { itemName: 'Mouse', quantity: 1, price: 700 },
      { itemName: 'Bag', quantity: 1, price: 3500 },
    ],
  },
  {
    orderId: 3,
    customerName: 'Shyam',
    items: [
      { itemName: 'iPhone', quantity: 1, price: 90000 },
      { itemName: 'Laptop Bag', quantity: 3, price: 2000 },
    ],
  },
];
const result = orders.map((order) => {
  let totalAmount = 0;
  let totalQuantity = 0;

  order.items.forEach((item) => {
    totalAmount += item.price * item.quantity;
    totalQuantity += item.quantity;
  });

  return {
    orderId: order.orderId,
    totalAmount: totalAmount,
    totalQuantity: totalQuantity,
  };
});

console.log(result);
