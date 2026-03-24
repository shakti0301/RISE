// Array Manipulation Methods - shift(), unshift(), push(), pop()

// shift() - removes first element from array and returns it
// Modifies the original array
let arr = [1, 2, 3, 4];
const removed = arr.shift();
console.log(removed); // Output: 1
console.log(arr); // Output: [2, 3, 4] (original modified)

// unshift() - adds elements to the beginning of array
// Returns the new length of array
arr.unshift(5, 6);
console.log(arr); // Output: [5, 6, 2, 3, 4]

// Practical example - managing a queue or stack
let queue = ['first', 'second', 'third'];
queue.unshift('new_first'); // Add to front
console.log(queue); // ['new_first', 'first', 'second', 'third']

let processed = queue.shift(); // Remove from front
console.log(processed); // 'new_first'
console.log(queue); // ['first', 'second', 'third']

// pop() - removes last element from array
let arr2 = [1, 2, 3, 4];
arr2.pop(); // Removes 4
console.log(arr2); // [1, 2, 3]

// push() - adds element to end of array
arr2.push(5); // Adds 5 at end
console.log(arr2); // [1, 2, 3, 5]

// Summary:
// shift() - remove from start ⬅️
// unshift() - add to start ➡️
// pop() - remove from end ⬅️
// push() - add to end ➡️
