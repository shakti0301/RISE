async function getUsers() {
  try {
    const res = await fetch('https://jsonplaceholder.typicode.com/users');
    const data = await res.json();
    console.log('Async/Await Data:', data);
  } catch (error) {
    console.log('Asybc Error:', error);
  }
}

getUsers();
