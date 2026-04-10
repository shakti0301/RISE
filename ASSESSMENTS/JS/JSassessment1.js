// 1. Reverse a string without built-in reverse()
function reverseString(str) {
  let reversed = '';
  for (let i = str.length - 1; i >= 0; i--) {
    reversed += str[i];
  }
  return reversed;
}

// Alternative using recursion
function reverseStringRecursive(str) {
  return str === '' ? '' : reverseStringRecursive(str.slice(1)) + str[0];
}

// 2. Check if a number is prime
function isPrime(num) {
  if (num <= 1) return false;
  if (num <= 3) return true;
  if (num % 2 === 0 || num % 3 === 0) return false;

  for (let i = 5; i * i <= num; i += 6) {
    if (num % i === 0 || num % (i + 2) === 0) return false;
  }
  return true;
}

// 3. Async function to fetch API data with error handling
async function fetchData(url) {
  try {
    const response = await fetch(url);

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching data:', error.message);
    throw error; // Re-throw for caller to handle
  }
}

// Usage example:
// await fetchData('https://api.example.com/data')
//   .catch(error => console.log('Failed to fetch:', error));

// 4. Debounce function
function debounce(func, delay) {
  let timeoutId;

  return function debounced(...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => {
      func.apply(this, args);
    }, delay);
  };
}

// Usage example:
// const debouncedSearch = debounce((query) => {
//   console.log('Searching for:', query);
// }, 300);

// 5. Flatten a nested array
function flattenArray(arr) {
  return arr.reduce((flat, item) => {
    return flat.concat(Array.isArray(item) ? flattenArray(item) : item);
  }, []);
}

// Alternative using spread operator and recursion
function flattenArrayV2(arr) {
  return arr.flatMap((item) =>
    Array.isArray(item) ? flattenArrayV2(item) : item,
  );
}

// Usage example:
// flattenArray([1, [2, [3, 4]], 5]) → [1, 2, 3, 4, 5]

// ========== TEST CASES & OUTPUT ==========

console.log('=== 1. REVERSE STRING ===');
console.log('reverseString("hello"):', reverseString('hello'));
console.log('reverseString("JavaScript"):', reverseString('JavaScript'));
console.log(
  'reverseStringRecursive("world"):',
  reverseStringRecursive('world'),
);

console.log('\n=== 2. CHECK PRIME NUMBER ===');
console.log('isPrime(2):', isPrime(2));
console.log('isPrime(17):', isPrime(17));
console.log('isPrime(20):', isPrime(20));
console.log('isPrime(97):', isPrime(97));
console.log('isPrime(1):', isPrime(1));

console.log('\n=== 3. FETCH API DATA ===');
console.log('Fetching data from JSONPlaceholder API...');
fetchData('https://jsonplaceholder.typicode.com/posts/1')
  .then((data) => {
    console.log('Success:', data);
  })
  .catch((error) => {
    console.log('Error:', error.message);
  });

console.log('\n=== 4. DEBOUNCE FUNCTION ===');
const debouncedLog = debounce((msg) => {
  console.log('Debounced:', msg);
}, 300);

console.log('Calling debounced function multiple times...');
debouncedLog('Call 1');
debouncedLog('Call 2');
debouncedLog('Call 3 - Only this will execute after 300ms');

console.log('\n=== 5. FLATTEN ARRAY ===');
console.log(
  'flattenArray([1, [2, [3, 4]], 5]):',
  flattenArray([1, [2, [3, 4]], 5]),
);
console.log(
  'flattenArray([1, 2, [3, [4, [5, 6]]]]):',
  flattenArray([1, 2, [3, [4, [5, 6]]]]),
);
console.log(
  'flattenArrayV2([[1, 2], [3, 4], [5, [6, 7]]]):',
  flattenArrayV2([
    [1, 2],
    [3, 4],
    [5, [6, 7]],
  ]),
);
