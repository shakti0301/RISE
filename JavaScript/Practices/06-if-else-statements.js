// If-Else statement - conditional execution of code
const age = 17;

if (age > 18) {
  console.log('You are eligible for vote');
} else if (age > 80) {
  // Second condition to check
  console.log(`You are above threshold limit`);
} else {
  // If none of above conditions are true
  const yearLeft = 18 - age;
  console.log(`Wait for ${yearLeft} Year!`);
}
