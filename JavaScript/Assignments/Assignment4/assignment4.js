// 1. Employee Salary Processor
const Employee = [
  { name: 'Shakti', salary: 41000 },
  { name: 'Kushal', salary: 45000 },
  { name: 'Shyam', salary: 10000 },
];

const filteredEmployees = Employee.filter(
  (employee) => employee.salary > 40000,
);

const increasedSalary = filteredEmployees.map((employee) => {
  const incrementedSalary = employee.salary + employee.salary * 0.1;
  return { ...employee, incrementedSalary };
});

console.log(increasedSalary);
