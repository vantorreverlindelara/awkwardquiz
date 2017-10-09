// Set a name for the current cache
var cacheName = 'AwkwardCache';

// Default files to always cache
var cacheFiles = [ //JS, css, fonts en index
	'./',
	'./index.html',
	'./browserconfig.xml',
	'./Database.php',
	'./Functions.php',
	'./assets/favicons/',
	'./assets/css/screen.css',
	'./assets/css/bootstrap.css',
	'./assets/js/script.js',
	'./assets/js/app.js',
	'./assets/js/bootstrap.js',
	'./assets/js/jquery-3.1.1.js',
	'./assets/js/pushnotifications.js',
	'./assets/img/AwkwardLogo.png',
	'./assets/img/favicon.ico',
	'./assets/img/friends2.jpg'
];

self.addEventListener('install', function(e) {
	//console.log('[Serviceworker] Installed');

	// e.waitUntil Delays the event until the Promise is resolved
	e.waitUntil(
		// Open the cache
		caches.open(cacheName).then(function(cache) {

			// Add all the default files to the cache
			//console.log('[Serviceworker] Caching cacheFiles');
			return cache.addAll(cacheFiles);
		})
	);
});

self.addEventListener('activate', function(e) {
	//console.log('[Serviceworker] Activated');

	e.waitUntil(
		// Get all the cache keys (cacheName)
		caches.keys().then(function(cacheNames) {
			return Promise.all(cacheNames.map(function(thisCacheName) {

				// If a cached item is saved under a previous cacheName
				if (thisCacheName !== cacheName) {

					// Delete that cached file
					//console.log('[Serviceworker] Removing Cached Files from Cache - ', thisCacheName);
					return caches.delete(thisCacheName);
				}
			}));
		})
	); // end e.waitUntil
});

self.addEventListener('fetch', function(e) {
	//console.log('[ServiceWorker] Fetch', e.request.url);


	// check if post request of
	// check if it is a redirect if so just send respond and dont safe page
	// but only when you are online
	if(navigator.onLine)
	{
		var resp = fetch(e.request);
		if(resp) {
			if (e.request.method === 'POST' || resp.status === '302') {
				return resp;
			}
		}
	}

	e.respondWith(
		caches.match(e.request)
		.then(function (response) {


			if(response){
				var cacheResponse = response.clone();
				if(cacheResponse) {
					if (!navigator.onLine) {
						return cacheResponse;
					}
				}
			}

			var fetchRequest = e.request.clone();

			// try fetching request
			return fetch(fetchRequest)
			.then(function (fetchresponse) {

				if(fetchresponse.status === '302') {
					return fetchresponse;
				}

				if (!fetchresponse) {
					//console.log("[Serviceworker] fetch unsuccesfull ", fetchRequest);

					return cacheResponse;
				}

				//console.log("[Serviceworker] fetch succesfull, ", fetchRequest);
				var responseToCache = fetchresponse.clone();

				caches.open(cacheName)
				.then(function (cache) {
					// update cache
					//console.log("[Serviceworker] Updating cache with new fetch", e.request, cacheName);
					cache.put(e.request, responseToCache);
				});

				return fetchresponse;

			})
			.catch(function (err) {
				//console.log("[Serviceworker] Error fetching returning cache ", err);

				return cacheResponse;
			});
		})
	)
});
