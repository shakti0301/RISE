// ============================================================
// ASYNC/AWAIT - Modern way to handle asynchronous operations
// ============================================================

// Async/Await is syntactic sugar over Promises
// Makes async code look like synchronous code (easier to read)

// ============================================================
// ASYNC FUNCTION - Always returns a Promise
// ============================================================

// async keyword makes a function return a Promise automatically
async function greetAsync() {
  return 'Hello from async function!';
}

// Call async function
greetAsync().then((message) => {
  console.log(message); // Output: Hello from async function!
});

// ============================================================
// AWAIT KEYWORD - Wait for Promise to resolve
// ============================================================

// await causes JavaScript to STOP and wait for Promise
// Can only use await inside async function
// When Promise resolves, execution continues

async function demonstrateAwait() {
  console.log('Starting...');

  // Create a simple Promise
  const promise = new Promise((resolve) => {
    setTimeout(() => {
      resolve('Promise resolved!');
    }, 2000);
  });

  // await makes the code wait for promise
  const result = await promise;
  console.log(result); // Prints after 2 seconds

  console.log('Finished!');
}

// Call the function
// demonstrateAwait();

// ============================================================
// COMPARISON: Promise vs Async/Await
// ============================================================

// Using Promise
function fetchDataWithPromise() {
  return fetch('https://jsonplaceholder.typicode.com/users')
    .then((response) => response.json())
    .then((data) => {
      console.log('Promise approach:', data.length, 'users');
      return data;
    })
    .catch((error) => {
      console.log('Error:', error);
    });
}

// Same logic with Async/Await (cleaner!)
async function fetchDataWithAsync() {
  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/users');
    const data = await response.json();
    console.log('Async/Await approach:', data.length, 'users');
    return data;
  } catch (error) {
    console.log('Error:', error);
  }
}

// The async/await version is more readable!

// ============================================================
// ERROR HANDLING - try/catch blocks
// ============================================================

async function fetchUserWithErrorHandling() {
  try {
    // try block - code that might fail
    console.log('Fetching user...');

    const response = await fetch(
      'https://jsonplaceholder.typicode.com/users/1',
    );

    // Check if response is ok
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const user = await response.json();
    console.log('User found:', user.name);
    return user;
  } catch (error) {
    // catch block - handles errors
    console.log('Error caught:', error.message);
    return null;
  } finally {
    // finally block - runs regardless of success/fail
    console.log('Request completed');
  }
}

// Call the function
// fetchUserWithErrorHandling();

// ============================================================
// PRACTICAL EXAMPLE - Multiple async operations
// ============================================================

async function processUserData() {
  try {
    // Step 1: Fetch user
    const userResponse = await fetch(
      'https://jsonplaceholder.typicode.com/users/1',
    );
    const user = await userResponse.json();
    console.log('User:', user.name);

    // Step 2: Fetch user's posts
    const postsResponse = await fetch(
      `https://jsonplaceholder.typicode.com/posts?userId=${user.id}`,
    );
    const posts = await postsResponse.json();
    console.log('Posts count:', posts.length);

    // Step 3: Return combined data
    return {
      user: user.name,
      postCount: posts.length,
    };
  } catch (error) {
    console.log('Error processing user:', error);
    return null;
  }
}

// Call it
// processUserData().then(result => console.log('Result:', result));

// ============================================================
// PARALLEL ASYNC OPERATIONS - Run multiple at once
// ============================================================

async function fetchMultipleUsers() {
  try {
    // Wait for all promises SIMULTANEOUSLY (not one after another)
    const [user1, user2, user3] = await Promise.all([
      fetch('https://jsonplaceholder.typicode.com/users/1').then((r) =>
        r.json(),
      ),
      fetch('https://jsonplaceholder.typicode.com/users/2').then((r) =>
        r.json(),
      ),
      fetch('https://jsonplaceholder.typicode.com/users/3').then((r) =>
        r.json(),
      ),
    ]);

    console.log('User 1:', user1.name);
    console.log('User 2:', user2.name);
    console.log('User 3:', user3.name);
  } catch (error) {
    console.log('Error fetching users:', error);
  }
}

// Call it
// fetchMultipleUsers();

// ============================================================
// REAL-WORLD EXAMPLE - Fetch API (Returns Promise)
// ============================================================

async function getUsers() {
  try {
    // await makes the code wait for fetch to complete
    const res = await fetch('https://jsonplaceholder.typicode.com/users');

    // await waits for response.json() to complete
    const data = await res.json();

    console.log('Successfully fetched', data.length, 'users');
    console.log('First user:', data[0].name);
  } catch (error) {
    console.log('Error fetching users:', error);
  }
}

// Uncomment to run actual fetch
// getUsers();

// ============================================================
// KEY DIFFERENCES FROM PROMISES
// ============================================================

/*
PROMISES:
- Use .then() and .catch()
- Can be harder to read with nested chains
- More verbose syntax

ASYNC/AWAIT:
- Looks like synchronous code
- Use try/catch for error handling
- Cleaner, more readable
- Better for beginners

BOTH:
- Return Promises
- Handle asynchronous operations
- Can be used together
*/

// ============================================================
// COMMON MISTAKES & BEST PRACTICES
// ============================================================

// ❌ Wrong - Not awaiting
// async function wrongWay() {
//   const data = fetch('url');  // Not awaited!
//   console.log(data);  // Prints Promise object, not data
// }

// ✅ Correct - Using await
async function rightWay() {
  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/users');
    const data = await response.json();
    console.log(data); // Prints actual data
  } catch (error) {
    console.log('Error:', error);
  }
}

// ✅ Multiple awaits in sequence (waits for each one)
// Best when second operation depends on first

// ✅ Multiple awaits in parallel (all run together)
// Best when operations are independent
