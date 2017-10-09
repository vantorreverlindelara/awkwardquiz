const serviceWorker = null;
const isAdded = false;

const APP_SERVER_KEY = "YzgxNzg1MzItODUwNi00YmNjLThhNGYtMWU2YmNmYjkxMzEx";

if ('serviceWorker' in navigator && 'PushManager' in window) {

  navigator.serviceWorker
  .register('./../service-worker.js', { scope: './' })
  .then(function(registration) {
    console.log("Service Worker Registered",registration);
  })
  .catch(function(err) {
    console.log("Service Worker Failed to Register", err);
  })

}
