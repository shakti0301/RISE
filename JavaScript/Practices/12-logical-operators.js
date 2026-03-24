// Logical Operators: &&, ||, !
const givenProgrammingAssess = true;
const givenDBAssess = true;

// AND (&&) - returns true only if both conditions are true
console.log(givenDBAssess && givenProgrammingAssess); // Output: true

// OR (||) - returns true if at least one condition is true
console.log(givenDBAssess || givenProgrammingAssess); // Output: true

// NOT (!) - reverses the boolean value
console.log(!givenDBAssess); // Output: false (negation of true)

// Practical use in if-else statements
if (givenDBAssess && givenProgrammingAssess) {
  console.log('Student completed both assessments');
}

if (givenDBAssess || givenProgrammingAssess) {
  console.log('Student completed at least one assessment');
}

if (!givenDBAssess) {
  console.log('Student has not completed DB assessment');
}
