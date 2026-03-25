function processUser(name, callback) {
  console.log('Processing user:', name);
  callback();
}
function showMessage() {
  console.log('user processed seccussfully');
}
processUser('shakti', showMessage);
