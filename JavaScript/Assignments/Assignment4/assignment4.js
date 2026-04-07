//1.

let numbers = [1, 2, 3, 3, 2, 4, 2, 3, 4, 1, 9, 7, 5, 4, 3];
let seen = new Set();
let duplicate = new Set();
let unique = new Set();

function findDuplicatesAndUniques(arr) {
  for (let num of arr) {
    if (seen.has(num)) {
      duplicate.add(num);
      unique.delete(num);
    } else {
      seen.add(num);
      unique.add(num);
    }
  }
  return {
    duplicates: [...duplicate],
    uniques: [...unique],
  };
}

const result = findDuplicatesAndUniques(numbers);

console.log('Original Array:', numbers);
console.log('Duplicate Elements:', result.duplicates);
console.log('Unique Elements:', result.uniques);

//2.

function throttle(fn, delay) {
  let lastCall = 0;

  return function (...args) {
    const now = Date.now();

    if (now - lastCall < delay) {
      return;
    }
    lastCall = now;
    return fn(...args);
  };
}

const sendMessageWithDelay = throttle(sendMessage, 1000);

function sendMessage(message) {
  console.log('Sending Message : ', message);
}

sendMessageWithDelay('Hello');
sendMessageWithDelay('Hi');
sendMessageWithDelay('HRU');
sendMessageWithDelay('Etc');

//3.

const inventory = [
  { name: 'apples', category: 'fruit' },
  { name: 'bananas', category: 'fruit' },
  { name: 'carrots', category: 'vegetable' },
];

const groupesItems = inventory.reduce((arr, item) => {
  const groupKey = item.category;

  if (!arr[groupKey]) {
    arr[groupKey] = [];
  }
  arr[groupKey].push(item);

  return arr;
}, {});

console.log(groupesItems);

//4.

async function fatchData() {
  let res = await fetch('https://jsonplaceholder.typicode.com/users');
  if (!res.ok) {
    throw new Error('API Failed');
  }
  return res.json();
}

async function retryCall(fn, count) {
  for (let i = 0; i < count; i++) {
    try {
      let result = await fn();
      return result;
    } catch (error) {
      console.log(`Attempt ${i} Failed`);

      if (i === count - 1) {
        throw error;
      }
    }
  }
}

retryCall(fatchData, 3)
  .then((data) => console.log(data))
  .catch((err) => console.error('Final Error:', err));

//5.
class EventEmitter {
  constructor() {
    this.events = {};
  }

  on(event, callback) {
    if (!this.events[event]) {
      this.events[event] = [];
    }
    this.events[event].push(callback);
  }

  off(event, callback) {
    if (this.events[event]) {
      this.events[event] = this.events[event].filter((fn) => fn !== callback);
    }
  }

  emit(event) {
    if (this.events[event]) {
      this.events[event].forEach((fn) => fn());
    }
  }
}

const e = new EventEmitter();

function sayHi() {
  console.log('Hi');
}

e.on('greet', sayHi);
e.emit('greet');

e.off('greet', sayHi);
e.emit('greet');
