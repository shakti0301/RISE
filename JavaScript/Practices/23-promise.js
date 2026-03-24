const fetchData = new Promise((resolve, reject) => {
  let success = false;

  if (success) {
    resolve('Data fatched successfully');
  } else {
    reject('Error while fetching data');
  }
});

fetchData.then((res) => console.log(res)).catch((err) => console.log(err));
