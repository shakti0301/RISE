// const fetchData = new Promise((resolve, reject) => {
//   //   let success = true;
//   let success = Math.random() > 0.5;

//   setTimeout(() => {
//     if (success) {
//       resolve('Data fatched successfully');
//     } else {
//       reject('Error while fetching data');
//     }
//   }, 5000);
// });

// fetchData.then((res) => console.log(res)).catch((err) => console.log(err));

function getUsers() {
  fetch('https://jsonplaceholder.typicode.com/users')
    .then((res) => res.json())
    .then((data) => {
      console.log('Promise Data:', data);
    })
    .catch((err) => {
      console.log('Promise Error:', err);
    });
}

getUsers();
