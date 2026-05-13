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