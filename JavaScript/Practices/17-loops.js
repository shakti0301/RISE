// Loops - execute code repeatedly

// For loop - execute block specific number of times
// Syntax: for (initialize; condition; increment)
for (let res = 1; res <= 5; res++) {
  console.log('Congratulations ' + res);
}

// While loop - execute while condition is true
let res = 1; // Initialize
while (res <= 5) {
  // Check condition each iteration
  console.log('Congratulations ' + res);
  res++; // Increment after each iteration
}

// Do-while loop - execute at least once, then check condition
let i = 1;
do {
  console.log('Hello ' + i);
  i++;
} while (i <= 3);

// Break statement - exit loop immediately
for (let i = 1; i <= 10; i++) {
  if (i === 5) {
    break; // Exit loop when i reaches 5
  }
  console.log(i);
}

// Continue statement - skip current iteration
for (let i = 1; i <= 5; i++) {
  if (i === 3) {
    continue; // Skip this iteration, move to next
  }
  console.log(i);
}
