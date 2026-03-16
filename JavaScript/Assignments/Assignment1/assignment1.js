let sureshHeight = 1.71;
let rameshHeight = 1.76;

let sureshMass = 60;
let rameshMass = 75;

let sureshBMI = sureshMass / sureshHeight ** 2;
let rameshBMI = rameshMass / rameshHeight ** 2;

console.log(`BMI of Suresh is ${sureshBMI}`);
console.log(`BMI of Ramesh is ${rameshBMI}`);

let markHigherBMI = sureshBMI > rameshBMI;

console.log(`Suresh has higher BMI than Ramesh : ${markHigherBMI}`);
