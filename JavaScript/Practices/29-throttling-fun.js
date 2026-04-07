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
