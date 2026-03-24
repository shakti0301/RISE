// ============================================================
// PROMISES - Handle asynchronous operations
// ============================================================

// Promise represents an eventual completion/failure of async operation
// States: Pending → Fulfilled (resolve) or Rejected (reject)

// ============================================================
// PROMISE BASICS
// ============================================================

// Creating a Promise
const fetchData = new Promise((resolve, reject) => {
  console.log('Promise is running...');

  // Simulate async operation (like API call)
  let success = Math.random() > 0.5;

  setTimeout(() => {
    if (success) {
      // Success - call resolve with value
      resolve('Data fetched successfully!');
    } else {
      // Failure - call reject with error
      reject('Error while fetching data');
    }
  }, 2000); // Simulate 2 second delay
});

// ============================================================
// HANDLING PROMISES WITH .then() AND .catch()
// ============================================================

// .then() - handles resolved promise (success case)
// .catch() - handles rejected promise (error case)

fetchData
  .then((result) => {
    // result is the value passed to resolve()
    console.log('✓ Success:', result);
  })
  .catch((error) => {
    // error is the value passed to reject()
    console.log('✗ Error:', error);
  });

// ============================================================
// PROMISE CHAINING - One .then() leads to another
// ============================================================

const getUser = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve({ id: 1, name: 'Shakti' });
  }, 1000);
});

getUser
  .then((user) => {
    console.log('User found:', user.name);
    return user.id; // Pass to next .then()
  })
  .then((userId) => {
    console.log('User ID:', userId);
    return 'Processing user...';
  })
  .then((message) => {
    console.log(message);
  })
  .catch((error) => {
    console.log('Error in chain:', error);
  });

// ============================================================
// REAL-WORLD EXAMPLE - Fetch API (Returns Promise)
// ============================================================

function getUsers() {
  // fetch() returns a Promise
  fetch('https://jsonplaceholder.typicode.com/users')
    .then((response) => {
      console.log('Response received, converting to JSON...');
      return response.json(); // Returns another Promise
    })
    .then((data) => {
      console.log('Users data:', data.length, 'users found');
      console.log('First user:', data[0].name);
    })
    .catch((err) => {
      console.log('Error fetching users:', err);
    });
}

// Uncomment to run
// getUsers();

// ============================================================
// PROMISE UTILITY METHODS
// ============================================================

// Promise.all() - wait for ALL promises
const promise1 = Promise.resolve(3);
const promise2 = new Promise((resolve) =>
  setTimeout(() => resolve('success'), 100),
);
const promise3 = fetch('https://jsonplaceholder.typicode.com/users').then((r) =>
  r.json(),
);

// Promise.all([promise1, promise2, promise3])
//   .then((results) => {
//     console.log('All promises resolved:', results);
//   })
//   .catch((error) => {
//     console.log('At least one promise failed:', error);
//   });

// Promise.race() - return result of first completed promise
// Promise.race([promise1, promise2])
//   .then((result) => {
//     console.log('First promise resolved:', result);
//   });

// ============================================================
// KEY POINTS ABOUT PROMISES
// ============================================================

/*
1. STATES:
   - Pending: Operation hasn't completed yet
   - Fulfilled: Operation completed successfully (resolved)
   - Rejected: Operation failed (rejected)

2. IMMUTABLE: Once resolved/rejected, state cannot change

3. CHAINING: .then() returns new Promise, allowing chains

4. ERROR HANDLING: .catch() catches errors in chain

5. REAL WORLD USE:
   - Fetching data from servers
   - Reading files
   - Database queries
   - Any operation that takes time
*/
