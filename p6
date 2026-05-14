<!DOCTYPE html>
<html>

<head>

    <title>Stock Display</title>

    <link rel="manifest" href="manifest.json">

    <style>

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }

    </style>

</head>

<body>

<center>

    <h2>Stock Market Data</h2>

    <div id="stock"></div>

</center>

<script>

    // Register service worker
    if ("serviceWorker" in navigator) {

        navigator.serviceWorker.register("sw.js");

    }

    // Read JSON data
    fetch("data.json")

    .then(res => res.json())

    .then(data => {

        let table =
        "<table>" +
        "<tr>" +
        "<th>Company</th>" +
        "<th>Initial Price</th>" +
        "<th>Price 2007</th>" +
        "<th>Symbol</th>" +
        "</tr>";

        data.forEach(item => {

            table +=
            "<tr>" +
            "<td>" + item.company + "</td>" +
            "<td>" + item.initial_price + "</td>" +
            "<td>" + item.price_2007 + "</td>" +
            "<td>" + item.symbol + "</td>" +
            "</tr>";

        });

        table += "</table>";

        document.getElementById("stock").innerHTML = table;

    });

</script>

</body>
</html>


[
  {
    "company": "3M",
    "initial_price": 44.28,
    "price_2007": 95.85,
    "symbol": "MMM"
  },

  {
    "company": "Amazon",
    "initial_price": 89.38,
    "price_2007": 93.43,
    "symbol": "AMZN"
  }
]



const files = [
  "./",
  "./index.html",
  "./manifest.json",
  "./data.json"
];

self.addEventListener("install", e => {
  e.waitUntil(
    caches.open("cache-v1")
      .then(cache => cache.addAll(files))
  );
});

self.addEventListener("activate", e => {
  console.log("Service Worker Activated");
});

self.addEventListener("fetch", e => {
  e.respondWith(
    caches.match(e.request)
      .then(response => response || fetch(e.request))
  );
});



{
  "name": "Stock Display",
  "short_name": "Stock",
  "start_url": "/",
  "display": "standalone",

  "background_color": "#00AA00",
  "theme_color": "#00CC00",

  "icons": [
    {
      "src": "assets/logo.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}